package com.lemon213.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminLoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpServletResponse res = (HttpServletResponse)servletResponse;
        //判断当前session是否有用户信息
        if(req.getSession().getAttribute("sessionAdmin") == null){
            res.sendRedirect(req.getContextPath() + "/admin/login");
        } else{
            filterChain.doFilter(req, res);
        }
    }

    public void destroy() {

    }
}
