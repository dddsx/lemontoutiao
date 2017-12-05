package com.lemon213.service;

import com.lemon213.pojo.Editor;

public interface EditorService {
    Editor selectEditorById(Integer id);

    int becomeEditor(Editor editor, Integer userId);
}
