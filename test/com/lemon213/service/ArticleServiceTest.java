package com.lemon213.service;

import com.lemon213.mapper.ArticleMapper;
import com.lemon213.pojo.Article;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class ArticleServiceTest {
    @Resource
    private ArticleService articleService;

    @Test
    public void testSelectArticleByCategory(){
        List<Article> articleList = articleService.selectArticleByCategory(4 , 0 , 5);
        for (Article article : articleList){
            System.out.println(article);
        }
    }

    @Test
    public void testPraiseArticle(){
        boolean result = articleService.praiseArticle(53196182,"20170003" , 20171123);
        System.out.println(result);
    }
}
