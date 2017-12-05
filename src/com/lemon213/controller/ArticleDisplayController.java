package com.lemon213.controller;

import com.lemon213.pojo.Article;
import com.lemon213.service.ArticleService;
import com.lemon213.util.ShowDateFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xiaobu
 * @describe 文章板块的展示和加载
 */
@Controller("articleReadController")
@RequestMapping("/article")
public class ArticleDisplayController {
    @Resource
    private ArticleService articleService;

    private static final int PAGE_SIZE = 10;

    private static final Map<String, Integer> categoryMap = new HashMap<String, Integer>();

    static {
        categoryMap.put("news_recommend", 1);
        categoryMap.put("news_hot", 2);
        categoryMap.put("news_tech", 3);
        categoryMap.put("news_funny", 4);
        categoryMap.put("news_entertainment", 5);
        categoryMap.put("news_game", 6);
        categoryMap.put("news_sports", 7);
        categoryMap.put("news_cartoon", 8);
        categoryMap.put("news_movie", 9);
        categoryMap.put("news_automobile", 10);
        categoryMap.put("news_military", 11);
        categoryMap.put("news_story", 12);
        categoryMap.put("news_finance", 13);
        categoryMap.put("essay_joke", 14);
    }

    /**
     * @describe 根据用户请求的URL内的文章类型，展示该板块的文章一览页面
     * @param category, 用户请求的文章类型
     */
    @RequestMapping(value = "/{category}")
    public String showArticleByCategory(@PathVariable String category, Model model){
        Integer categoryId = categoryMap.get(category);
        if(categoryId == null)
            categoryId = 1;
        List<Article> articleList = articleService.selectArticleByCategory(categoryId, 0, PAGE_SIZE);

        //格式化日期输出
        for(Article article : articleList){
            article.setShowTime(ShowDateFormat.format(article.getGmtCreate()));
        }

        model.addAttribute("articleList", articleList);
        model.addAttribute("category", categoryId);
        if(categoryId == 1)
            return "/article/recommend";
        else if(categoryId == 14)
            return "/article/essay_joke";
        else
            return "/article/common";
    }

    /**
     * @describe 以ajax方式, 根据用户请求的文章类型和页数, 加载出更多的文章, 如无更多新闻, 给出适当提示。
     * 为了防止文章重复加载, 里面用到了类似分页的技术
     * @param map，包含了用户请求的文章类型和页数参数
     * @return 新的文章以及一些提示性信息
     */
    @RequestMapping(value = "/reloadNews", method = RequestMethod.POST)
    public ModelAndView reloadArticle(@RequestBody Map<String, Object> map) throws Exception{
        Integer categoryId = Integer.parseInt((String)map.get("category"));
        Integer page = Integer.parseInt((String)map.get("page"));
        System.out.println(categoryId +" " + page);

        ModelAndView mv = new ModelAndView();
        mv.setView(new MappingJackson2JsonView());

        int totalItem =articleService.selectCountByCategory(categoryId); //总条目数
        int requestPage = page; //请求第几页
        int lastPage; //最大页数
        if(totalItem % PAGE_SIZE == 0){
            lastPage = totalItem / PAGE_SIZE;
        } else{
            lastPage = totalItem / PAGE_SIZE + 1;
        }
        if(requestPage > lastPage ){ //请求页数超过了最大页数
            mv.addObject("message", "noMoreNews");
            Thread.sleep(1500);  //模拟用户等待新闻加载
            return mv;
        }
        int startIndex = PAGE_SIZE  * (requestPage - 1); //筛选起始处
        int selectNum; //筛选条目数
        if(totalItem % PAGE_SIZE == 0 || requestPage != lastPage){
            selectNum = PAGE_SIZE;
        } else {
            selectNum = totalItem % PAGE_SIZE;
        }
        List<Article> articleList = articleService.selectArticleByCategory(categoryId, startIndex, selectNum);
        for(Article article : articleList){
            article.setShowTime(ShowDateFormat.format(article.getGmtCreate()));
        }
        mv.addObject("message", "loading");
        mv.addObject("articleList", articleList);
        Thread.sleep(500);  //模拟用户等待新闻加载
        return mv;
    }
}
