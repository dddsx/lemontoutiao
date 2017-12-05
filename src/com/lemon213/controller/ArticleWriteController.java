package com.lemon213.controller;

import com.lemon213.pojo.Article;
import com.lemon213.pojo.User;
import com.lemon213.service.ArticleService;
import com.lemon213.util.Uploader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @author xiaobu
 * @describe 处理用户的文章编写请求
 */
@Controller("newsController")
public class ArticleWriteController {
    @Resource
    private ArticleService articleService;

    /**
     * @describe 响应用户的文章发表请求, 保存文章信息到数据库, 并给用户返回提示信息
     */
    @RequestMapping("/commitArticle")
    public String commitArticle(Article article, HttpSession session, Model model, RedirectAttributes ra, HttpServletRequest request){
        //文章内容或标题为空, 则不给予发表
        if(article.getContent() == null || article.getContent().equals("") ||
                article.getHeadline() == null || article.getHeadline().equals("")){
            ra.addFlashAttribute("errorMessage", "标题和内容不能为空");
            return "redirect:/write";
        }
        System.out.println(article.getContent());
        User user = (User) session.getAttribute("sessionUser");
        article.setUserId(user.getId());
        article.setGmtCreate(new Date());
        article.setGmtModified(new Date());

        //获取文章里的第一张图片作为封面图, 如果文章不含图片, 则为其设置默认图片
        int imgTagIndex = article.getContent().indexOf("<img");
        if (imgTagIndex != -1) {
            int imgSrcIndex = article.getContent().indexOf("src=", imgTagIndex);
            int imgSrcStart = imgSrcIndex + 5;
            int imgSrcEnd = article.getContent().indexOf("\"", imgSrcStart);
            String coverImg = article.getContent().substring(imgSrcStart, imgSrcEnd);
            //System.out.println(coverImg);
            article.setPicture(coverImg);
        } else {
            article.setPicture(request.getContextPath() + "/img/materia/notcoverimg.jpg");
        }

        int articleId;
        if((articleId = articleService.saveArticle(article)) > 0) {
            model.addAttribute("articleId", articleId);
        }
        else {
            model.addAttribute("errorMessage", "发表失败....");
        }
        return "/editor/commit";
    }
}
