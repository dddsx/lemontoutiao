package com.lemon213.mapper;

import com.lemon213.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface UserMapper {

    //保存用户的基本信息到数据库
    int saveUser(User user);

    //根据用户名和密码返回一个用户的基本信息
    User selectUserByLogin(User user);

    //检查是否存在指定的用户名
    boolean isExistUser(String username);

    //更新一个用户的资料
    int updateUser(User user);

    //检查是否存在昵称
    boolean isExistNickname(String nickname);

    //查询用户资料
    User selectUserMessage(Integer userId);

    //使用户成为作者
    int updateBecomeEditor(Integer userId, Integer editorId, Date date, Boolean become);

    //根据id查询用户
    User selectUserById(int userId);

    //根据小编id获取用户id
    Integer selectUserIdByEditorId(int EditorId);

    //给用户增长一定数量的柠檬币
    int updateUserMoney(int userId, int money);

    //更新用户的头像
    int updateUserHeadPic(int userId, int headPicId);

    //更改用户密码
    int updateUserPwd(String username, String new_pwd);
}