package com.lemon213.mapper;

import com.lemon213.pojo.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {
    int saveArticleComment(Comment comment);

    List<Comment> selectCommentsByArticleId(Integer id);
}
