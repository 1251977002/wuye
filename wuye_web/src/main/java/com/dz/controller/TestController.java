package com.dz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
public class TestController {

@RequestMapping("test")
    public String test(){
        return "bbs/bbs-post";
    }
}
