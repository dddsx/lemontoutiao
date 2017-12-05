package com.lemon213.framework;

import com.lemon213.mapper.UserMapper;
import com.lemon213.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class SSMTest {
    @Resource
    private Date date;

    @Resource
    private UserMapper userMapper;

    @Test
    public void testSpringIoc(){
        System.out.println(date);
    }


    //测试Spring整合MyBatis的情况
    @Test
    public void testSpringwithMyBatis(){
        User user = new User();
        user.setUsername("xiaobu2");
        user.setPassword("5953805");
        user.setEmail("dddsx@6324.com");
        user.setGmtCreate(new Date());
        user.setGmtModified(new Date());
        userMapper.saveUser(user);
    }
}
