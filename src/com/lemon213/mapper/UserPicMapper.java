package com.lemon213.mapper;

import com.lemon213.pojo.UserPic;

public interface UserPicMapper {
    int saveUserPic(UserPic userPic);

    int saveUserPicByFilename(String filename);

    Integer selectLastId();
}
