package com.lemon213.service;

import com.lemon213.pojo.User;

public interface UserService {
    User selectUserByLogin(User user);

    boolean trySaveUser(User user);

    boolean tryUpdateUser(User user, String oldname);

    User selectUserMessage(Integer id);

    boolean updateUserHeadPic(Integer userId, Integer headPicId);

    boolean updateUserPwd(String username, String old_pwd, String new_pwd);
}
