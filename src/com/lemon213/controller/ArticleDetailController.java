package com.lemon213.controller;

import com.lemon213.pojo.Comment;
import com.lemon213.pojo.User;
import com.lemon213.service.ArticleService;
import com.lemon213.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

/**
 * @author xiaobu
 * @describe 处理文章的其他细节请求, 例如点赞、评论
 */
@Controller("articleDetailController")
public class ArticleDetailController {
    @Resource
    private ArticleService articleService;
    @Resource
    private CommentService commentService;

    /**
     * @describe 以ajax方式, 实现文章点赞功能
     * @param map, 内含作者id、文章id
     * @param session, 内含当前进行会话的用户, 从中读取进行点赞的用户信息
     */
    @RequestMapping(value = "/articlePraise", method = RequestMethod.POST)
    public void articlePraise(@RequestBody Map<String, Object> map, HttpSession session,
                              HttpServletResponse response) throws Exception {
        Integer articleId = (Integer) map.get("articleId");
        Integer editorId = (Integer) map.get("editorId");
        User sessionUser = (User) session.getAttribute("sessionUser");
        if (sessionUser == null) {
            response.getWriter().print("login");  //未登陆则提醒用户转向登录界面
            return;
        }
        String userId = sessionUser.getId().toString();
        //System.out.println(articleId +" " + editorId + " " + userId);
        if (articleService.praiseArticle(articleId, userId, editorId)) {
            response.getWriter().print("success"); //点赞成功
        } else {
            response.getWriter().print("repeat");  //重复点赞
        }
    }

    /**
     * @describe 实现文章评论功能
     * @param comment, 内含评论的信息
     */
    @RequestMapping(value = "/articleComment", method = RequestMethod.POST)
    public String articleComment(Comment comment, HttpSession session, HttpServletRequest request) {
        String currentURL = request.getHeader("referer"); //获得用户所处URL

        //不让用户发表空评论
        if(comment.getContent() == null || comment.getContent().equals("")){
            request.setAttribute("commentError", "评论发表失败");
            return "redirect:" + currentURL;
        }

        User sessionUser = (User) session.getAttribute("sessionUser");
        Integer userId = sessionUser.getId();
        Date now = new Date();
        comment.setUserId(userId);
        comment.setGmtModified(now);
        comment.setGmtCreate(now);
        System.out.println(comment);
        if(commentService.submitComment(comment)) //如果评论成功
            return "redirect:" + currentURL;
        else {
            request.setAttribute("commentError", "评论发表失败");
            return "redirect:" + currentURL;
        }
    }
}
