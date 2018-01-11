package com.lemon213.util;

import com.lemon213.pojo.Article;
import com.lemon213.service.ArticleService;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.TimerTask;

public class WeekHotTimerTask extends TimerTask{
    private ArticleService articleService;

    private ServletContext application;

    public void setApplication(ServletContext application) {
        this.application = application; //通过监听器将这个application对象set进来，因为这里是无法拿application对象的
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    @Override
    public void run() {
        List<Article> articleList = articleService.selectWeekHotArticle();
        application.setAttribute("weekHotArticles", articleList);
        for (Article article : articleList) {
            System.out.println(article);
        }
    }
}
