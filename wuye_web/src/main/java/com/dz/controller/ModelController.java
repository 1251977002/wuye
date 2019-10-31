package com.dz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "model")
public class ModelController {
    //户型

    /*跳转到户型列表   用model表*/
    @RequestMapping(value = "modellist")
    public String modellist(){
        return "model/model-list";
    }
    /*跳转到添加户型*/
    @RequestMapping(value = "addmodel")
    public String addmodel(){
        return "model/model-add";
    }
}
