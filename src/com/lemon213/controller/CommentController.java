package com.lemon213.controller;

import com.lemon213.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Writer;
import java.util.Map;

@Controller
public class CommentController {
    @Resource
    private CommentService commentService;

    /**
     * @describe 实现给评论点赞的功能
     */
    @RequestMapping("/commentLove")
    public void commentLove(@RequestBody Map<String, Object> map, HttpServletResponse response, HttpSession session)
            throws Exception{
        Integer commentId = (Integer) map.get("commentId");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        Writer out = response.getWriter();
        if(session.getAttribute("sessionUser") == null){
            out.write("login");
            return;
        }
        if(commentService.addPraiseNum(commentId)){
            out.write("success");
        }
    }
}
