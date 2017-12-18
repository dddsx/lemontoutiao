package com.lemon213.mapper;

import com.lemon213.pojo.Editor;
import org.springframework.stereotype.Repository;

@Repository
public interface EditorMapper {
    //保存小编信息
    int saveEditor(Editor editor);

    //通过小编id, 查询小编信息
    Editor selectEditorById(Integer id);
}
