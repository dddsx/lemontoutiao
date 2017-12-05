package com.lemon213.mapper;

import com.lemon213.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class UserMapperTest {
    @Resource
    private UserMapper userMapper;

    @Test
    public void testSaveUser() {
        User user = new User();
        user.setUsername("xiaobu3");
        user.setPassword("5953805");
        user.setNickname(user.getUsername());
        user.setEmail("dddsx@6324.com");
        user.setGmtCreate(new Date());
        user.setGmtModified(new Date());
        int result = userMapper.saveUser(user);
        System.out.println(result);
    }

    @Test
    public void testUpdateUser(){
        User user = new User();
        user.setId(1007);
        user.setNickname("鸠摩智");
        user.setPicture(2);
        user.setGmtModified(new Date());
        userMapper.updateUser(user);
    }

    @Test
    public void testSelectUserPic(){
        User user = new User();
        user.setUsername("xiaobu");
        user.setPassword("5953805");
        user = userMapper.selectUserByLogin(user);
        System.out.println(user);
    }

}
