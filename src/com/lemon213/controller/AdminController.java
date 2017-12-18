package com.lemon213.controller;

import com.lemon213.pojo.Admin;
import com.lemon213.pojo.Article;
import com.lemon213.service.AdminService;
import com.lemon213.service.ArticleService;
import com.lemon213.util.DataFormatUtil;
import com.lemon213.util.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;

/**
 * @author xiaobu
 * @describe 响应用户的基本请求, 例如登录、注册等
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;
    @Resource
    private ArticleService articleService;

    private static final int PAGE_SIZE = 10;

    @RequestMapping("/login")
    public String login(){
        return "/admin/login";
    }

    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    public String loginCheck(Admin admin, Model model, HttpSession session){
        Enumeration<String> sessionAttris = session.getAttributeNames();
        while (sessionAttris.hasMoreElements()){
            session.removeAttribute(sessionAttris.nextElement());
        }
        if(admin.getUsername()==null || admin.getUsername().equals("") || admin.getPassword()==null
                || admin.getPassword().equals("")){
            model.addAttribute("errorMessage", "用户名和密码不能为空");
            return "/admin/login";
        }
        admin = adminService.selectAdminByLogin(admin);
        if(admin == null){
            model.addAttribute("errorMessage", "用户名或密码错误");
            return "/admin/login";
        }
        session.setAttribute("sessionAdmin", admin);
        return "redirect:/admin/check_article";
    }

    /**
     * @describe 管理员注销
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        Enumeration<String> sessionAttris = session.getAttributeNames();
        while (sessionAttris.hasMoreElements()){
            session.removeAttribute(sessionAttris.nextElement());
        }
        session.invalidate();
        return "redirect:/article/news_recommend";
    }

    @RequestMapping("/check_article")
    public String checkArticle(@RequestParam(value = "page", defaultValue = "1") Integer page,
                               Integer category, Integer isCheck, Model model){
        List<Article> articleList;
        int totalItem;
        if(category != null){
            if (category == 1)
                totalItem = articleService.selectRecomCountByIsCheck(isCheck);
            else
                totalItem = articleService.selectCountByCategoryAndIsCheck(category, isCheck);
        } else {
            totalItem = articleService.selectCountByCategoryAndIsCheck(null, isCheck);
        }

        //加载分页插件
        PageInfo<Article> pageInfo = new PageInfo<>(totalItem, PAGE_SIZE, page);
        pageInfo.Init();

        if (category != null){
            if (category == 1)
                articleList = articleService.selectRecomArticleByIsCheck(isCheck, pageInfo.getStartIndex(), pageInfo.getSelectNum());
            else
                articleList = articleService.selectArticleByCategoryAndIsCheck(category, isCheck, pageInfo.getStartIndex(), pageInfo.getSelectNum());
        } else {
            articleList = articleService.selectArticleByCategoryAndIsCheck(null, isCheck, pageInfo.getStartIndex(), pageInfo.getSelectNum());
        }
        //将文章类别id翻译为类别名
        for (Article article : articleList) {
            article.setCategory(DataFormatUtil.articleCategoryToZH(article.getCategoryId()));
        }
        pageInfo.setDataList(articleList);
        System.out.println(pageInfo.toString());
        model.addAttribute("category", category);
        model.addAttribute("isCheck", isCheck);
        model.addAttribute("pageInfo", pageInfo);
        return "/admin/check_article";
    }
}
