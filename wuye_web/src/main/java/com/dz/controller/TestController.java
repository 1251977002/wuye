package com.dz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/")
public class TestController {
@RequestMapping("test")
    public String test(){
        return "succ";
    }
    @RequestMapping("findByPage")
    @ResponseBody
    public String  findByPage() {
        return "sghsgdgada";
    }
}
