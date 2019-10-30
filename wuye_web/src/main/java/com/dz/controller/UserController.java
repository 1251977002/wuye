package com.dz.controller;

import com.dz.pojo.User;
import com.dz.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user/")
public class UserController {
    //业主
    @Autowired
    private UserService userService;
    //住户列表
    @RequestMapping("list")
    public String list(){
        return "user/user-list";
    }
    //添加新住户
    @RequestMapping("add")
    public String add(){
        return "user/user-add";
    }
    //分页、查找用户信息
    @RequestMapping(value = "findByPage",produces={"application/json;charset=utf-8"})
    @ResponseBody
    public PageInfo<User> findByPage(int pageNum,String username,String status){
        PageInfo<User> userPageInfo = userService.findUserByParam(pageNum,username,status);
        return userPageInfo;
    }

}
