package com.lemon213.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @describe 专门实现转发到指定页面的控制器
 */
@Controller
@RequestMapping("/send")
public class SendController {
    @RequestMapping("/timeout")
    public String timeout(){
        return "/other/timeout";
    }

    @RequestMapping("illegal")
    public String illegal(){
        return "/other/illegal";
    }
}
