package com.lemon213.service;

import com.lemon213.pojo.Article;

import java.util.List;
import java.util.Map;

public interface ArticleService {
    int selectCountByCategory(int categoryId);

    int selectRecomArticleCount();

    List<Article> selectArticleByCategory(int categoryId, int startIndex, int selectNum);

    List<Article> selectRecommendArticle(int startIndex, int selectNum);

    int saveArticle(Article article);

    Article selectArticleById(int articleId);

    boolean praiseArticle(int articleId, String userId, int editorId);

    List<Article> selectArticleByCategoryAndIsCheck(Integer categoryId, Integer isCheck, Integer startIndex, Integer selectNum);

    List<Article> selectRecomArticleByIsCheck(Integer isCheck, Integer startIndex, Integer selectNum);

    int selectCountByCategoryAndIsCheck(Integer categoryId, Integer isCheck);

    int selectRecomCountByIsCheck(Integer isCheck);
}
