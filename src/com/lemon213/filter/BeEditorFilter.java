package com.lemon213.filter;

import com.lemon213.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author xiaobu
 * @describe 文章编写过滤器, 拦截一些非小编用户的文章编写请求
 */
public class BeEditorFilter implements Filter{
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        User sessionUser = (User)request.getSession().getAttribute("sessionUser");
        if(sessionUser == null){
            response.sendRedirect(request.getContextPath() + "/user/login"); //未登陆则让用户先登录
            return;
        }
        if(!sessionUser.getIsEditor()){
            String goURL = request.getServletPath(); //获得用户想要去的地址
            String param = request.getQueryString(); //获得地址中携带的参数
            if(param != null) {
                goURL = goURL + "?" + param;
            }
            request.getSession().setAttribute("goURL", goURL); //保存用户想去的URL, 即文章编写页面
            response.sendRedirect(request.getContextPath() + "/beEditor"); //重定向到实名填写页面
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    public void destroy() {

    }
}
