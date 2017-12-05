package com.lemon213.mapper;

import com.lemon213.pojo.Editor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class EditorMapperTest {
    @Resource
    private EditorMapper editorMapper;

    @Test
    public void testSelectEditorById() {
        Editor editor = editorMapper.selectEditorById(15);
        System.out.println(editor);
    }
}
