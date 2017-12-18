package com.lemon213.service.impl;

import com.lemon213.mapper.AdminMapper;
import com.lemon213.pojo.Admin;
import com.lemon213.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author xiaobu
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService{
    @Resource
    private AdminMapper adminMapper;

    /**
     * @describe 根据管理员登录填写的信息, 登录成功时返回该管理员的信息
     * @param admin, 内含用户名和密码
     * @return Admin对象, 内含管理员的基本信息
     */
    public Admin selectAdminByLogin(Admin admin) {
        return adminMapper.selectAdminByLogin(admin);
    }
}
