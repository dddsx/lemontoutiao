package com.lemon213.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface CategoryMapper {
    //根据文章类型名称, 查询出文章类型id
    Integer selectCategoryIdByName(String category);
}
