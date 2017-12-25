package com.lemon213.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author xiaobu
 * @describe 用户登录过滤器, 拦截一些以游客身份进行的非法操作
 */
public class LoginFilter implements Filter{
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpServletResponse res = (HttpServletResponse)servletResponse;
        //判断当前session是否有用户信息
        if(req.getSession().getAttribute("sessionUser") == null){
            System.out.println(req.getHeader("referer"));
            req.getSession().setAttribute("currentURL", req.getHeader("referer"));
            res.sendRedirect(req.getContextPath() + "/user/login");
        } else{
            filterChain.doFilter(req, res);
        }
    }

    public void destroy() {

    }
}
