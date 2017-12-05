package com.lemon213.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class CategoryMapperTest {
    @Resource
    private CategoryMapper categoryMapper;

    @Test
    public void testSelectIdByName(){
        int id = categoryMapper.selectCategoryIdByName("essay_joke");
        System.out.println(id);
    }
}
