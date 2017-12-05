package com.lemon213.controller;

import com.lemon213.pojo.User;
import com.lemon213.service.UserPicService;
import com.lemon213.service.UserService;
import com.lemon213.util.FilePathManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.util.Date;
import java.util.Enumeration;
import java.util.UUID;

/**
 * @author xiaobu
 * @describe 响应用户的基本请求, 例如登录、注册等
 */
@Controller("userController")
@RequestMapping("/user")
public class UserController {

    private static final int DEFAULT_PIC_NUM = 89; //系统默认生成的头像数

    @Resource
    private UserService userService;
    @Resource
    private UserPicService userPicService;

    /**
     * @describe 根据请求, 转发到登录或者注册页面
     * @param formTo, 根据此URL片段, 判断是登录还是注册
     */
    @RequestMapping(value = "/{formTo}", method = RequestMethod.GET)
    public String loginOrRegister(@PathVariable String formTo){
        return "/user/" + formTo;
    }

    /**
     * @describe 登录校验
     * @return 返回登录成功或失败页面, 并给用户适当的提示信息
     */
    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    public ModelAndView loginCheck(ModelAndView mv, @Valid User user, Errors errors, Model model, HttpSession session){
        if(errors.hasErrors()){
            model.addAttribute("errorMessage", "用户名和密码要符合要求！");
            mv.setViewName("/user/login");
            return mv;
        }
        if((user=userService.selectUserByLogin(user)) == null){
            model.addAttribute("errorMessage", "用户名或密码错误");
            mv.setViewName("/user/login");
            return mv;
        } else {
            user.setShowName();
            session.setAttribute("sessionUser", user);
            String currentURL = (String) session.getAttribute("currentURL");
            if(currentURL != null){
                session.removeAttribute("currentURL");
                mv.setViewName("redirect:" + currentURL);
            } else {
                mv.setViewName("redirect:/article/news_hot");
            }
            return mv;
        }
    }

    /**
     * @describe 注册校验
     * @return 返回注册成功或失败页面, 并给用户适当的提示信息
     */
    @RequestMapping(value = "/registerCheck", method = RequestMethod.POST)
    public String registerCheck(@Valid User user, @RequestParam("re_password") String re_password, Errors errors, Model model){
        if(errors.hasErrors() || !user.getPassword().equals(re_password) || user.getEmail() == null){
            model.addAttribute("errorMessage", "请按照要求填写！");
            return "/user/register";
        }
        user.setNickname(user.getUsername());
        user.setGmtCreate(new Date());
        user.setGmtModified(new Date());
        int picture = 1 + (int) (Math.random()*DEFAULT_PIC_NUM); //为用户随机挑选头像
        user.setPicture(picture);
        if(!userService.trySaveUser(user)){
            model.addAttribute("errorMessage", "用户名已存在, 换个试试");
            return "/user/register";
        } else{
            return "/user/regSuccess";
        }
    }

    /**
     * @describe 用户注销
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        Enumeration<String> sessionAttris = session.getAttributeNames();
        while (sessionAttris.hasMoreElements()){
            session.removeAttribute(sessionAttris.nextElement());
        }
        session.invalidate();
        return "redirect:/article/news_hot";
    }

    /**
     * @describe 转发到用户个人空间, 页面内展示了用户的个人信息
     */
    @RequestMapping(value = "/myspace", method = RequestMethod.GET)
    public String personalSpace(Model model, HttpSession session){
        User sessionUser = (User)session.getAttribute("sessionUser");
        User user = userService.selectUserMessage(sessionUser.getId());
        if(user.getBirthday() != null) {
            java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
            String birthday = df.format(user.getBirthday());
            model.addAttribute("birthday", birthday);
        }
        System.out.println(user);
        model.addAttribute("user_message", user);
        return "/user/myspace";
    }

    /**
     * @describe 响应用户的个人信息修改请求, 如果修改失败, 给出适当的提示信息
     */
    @RequestMapping(value = "/change_message", method = RequestMethod.POST)
    public String changeMessage(@RequestParam(required = false) String nickname,
                                @RequestParam(required = false) String gender,
                                @RequestParam(required = false) String job,
                                @RequestParam(required = false) String birthday,
                                @RequestParam(required = false) String location,
                                @RequestParam(required = false) String introduce,
                                @RequestParam(value = "headPic", required = false) MultipartFile headPic,
                                HttpServletRequest request,
                                RedirectAttributes ra, HttpSession session) throws Exception{
        User sessionUser = (User)session.getAttribute("sessionUser");
        User user = new User();
        user.setId(((User)session.getAttribute("sessionUser")).getId());
        user.setNickname(nickname);
        user.setGender(gender);
        user.setJob(job);
        user.setLocation(location);
        user.setIntroduce(introduce);
        user.setGmtModified(new Date());
        if(birthday != null && !birthday.equals("")) {
            user.setBirthday(new java.text.SimpleDateFormat("yyyy-MM-dd").parse(birthday));
        }

        //上传用户头像, 如上传失败则不执行后面的用户资料更新操作
        if(headPic != null && !headPic.isEmpty()){
            String filename = headPic.getOriginalFilename();
            String fileExt = filename.substring(filename.lastIndexOf(".") + 1, filename.length());
            String path = request.getServletContext().getRealPath(FilePathManager.getHeadPicPath());
            fileExt = fileExt.toLowerCase();
            if (!"jpg".equals(fileExt) && !"jpeg".equals(fileExt) && !"png".equals(fileExt) && !"bmp".equals(fileExt)
                    && !"gif".equals(fileExt)) {
                ra.addFlashAttribute("errorMessage", "上传头像失败, 文件格式不正确！");
                return "redirect:/user/myspace";
            } else if(headPic.getInputStream().available() > 2097125){
                ra.addFlashAttribute("errorMessage", "上传头像失败, 文件太大！");
                return "redirect:/user/myspace";
            } else {
                String generateFilename = UUID.randomUUID().toString() + ".jpg";
                headPic.transferTo(new File(path + generateFilename));
                Integer headPicId = userPicService.saveUserHeadPic(generateFilename);
                boolean result = userService.updateUserHeadPic(sessionUser.getId(), headPicId);
                if(result){
                    sessionUser.setPicName(generateFilename);
                } else {
                    ra.addFlashAttribute("errorMessage", "上传头像失败！");
                    return "redirect:/user/myspace";
                }
            }
        }

        if(user.getNickname() == null || user.getNickname().equals("")){
            ra.addFlashAttribute("errorMessage", "昵称不能为空！");
        }
        else if(!userService.tryUpdateUser(user, sessionUser.getNickname())){
            ra.addFlashAttribute("errorMessage", "昵称已存在！");
        } else{
            sessionUser.setNickname(nickname);
            sessionUser.setShowName();
            session.setAttribute("sessionUser", sessionUser);
        }
        return "redirect:/user/myspace";
    }
}
