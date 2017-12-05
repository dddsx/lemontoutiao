package com.lemon213.service.impl;
import com.lemon213.mapper.ArticleMapper;
import com.lemon213.mapper.UserMapper;
import com.lemon213.pojo.Article;
import com.lemon213.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xiaobu
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService{
    @Resource
    private ArticleMapper articleMapper;
    @Resource
    private UserMapper userMapper;

    /**
     * @describe 根据文章类型id, 返回该类型的文章总数
     */
    public int selectCountByCategory(int categoryId){
        return articleMapper.selectCountByCategory(categoryId);
    }

    /**
     * @describe 根据文章类型id, 起始索引, 筛选数, 返回数篇该类型的文章
     */
    public List<Article> selectArticleByCategory(int categoryId, int startIndex, int selectNum){
        return articleMapper.selectArticleByCategory(categoryId, startIndex, selectNum);
    }

    /**
     * @describe 尝试保存文章到数据库
     * @param article, 内含文章的基本信息
     * @return 如果保存成功, 返回数据库最新生成的文章id, 否则返回-1
     */
    public int saveArticle(Article article){
        int result = articleMapper.saveArticleInfo(article);
        int articleId;
        if(result == 1){
            articleId = articleMapper.selectLastId(); //插入文章记录后, 获得数据库自动生成的文章id
        } else {
            return -1;
        }
        if(articleMapper.saveArticleContent(articleId, article.getContent())==1){ //根据生成的文章id, 保存文章的内容
            return articleId;
        } else{
            return -1;
        }
    }

    /**
     * @describe 根据文章id, 返回文章的所有信息、内容, 实现用户阅读文章功能
     */
    public Article selectArticleById(int articleId){
        articleMapper.addArticleClickNum(articleId); //文章点击数+1
        return articleMapper.selectArticleById(articleId);
    }

    /**
     * @describe 用户为文章点赞, 如果点赞成功, 给作者涨一枚柠檬币
     * @param articleId, 被点赞的文章id
     * @param userId, 点赞的用户id
     * @param editorId, 文章的作者id
     * @return boolean型, 如果用户点过赞则返回false, 其他正常情况下返回true
     */
    public boolean praiseArticle(int articleId, String userId, int editorId){
        String userList = articleMapper.selectArticlePraiseUsers(articleId);
        if(userList != null && !userList.equals("")) {
            String[] users = userList.split(",");
            for (String user : users) {
                if (user.equals(userId)) {
                    return false;
                }
            }
            articleMapper.addPraiseUser(userId, articleId);
        } else {
            articleMapper.setFirstPraiseUser(userId, articleId);
        }
        articleMapper.addArticlePraiseNum(articleId);
        Integer editorUserId = userMapper.selectUserIdByEditorId(editorId); //获取该作者的用户id, 以便给他涨币
        userMapper.updateUserMoney(editorUserId, 1); //给被点赞的作者增加1枚柠檬币
        return true;
    }
}
