package com.lemon213.mapper;

import com.lemon213.pojo.Comment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class CommentMapperTest {
    @Resource
    private CommentMapper commentMapper;

    @Test
    public void testSaveArticleComment(){
        Comment comment = new Comment();
        comment.setArtId(53196226);
        comment.setUserId(20170010);
        comment.setContent("好玩个锤子！");
        comment.setGmtCreate(new Date());
        comment.setGmtModified(new Date());
        commentMapper.saveArticleComment(comment);
    }

    @Test
    public void testSelectCommentsByArticleId(){
        List<Comment> commentList = commentMapper.selectCommentsByArticleId(53196226);
        for (Comment comment : commentList) {
            System.out.println(comment);
        }
    }
}