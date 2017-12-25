package com.lemon213.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lemon213.pojo.Article;
import com.lemon213.pojo.ImgData;
import com.lemon213.pojo.User;
import com.lemon213.service.ArticleService;
import com.lemon213.service.UserPicService;
import com.lemon213.service.UserService;
import com.lemon213.util.DataFormatUtil;
import com.lemon213.util.FilePathManager;
import com.lemon213.util.ImgTailor;
import com.lemon213.util.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.util.*;

/**
 * @author xiaobu
 * @describe 响应用户的基本请求, 例如登录、注册等
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private static final int DEFAULT_PIC_NUM = 89; //系统默认生成的头像数

    private static final int PAGE_SIZE = 10;

    @Resource
    private UserService userService;
    @Resource
    private UserPicService userPicService;
    @Resource
    private ArticleService articleService;

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
        String currentURL = (String) session.getAttribute("currentURL");

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
            if(currentURL != null){
                mv.setViewName("redirect:" + currentURL);
            } else {
                mv.setViewName("redirect:/article/news_recommend");
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
        return "redirect:/article/news_recommend";
    }

    /**
     * @describe 转发到用户个人空间, 页面内展示了用户的个人信息
     */
    @RequestMapping(value = "/myspace", method = RequestMethod.GET)
    public String personalSpace(Model model, HttpSession session){
        User sessionUser = (User)session.getAttribute("sessionUser");
        User user = userService.selectUserMessage(sessionUser.getId());
        model.addAttribute("user_message", user);

        //如果用户是作者，查询用户编写的文章
        if(sessionUser.getIsEditor()){
            List<Article> articleList = articleService.selectArticleByUserId(sessionUser.getId(), 0, PAGE_SIZE);
            model.addAttribute("articleList", articleList);
        }
        return "/user/myspace";
    }

    /**
     * @describe 以ajax方式, 根据用户请求的页数, 加载出更多该用户编写的文章, 如无更多文章, 给出适当提示。
     * 为了防止文章重复加载, 里面用到了类似分页的技术
     * @param map，包含了用户请求页数
     * @return 新的文章以及一些提示性信息
     */
    @RequestMapping(value = "/moreArticle", method = RequestMethod.POST)
    public ModelAndView reloadArticle(@RequestBody Map<String, Object> map, HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setView(new MappingJackson2JsonView());
        User sessionUser = (User) session.getAttribute("sessionUser");
        Integer page = (Integer) map.get("page");
        int totalItem = articleService.selectArticleOfUserCount(sessionUser.getId());

        System.out.println("总条目数：" + totalItem +" 请求页数：" + page);

        PageInfo pageInfo = new PageInfo(totalItem, PAGE_SIZE, page);
        pageInfo.Init();

        if(page > pageInfo.getTotalPage()){
            mv.addObject("message", "noMoreArticle");
            return mv;
         }
        List<Article> articleList = articleService.selectArticleByUserId(sessionUser.getId(), pageInfo.getStartIndex(), pageInfo.getSelectNum());
        mv.addObject("message", "loading");
        mv.addObject("articleList", articleList);
        return mv;
    }

    /**
     * @describe 响应用户的个人信息修改请求, 如果修改失败, 给出适当的提示信息
     */
    @RequestMapping(value = "/change_message", method = RequestMethod.POST)
    public String changeMessage(User user, RedirectAttributes ra, HttpSession session) throws Exception{
        User sessionUser = (User)session.getAttribute("sessionUser");
        user.setId(((User)session.getAttribute("sessionUser")).getId());
        if(user.getNickname() == null || user.getNickname().equals("")){
            ra.addFlashAttribute("errorMessage", "昵称不能为空！");
        }
        else if(!userService.tryUpdateUser(user, sessionUser.getNickname())){
            ra.addFlashAttribute("errorMessage", "昵称已存在！");
        } else{
            sessionUser.setNickname(user.getNickname());
            sessionUser.setShowName();
            session.setAttribute("sessionUser", sessionUser);
        }
        return "redirect:/user/myspace";
    }

    @RequestMapping(value = "/imgUpload", method = RequestMethod.POST)
    public void reloadArticle(String avatar_data, HttpServletResponse response, HttpServletRequest request,
                              @RequestParam(value = "avatar_file") MultipartFile avatar_file) throws Exception {
        User sessionUser = (User) request.getSession().getAttribute("sessionUser");
        PrintWriter out = response.getWriter();
        if (avatar_file != null && !avatar_file.isEmpty()) {
            String filename = avatar_file.getOriginalFilename();
            String fileExt = filename.substring(filename.lastIndexOf(".") + 1, filename.length());
            fileExt = fileExt.toLowerCase();
            if (!"jpg".equals(fileExt) && !"jpeg".equals(fileExt) && !"png".equals(fileExt) && !"bmp".equals(fileExt)
                    && !"gif".equals(fileExt)) {
                out.print("文件格式不正确");
            } else if (avatar_file.getInputStream().available() > 2097125) { //2M
                out.print("文件过大");
            } else {
                ImgData imgData = JSON.parseObject(avatar_data, ImgData.class);
                if(imgData.getX() < 0|| imgData.getY() < 0){
                    out.print("截取方式错误");
                    return;
                }
                String generateFilename = UUID.randomUUID().toString() + "." + fileExt;
                String headPicPath = request.getServletContext().getRealPath(FilePathManager.getHeadPicPath());
                OutputStream imgOutStream = new FileOutputStream(new File(headPicPath + File.separator + generateFilename));
                ImgTailor.cutImage(avatar_file.getInputStream(), imgOutStream, imgData, fileExt, fileExt);
                Integer headPicId = userPicService.saveUserHeadPic(generateFilename);
                userService.updateUserHeadPic(sessionUser.getId(), headPicId);
                sessionUser.setPicName(generateFilename);
                JSONObject json = new JSONObject();
                json.put("result", "../" + FilePathManager.getHeadPicPath() + "/"  + generateFilename);
                out.print(json.toJSONString());
            }
        } else {
            out.print("文件不能为空");
        }
    }
}
