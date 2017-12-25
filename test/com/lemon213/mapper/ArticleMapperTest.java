package com.lemon213.mapper;

import com.lemon213.pojo.Article;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class ArticleMapperTest {
    @Resource
    private ArticleMapper articleMapper;

    @Test
    public void testSelectArticleById(){
        Article article = articleMapper.selectArticleById(1);
        System.out.println(article);
        System.out.println(article.getUser());
        System.out.println(article.getUser().getEditor());
    }

    @Test
    public void testSelectArticleByCategory(){
        List<Article> articleList = articleMapper.selectLegalArticleByCategory(4, 10 , 30);
        for (Article anArticleList : articleList) {
            System.out.println(anArticleList);
        }
    }

    @Test
    public void testUpdateArticlePraiseNum(){
        int result = articleMapper.addArticlePraiseNum(53196181);
    }

    @Test
    public void testSelectArticlePraiseUser(){
        String users = articleMapper.selectArticlePraiseUsers(53196181);
        System.out.println(users);
    }

    @Test
    public void testSelectArticleByCategoryAndIsCheck(){
        HashMap<String, Object> params = new HashMap<>();
        params.put("startIndex", 0);
        params.put("selectNum",20);
        List<Article> articleList = articleMapper.selectArticleByCategoryAndIsCheck(params);
        for (Article anArticleList : articleList) {
            System.out.println(anArticleList);
        }
    }

    @Test
    public void testSelectRecomArticleByIsCheck(){

    }
}
