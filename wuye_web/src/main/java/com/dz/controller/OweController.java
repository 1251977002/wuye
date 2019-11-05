package com.dz.controller;

import com.dz.pojo.User;
import com.dz.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/owe/")
public class OweController {
    //欠费管理
    @Autowired
    private UserService userService;
    /*跳转到首页*/
    @RequestMapping(value = "owedata")
    public String oweData(){
        return "owe/owe-data";
    }

    /*跳转到距离逾期还有七天（owe-qitian）页面*/
    @RequestMapping(value = "oweqitian")
    public String oweQitian(){
        return "owe/owe-qitian";
    }

    /*跳转已逾期页面（owe-yuqi）*/
    @RequestMapping(value = "oweyuqi")
    public String oweYuqi(){
        return "owe/owe-yuqi";
    }


}
