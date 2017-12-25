package com.lemon213.mapper;

import com.lemon213.pojo.Article;
import org.springframework.stereotype.Repository;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public interface ArticleMapper {
    //根据文章id, 查询出文章的信息、内容
    Article selectArticleById(int id);

    //根据文章类型id, 起始索引和筛选数查询通过审核的文章
    List<Article> selectLegalArticleByCategory(int id, int startIndex, int selectNum);

    //根据起始索引和筛选数查询通过审核的推荐文章
    List<Article> selectLegalRecommendArticle(int startIndex, int selectNum);

    //根据文章类型id, 查询出该类型通过审核的文章的数
    int selectLegalCountByCategory(int id);

    //查询通过审核的推荐文章数
    int selectLegalRecomArticleCount();

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

    //根据文章Id将文章删除
    int deleteArticleById(Integer articleId);

    //更新文章的审核状态
    int updateArticleIsCheck(Integer articleId, boolean isCheck, Integer checker);

    //更新文章的推荐状态
    int updateArticleIsRecom(Integer articleId, boolean isRecom);

    //根据起始索引和筛选数查询用户的文章
    List<Article> selectArticleByUserId(Integer userId, Integer startIndex, Integer selectNum);

    //根据用户id查询该用户编写的文章总数
    int selectArticleOfUserCount(Integer userId);

    //查询本周热门新闻
    List<Article> selectWeekHotArticle();

    int updateArticle(Integer articleId, String headline, Integer category, Date gmtModified);

    int updateArticleContent(Integer articleId, String content);
}
