package com.lemon213.controller;

import com.lemon213.pojo.Article;
import com.lemon213.pojo.User;
import com.lemon213.service.ArticleService;
import com.lemon213.util.FilePathManager;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sun.misc.BASE64Decoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * @author xiaobu
 * @describe 处理用户的文章编写请求
 */
@Controller
public class ArticleWriteController {
    @Resource
    private ArticleService articleService;

    /**
     * @describe 上传文章封面
     */
    @RequestMapping(value = "/uploadArticleCover", method = RequestMethod.POST)
    public void uploadCover(String dataURL, HttpServletRequest request, HttpServletResponse response) throws Exception{
        dataURL = dataURL.substring(dataURL.indexOf(",") + 1);//截掉头部信息
        BASE64Decoder base64Decoder = new BASE64Decoder();
        byte[] bytes = base64Decoder.decodeBuffer(dataURL);
        String fileName = UUID.randomUUID().toString() + "." + "jpg";
        String path = request.getServletContext().getRealPath(FilePathManager.getCoverPath());
        //System.out.println(path);
        FileUtils.writeByteArrayToFile(new File(path, fileName), bytes);
        response.getWriter().print(fileName);
    }

    /**
     * @describe 响应用户的文章发表请求, 保存文章信息到数据库, 并给用户返回提示信息
     */
    @RequestMapping(value = "/commitArticle", method = RequestMethod.POST)
    public String commitArticle(Article article, HttpSession session, Model model, RedirectAttributes ra, HttpServletRequest request){
        User user = (User) session.getAttribute("sessionUser");
        if(user == null){
            return "redirect:/send/timeout";
        }

        Date now = new Date();

        //判断用户是否发表文章过于频繁，两次间隔应该大于5分钟
        Map<String, Date> writeTimeMap = (Map<String, Date>)request.getServletContext().getAttribute("writeTimeMap");
        String sessionId = session.getId();
        Date lastWriteTime = writeTimeMap.get(sessionId);
        if(lastWriteTime != null){
            if((now.getTime() - lastWriteTime.getTime())/(1000*60) < 5){
                return "/editor/fail";
            }
        }

        //文章标题、封面或内容为空, 则不给予发表
        if(article.getContent() == null || article.getContent().equals("") ||
                article.getHeadline() == null || article.getHeadline().equals("") ||
                article.getCover() == null || article.getCover().equals("")){
            ra.addFlashAttribute("errorMessage", "标题、封面和内容不能为空");
            return "redirect:/write";
        }
        //段子版块文章不应含有图片
        if(article.getCategoryId() == 14 && article.getContent().contains("<img")){
            ra.addFlashAttribute("errorMessage", "段子中不应含有图片");
            return "redirect:/write";
        }
        article.setUserId(user.getId());
        article.setGmtCreate(now);
        article.setGmtModified(now);
        articleService.saveArticle(article);
        writeTimeMap.put(sessionId, now);
        return "redirect:/success";
    }

    /**
     * @describe 转向发表成功页面
     */
    @RequestMapping(value = "/success")
    public String writeSuccess(){
        return "editor/success";
    }
}
