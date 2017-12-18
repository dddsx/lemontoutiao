package com.lemon213.controller;

import com.lemon213.pojo.Article;
import com.lemon213.pojo.Comment;
import com.lemon213.service.ArticleService;
import com.lemon213.service.CommentService;
import com.lemon213.util.DataFormatUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xiaobu
 * @describe 响应用户的文章阅读
 */
@Controller
public class ArticleReadController {
    @Resource
    private ArticleService articleService;
    @Resource
    private CommentService commentService;

    /**
     * @param articleId, 文章id, 根据这个参数查询出用户想要阅读的文章
     * @return 文章阅读页面
     */
    @RequestMapping(value = "/view/{articleId}")
    public String articleView(@PathVariable String articleId, Model model) {
        Integer int_articleId= Integer.parseInt(articleId);
        Article article = articleService.selectArticleById(int_articleId);
        if (article == null)
            return "/404.html"; //文章不存在则返回404
        List<Comment> commentList = commentService.selectCommentsByArticleId(int_articleId); //获取文章的评论列表

        //格式化评论日期输出
        for(Comment comment : commentList){
            comment.setShowTime(DataFormatUtil.dateFormat(comment.getGmtCreate()));
            //System.out.println(comment);
        }
        model.addAttribute("article", article);
        model.addAttribute("commentList", commentList);
        return "/article/view";
    }
}

