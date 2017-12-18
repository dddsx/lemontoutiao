package com.lemon213.listener;

import com.lemon213.util.FilePathManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class InitDataListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent event) {
       ServletContext context = event.getServletContext();
       context.setAttribute("headPicPath", FilePathManager.getHeadPicPath());
    }

    public void contextDestroyed(ServletContextEvent event) {

    }
}
