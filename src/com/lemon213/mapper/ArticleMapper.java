package com.lemon213.mapper;

import com.lemon213.pojo.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleMapper {
    //根据文章id, 查询出文章的信息、内容
    Article selectArticleById(int id);

    /**
     * @param id, 文章类型id
     * @param startIndex, 筛选时的起始索引
     * @param selectNum, 筛选数
     * @return 同一类型的数篇文章
     */
    List<Article> selectArticleByCategory(int id, int startIndex, int selectNum);

    //根据文章类型id, 查询出该类型文章的总数
    int selectCountByCategory(int id);

    //查询最新数据库自动生成的主键id
    int selectLastId();

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
}
