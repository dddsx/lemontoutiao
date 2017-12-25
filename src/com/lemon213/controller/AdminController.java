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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    /**
     * 转向管理员登录界面
     */
    @RequestMapping("/login")
    public String login(){
        return "/admin/login";
    }

    /**
     * @describe 管理员登录校验
     */
    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    public String loginCheck(Admin admin, Model model, HttpSession session){
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
        return "redirect:/admin/articleList";
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

    /**
     * @describe 响应管理员查询文章请求, 返回符合条件的所有文章
     * @param page 查询页数
     * @param category 查询类别
     * @param isCheck "是否通过审核"条件
     */
    @RequestMapping("/articleList")
    public String listArticle(@RequestParam(value = "page", defaultValue = "1") Integer page,
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
        model.addAttribute("category", category);
        model.addAttribute("isCheck", isCheck);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/articleList";
    }

    /**
     * @describe 根据文章id, 查询文章内容, 转向文章展示页面
     */
    @RequestMapping("/articleView")
    public String checkArticle(Integer id, Model model, HttpServletResponse response) throws Exception{
        Article article = articleService.selectArticleById(id);
        if (article == null) {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.getWriter().print("文章不存在！");
            return null;
        }
        model.addAttribute("article", article);
        return "admin/articleView";
    }

    /**
     * @describe 根据文章id, 删除文章
     */
    @RequestMapping("/articleDelete")
    public void articleDelete(Integer articleId, HttpServletRequest request, HttpServletResponse response) throws Exception{
        String url = request.getHeader("referer");
        if(articleService.deleteArticleById(articleId) == 1){
            response.sendRedirect(url);
        } else {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.getWriter().print("文章删除失败！");
        }
    }

    /**
     * @describe 根据文章id, 给予文章通过审核或下架文章
     * @param isCheck 通过审核或下架
     */
    @RequestMapping("/articleCheck")
    public void articleCheck(Integer articleId, boolean isCheck, HttpServletRequest request,
                             HttpServletResponse response, HttpSession session) throws Exception{
        Admin sessionAdmin = (Admin) session.getAttribute("sessionAdmin");
        String url = request.getHeader("referer");
        if(articleService.updateArticleIsCheck(articleId, isCheck, sessionAdmin.getId()) == 1){
            response.sendRedirect(url);
        } else {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.getWriter().print("文章更新失败！");
        }
    }

    /**
     * @describe 根据文章id, 推荐文章或取消推荐
     * @param isRecom 推荐或取消推荐
     */
    @RequestMapping("/articleRecom")
    public void articleRecom(Integer articleId, boolean isRecom, HttpServletRequest request, HttpServletResponse response) throws Exception{
        String url = request.getHeader("referer");
        System.out.println(isRecom);
        if(articleService.updateArticleIsRecom(articleId, isRecom) == 1){
            response.sendRedirect(url);
        } else {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.getWriter().print("文章更新失败！");
        }
    }
}
