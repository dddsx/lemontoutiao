package com.lemon213.service;

import com.lemon213.pojo.Article;

import java.util.List;

public interface ArticleService {
    int selectCountByCategory(int categoryId);

    List<Article> selectArticleByCategory(int categoryId, int startIndex, int selectNum);

    int saveArticle(Article article);

    Article selectArticleById(int articleId);

    boolean praiseArticle(int articleId, String userId, int editorId);
}
