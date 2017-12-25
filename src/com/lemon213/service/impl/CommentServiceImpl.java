package com.lemon213.service.impl;

import com.lemon213.mapper.ArticleMapper;
import com.lemon213.mapper.CommentMapper;
import com.lemon213.pojo.Comment;
import com.lemon213.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xiaobu
 * @describe 管理文章的评论事务
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService{
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private ArticleMapper articleMapper;

    /**
     * @describe 用户发表评论
     * @param comment, 内含评论内容, 文章id, 用户id等信息
     * @return 发表成功则返回true
     */
    public boolean submitComment(Comment comment) {
        int result = commentMapper.saveArticleComment(comment);
        if(result ==1){
            articleMapper.addArticleCommentNum(comment.getArtId()); //给该文章评论数+1
            return true;
        }
        return false;
    }

    /**
     * @describe 根据文章id查询该文章的所有评论内容
     * @param id, 文章的id
     * @return 评论集合
     */
    public List<Comment> selectCommentsByArticleId(Integer id) {
        return commentMapper.selectCommentsByArticleId(id);
    }

    /**
     * @describe 使该评论点赞数加1
     * @param commentId, 评论id
     * @return 成功则返回true
     */
    public boolean addPraiseNum(Integer commentId){
        return commentMapper.addPraiseNum(commentId) == 1;
    }
}
