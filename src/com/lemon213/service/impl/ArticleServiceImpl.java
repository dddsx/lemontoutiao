package com.lemon213.service.impl;

import com.lemon213.mapper.ArticleMapper;
import com.lemon213.mapper.EditorMapper;
import com.lemon213.mapper.UserMapper;
import com.lemon213.pojo.Article;
import com.lemon213.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xiaobu
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService{
    @Resource
    private ArticleMapper articleMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private EditorMapper editorMapper;

    /**
     * @describe 根据文章类型id, 返回该类型的文章总数
     */
    public int selectCountByCategory(int categoryId){
        return articleMapper.selectLegalCountByCategory(categoryId);
    }

    /**
     * @describe 根据文章类型id, 起始索引, 筛选数, 返回数篇该类型的文章
     */
    public List<Article> selectArticleByCategory(int categoryId, int startIndex, int selectNum){
        return articleMapper.selectLegalArticleByCategory(categoryId, startIndex, selectNum);
    }

    /**
     * @describe 尝试保存文章到数据库
     * @param article, 内含文章的基本信息
     * @return 如果保存成功, 返回数据库最新生成的文章id
     */
    public int saveArticle(Article article){
        articleMapper.saveArticleInfo(article);
        articleMapper.saveArticleContent(article.getId(), article.getContent()); //根据生成的文章id, 保存文章的内容
        editorMapper.addEditorPubNum(article.getUserId());
        return article.getId();
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

    /**
     * @describe 检查用户是否已给该文章点过赞
     */
    public boolean havePraise(Integer articleId, String userId){
        String userList = articleMapper.selectArticlePraiseUsers(articleId);
        if(userList == null || userList.equals(""))
            return false;
        String[] users = userList.split(",");
        for (String user : users)
            if (user.equals(userId))
                return true;
        return false;
    }

    /**
     * @describe 根据起始索引, 筛选数, 返回推荐文章
     */
    public List<Article> selectRecommendArticle(int startIndex, int selectNum) {
        return articleMapper.selectLegalRecommendArticle(startIndex, selectNum);
    }

    /**
     * @describe 返回推荐文章的总数目
     */
    public int selectRecomArticleCount() {
        return articleMapper.selectLegalRecomArticleCount();
    }

    /**
     * @describe 根据文章类别和是否审核来查询文章
     */
    public List<Article> selectArticleByCategoryAndIsCheck(Integer categoryId, Integer isCheck, Integer startIndex, Integer selectNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("categoryId", categoryId);
        params.put("isCheck", isCheck);
        params.put("startIndex", startIndex);
        params.put("selectNum", selectNum);
        return articleMapper.selectArticleByCategoryAndIsCheck(params);
    }

    /**
     * @describe 根据是否审核来查询推荐文章
     */
    public List<Article> selectRecomArticleByIsCheck(Integer isCheck, Integer startIndex, Integer selectNum) {
        Map<String, Object> params = new HashMap<>();
        params.put("isCheck", isCheck);
        params.put("startIndex", startIndex);
        params.put("selectNum", selectNum);
        return articleMapper.selectRecomArticleByIsCheck(params);
    }

    /**
     * @describe 根据种类和是否审核计算文章数
     */
    public int selectCountByCategoryAndIsCheck(Integer categoryId, Integer isCheck) {
        Map<String, Object> params = new HashMap<>();
        params.put("isCheck", isCheck);
        params.put("categoryId", categoryId);
        return  articleMapper.selectCountByCategoryAndIsCheck(params);
    }

    /**
     * @describe 根据是否审核计算推荐文章数
     */
    public int selectRecomCountByIsCheck(Integer isCheck) {
        Map<String, Object> params = new HashMap<>();
        params.put("isCheck", isCheck);
        return articleMapper.selectRecomCountByIsCheck(params);
    }

    /**
     * @describe 根据文章id删除文章
     */
    public int deleteArticleById(Integer articleId){
        return articleMapper.deleteArticleById(articleId);
    }

    /**
     * @describe 根据文章id更新文章的审核状态
     */
    public int updateArticleIsCheck(Integer articleId, boolean isCheck, Integer checker){
        return articleMapper.updateArticleIsCheck(articleId, isCheck, checker);
    }

    /**
     * @describe 根据文章id更新文章的推荐状态
     */
    public int updateArticleIsRecom(Integer articleId, boolean isRecom){
        return articleMapper.updateArticleIsRecom(articleId, isRecom);
    }

    /**
     * @describe 根据用户ID，筛选指定页数的文章
     */
    public List<Article> selectArticleByUserId(Integer userId, Integer startIndex, Integer selectNum){
        return articleMapper.selectArticleByUserId(userId, startIndex, selectNum);
    }

    /**
     * @describe 根据用户ID，返回该用户编写的文章数
     */
    public int selectArticleOfUserCount(Integer userId){
        return articleMapper.selectArticleOfUserCount(userId);
    }

    /**
     * @describe 查询最近一周的热门新闻
     */
    public List<Article> selectWeekHotArticle(){
        return articleMapper.selectWeekHotArticle();
    }

    /**
     * @describe 更新文章
     */
    public boolean updateArticle(Article article){
        articleMapper.updateArticle(article.getId(), article.getHeadline(), article.getCategoryId(), article.getGmtModified());
        articleMapper.updateArticleContent(article.getId(), article.getContent());
        return true;
    }
}
