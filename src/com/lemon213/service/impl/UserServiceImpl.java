package com.lemon213.service.impl;

import com.lemon213.mapper.UserMapper;
import com.lemon213.pojo.User;
import com.lemon213.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author xiaobu
 */
@Service("userService")
public class UserServiceImpl implements UserService{
    @Resource
    private UserMapper userMapper;

    /**
     * @describe 根据用户登录填写的信息, 登录成功时返回该用户的资料
     * @param user, 内含用户名和密码
     * @return User对象, 内含用户的基本资料
     */
    public User selectUserByLogin(User user){
        return userMapper.selectUserByLogin(user);
    }

    //尝试保存用户, 如果用户名已存在则返回false, 保存成功则返回true。
    public boolean trySaveUser(User user){
        if(userMapper.isExistUser(user.getUsername())) {
            return false;
        } else{
            userMapper.saveUser(user);
            return true;
        }
    }

    /**
     * @describe 尝试为用户更新资料
     * @param user, 存储用户修改后的资料信息
     * @param oldNickname, 用户之前的昵称, 依此来判断用户昵称是否未被修改过
     * @return Boolean, 用户信息是否修改成功, 修改失败通常是由昵称重复引起的
     */
    public boolean tryUpdateUser(User user, String oldNickname){
        if(!user.getNickname().equalsIgnoreCase(oldNickname) && userMapper.isExistNickname(user.getNickname())){
            return false;
        } else{
            userMapper.updateUser(user);
            return true;
        }
    }

    /**
     * @describe 获取用户信息
     * @param id, 用户id
     * @return User对象
     */
    public User selectUserMessage(Integer id){
        return userMapper.selectUserMessage(id);
    }

    /**
     * @describe 更新用户的头像信息
     * @param userId, 用户的id
     * @param headPicId, 新头像的ID
     * @return 成功则返回true
     */
    public boolean updateUserHeadPic(Integer userId, Integer headPicId){
        return userMapper.updateUserHeadPic(userId, headPicId)==1;
    }
}
