package com.lemon213.mapper;

import com.lemon213.pojo.Article;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ArticleMapper {
    //根据文章id, 查询出文章的信息、内容
    Article selectArticleById(int id);

    //根据文章类型id, 起始索引和筛选数查询文章
    List<Article> selectArticleByCategory(int id, int startIndex, int selectNum);

    //根据起始索引和筛选数查询推荐文章
    List<Article> selectRecommendArticle(int startIndex, int selectNum);

    //根据文章类型id, 查询出该类型文章的总数
    int selectCountByCategory(int id);

    //查询推荐文章总数
    int selectRecomArticleCount();

    //保存文章的基本信息
    int saveArticleInfo(Article article);

    //根据文章id, 保存该篇文章的内容到数据库
    int saveArticleContent(int id, String content);

    //使该篇文章的点赞数+1
    int addArticlePraiseNum(int articleId);

    //查询有哪些用户为该文章点过赞
    String selectArticlePraiseUsers(int articleId);

    //由于数据库的某些特殊性, 记录第一个为该文章点赞的用户需要这么做
    int setFirstPraiseUser(String userId, int articleId);

    //根据用户id和文章id, 把用户添加到该文章的点赞列表
    int addPraiseUser(String userId, int articleId);

    //根据文章id, 给文章评论数+1
    int addArticleCommentNum(Integer articleId);

    //给文章的点击数+1
    int addArticleClickNum(int articleId);

    //根据文章类别和是否审核来查询文章
    List<Article> selectArticleByCategoryAndIsCheck(Map<String, Object> params);

    //根据是否审核来查询推荐文章
    List<Article> selectRecomArticleByIsCheck(Map<String, Object> params);

    //根据种类和是否审核计算文章数
    int selectCountByCategoryAndIsCheck(Map<String, Object> params);

    //根据是否审核计算推荐文章数
    int selectRecomCountByIsCheck(Map<String, Object> params);
}
