package com.lemon213.controller;

import com.lemon213.pojo.Editor;
import com.lemon213.pojo.User;
import com.lemon213.service.EditorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author xiaobu
 * @describe 主要用于响应和小编板块相关的请求
 */
@Controller("editorController")
public class EditorController {
    @Resource
    private EditorService editorService;

    /**
     * @describe 转发到文章编写页面
     */
    @RequestMapping("/write")
    public String writeArticle(){
        return "/editor/write";
    }

    /**
     * @describe 转发到实名信息填写页面(成为小编的必经之路)
     */
    @RequestMapping("/beEditor")
    public String becomeEditor(){
        return "/editor/beEditor";
    }

    /**
     *@describe 用户填写实名信息后, 保存信息到数据库, 并使用户具有编写文章权限
     */
    @RequestMapping("/saveEditor")
    public String saveEditor(String agree, Editor editor, RedirectAttributes ra, HttpSession session){
        User sessionUser = (User) session.getAttribute("sessionUser");
        if(!agree.trim().equals("我同意")){
            ra.addFlashAttribute("errorMessage", "你必须先同意遵守规章");
            return "redirect:/beEditor";
        }
        int editorId;
        if((editorId = editorService.becomeEditor(editor, sessionUser.getId())) > 0){
            sessionUser.setIsEditor(true);
            sessionUser.setEditorId(editorId);
            sessionUser.setEditor(editorService.selectEditorById(editorId));
            session.setAttribute("sessionUser", sessionUser);
            String URL = (String) session.getAttribute("goURL");
            session.removeAttribute("goURL");
            if(URL != null)
                return "redirect:" + URL;
            else
                return "redirect:/article/news_hot";
        }
        else
            return "redirect:/article/news_hot";
    }
}
