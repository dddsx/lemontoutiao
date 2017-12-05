package com.lemon213.service.impl;
import com.lemon213.mapper.UserPicMapper;
import com.lemon213.service.UserPicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author xiaobu
 */
@Service("userPicService")
public class UserPicServiceImpl implements UserPicService{
    @Resource
    private UserPicMapper userPicMapper;

    /**
     * @describe 保存新的头像信息到数据库, 参数为文件名, 保存成功后返回头像的id
     * @param filename, 文件名
     * @return 失败则返回-1, 成功则返回数据库自动生成的id
     */
    public Integer saveUserHeadPic(String filename){
        int result = userPicMapper.saveUserPicByFilename(filename);
        if(result == 1){
            return userPicMapper.selectLastId();
        } else{
            return -1;
        }
    }
}
