package com.lemon213.mapper;

import com.lemon213.pojo.UserPic;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class UserPicMapperTest {
    @Resource
    private UserPicMapper userPicMapper;

    @Test
    public void testSaveUserPic(){
        int startIndex = 17;
        for (int i = startIndex; i < 90; i++) {
            UserPic userPic = new UserPic();
            userPic.setId(i);
            userPic.setFilename(String.valueOf(i) + ".jpg");
            userPicMapper.saveUserPic(userPic);
        }
    }
}
