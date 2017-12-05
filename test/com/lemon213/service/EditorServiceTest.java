package com.lemon213.service;

import com.lemon213.pojo.Editor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../applicationContext.xml")
public class EditorServiceTest {
    @Resource
    private EditorService editorService;

    @Test
    public void testBecomeEditor(){
        Editor editor = new Editor();
        editor.setRealName("孙狗");
        editor.setIdcard("452123199853215654");
        editor.setPhone("15232232323");
        editor.setWorkspace("抽象工作室");
        editor.setGmtCreate(new Date());
        editor.setGmtModified(new Date());
        System.out.println(editorService.becomeEditor(editor, 1002));
    }
}
