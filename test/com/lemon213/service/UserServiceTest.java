package com.lemon213.service;

import com.lemon213.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class UserServiceTest {
    @Resource
    private UserService userService;

    @Test
    public void testSelectUserByLogin(){
        User user = new User();
        user.setUsername("dddsx");
        user.setPassword("5953805");
        user = userService.selectUserByLogin(user);
        System.out.println(user);
        System.out.println(user.getEditor());
    }
}
