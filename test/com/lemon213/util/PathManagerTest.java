package com.lemon213.util;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class PathManagerTest {
    @Resource
    private FilePathManager filePathManager;

    @Test
    public void testGetHeadPicPath(){
        System.out.println(filePathManager.getHeadPicPath());
    }
}
