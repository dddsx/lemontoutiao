package com.lemon213.listener;

import com.lemon213.service.ArticleService;
import com.lemon213.util.FilePathManager;
import com.lemon213.util.WeatherTimerTask;
import com.lemon213.util.WeekHotTimerTask;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Timer;

public class InitDataListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
        ServletContext servletContext = event.getServletContext();

        ArticleService articleService = (ArticleService) applicationContext.getBean("articleService");

        //设置全局路径信息
        servletContext.setAttribute("headPicPath", FilePathManager.getHeadPicPath());
        servletContext.setAttribute("coverPath", FilePathManager.getCoverPath());

        //打开天气更新触发器
        WeatherTimerTask weatherTimerTask = new WeatherTimerTask();
        weatherTimerTask.setApplication(servletContext);
        new Timer(true).schedule(weatherTimerTask, 0, 1000 * 60 *60); //每小时更新一次天气信息

        //打开一周热闻更新触发器
        WeekHotTimerTask weekHotTimerTask = new WeekHotTimerTask();
        weekHotTimerTask.setApplication(servletContext);
        weekHotTimerTask.setArticleService(articleService);
        new Timer(true).schedule(weekHotTimerTask, 0, 1000 * 60 * 60);
    }

    public void contextDestroyed(ServletContextEvent event) {

    }
}
