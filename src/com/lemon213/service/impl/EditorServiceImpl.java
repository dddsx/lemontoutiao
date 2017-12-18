package com.lemon213.service.impl;

import com.lemon213.mapper.EditorMapper;
import com.lemon213.mapper.UserMapper;
import com.lemon213.pojo.Editor;
import com.lemon213.service.EditorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author xiaobu
 */
@Service("editorService")
public class EditorServiceImpl implements EditorService{
    @Resource
    private EditorMapper editorMapper;
    @Resource
    private UserMapper userMapper;

    /**
     * @describe 根据小编的id, 查询出小编的基本信息
     * @param id, 小编的id
     * @return Editor对象, 内含小编的基本信息
     */
    public Editor selectEditorById(Integer id){
        return editorMapper.selectEditorById(id);
    }

    /**
     * @describe 尝试使用户成为小编
     * @param editor, 内含用户填写的实名信息
     * @param userId, 用户的id
     * @return 如果成为小编成功, 则返回数据库生成的小编id
     */
    public int becomeEditor(Editor editor, Integer userId){
        Date now = new Date();
        editor.setGmtCreate(now);
        editor.setGmtModified(now);
        editorMapper.saveEditor(editor);
        userMapper.updateBecomeEditor(userId, editor.getId(), editor.getGmtCreate(), true);
        return editor.getId();
    }
}
