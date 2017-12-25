package com.lemon213.service;

import com.lemon213.pojo.Comment;

import java.util.List;

public interface CommentService {
    boolean submitComment(Comment comment);

    List<Comment> selectCommentsByArticleId(Integer id);

    boolean addPraiseNum(Integer commentId);
}
