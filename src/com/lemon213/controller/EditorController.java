package com.lemon213.controller;

import com.lemon213.pojo.Article;
import com.lemon213.pojo.Editor;
import com.lemon213.pojo.User;
import com.lemon213.service.ArticleService;
import com.lemon213.service.EditorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @author xiaobu
 * @describe 主要用于响应和小编板块相关的请求
 */
@Controller
public class EditorController {
    @Resource
    private EditorService editorService;
    @Resource
    private ArticleService articleService;

    /**
     * @describe 转发到文章编写页面
     */
    @RequestMapping("/write")
    public String writeArticle(){
        return "/editor/write";
    }

    /**
     * @describe 转发到实名信息填写页面(成为小编的必经之路)
     */
    @RequestMapping("/beEditor")
    public String becomeEditor(){
        return "/editor/beEditor";
    }

    /**
     *@describe 用户填写实名信息后, 保存信息到数据库, 并使用户具有编写文章权限
     */
    @RequestMapping("/saveEditor")
    public String saveEditor(String agree, Editor editor, RedirectAttributes ra, HttpSession session){
        User sessionUser = (User) session.getAttribute("sessionUser");
        if(!agree.trim().equals("我同意")){
            ra.addFlashAttribute("errorMessage", "你必须先同意遵守规章");
            return "redirect:/beEditor";
        }
        int editorId;
        if((editorId = editorService.becomeEditor(editor, sessionUser.getId())) > 0){
            sessionUser.setIsEditor(true);
            sessionUser.setEditorId(editorId);
            sessionUser.setEditor(editorService.selectEditorById(editorId));
            session.setAttribute("sessionUser", sessionUser);
            String URL = (String) session.getAttribute("goURL");
            session.removeAttribute("goURL");
            if(URL != null)
                return "redirect:" + URL;
            else
                return "redirect:/article/news_hot";
        }
        else
            return "redirect:/article/news_hot";
    }

    /**
     * @describe 转向修改文章页面
     */
    @RequestMapping("/updateArticleForm")
    public String updateArticleForm(Integer articleId, HttpSession session, Model model){
        User sessionUser = (User) session.getAttribute("sessionUser");
        Article article = articleService.selectArticleById(articleId);
        if (article == null)
            return "/404.html"; //文章不存在则返回404
        if(!sessionUser.getId().equals(article.getUserId())){
            return "redirect:/send/illegal";
        }
        model.addAttribute("article", article);
        return "/editor/updateArticle";
    }

    /**
     * @describe 响应用户更新文章的请求
     */
    @RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
    public String updateArticle(Article article, RedirectAttributes ra){
        //文章内容或标题为空, 则不给予发表
        if(article.getContent() == null || article.getContent().equals("") ||
                article.getHeadline() == null || article.getHeadline().equals("")){
            ra.addFlashAttribute("errorMessage", "标题和内容不能为空");
            return "redirect:/updateArticleForm?articleId=" + article.getId();
        }
        article.setGmtModified(new Date());
        articleService.updateArticle(article);
        return "redirect:/success";
    }

    /**
     * @describe 响应用户删除文章的请求
     */
    @RequestMapping("/deleteArticle")
    public String deleteArticle(Integer articleId, HttpSession session){
        if(articleId != null) {
            articleService.deleteArticleById(articleId);
        } else {
            return "/404.html";
        }
        return "redirect:/user/myspace";
    }
}
