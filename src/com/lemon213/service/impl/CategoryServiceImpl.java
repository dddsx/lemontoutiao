package com.lemon213.service.impl;

import com.lemon213.mapper.CategoryMapper;
import com.lemon213.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author xiaobu
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
    @Resource
    private CategoryMapper categoryMapper;

    /**
     * @describe 根据文章类型名返回文章类型id
     * @param name, 文章类型名
     * @return 文章类型id
     */
    public Integer selectCategoryIdByName(String name){
        return categoryMapper.selectCategoryIdByName(name);
    }
}
