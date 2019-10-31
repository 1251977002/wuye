package com.dz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/room/")
public class RoomController {
    //套房


    /*跳转到套房管理的主页面  几个表合起来用*/
    @RequestMapping(value = "roomlist")
    public String roomlist(){
        return "room/room-list";
    }
    /*跳转到添加套房*/
    @RequestMapping(value = "addroom")
    public String addroom(){
        return "room/room-add";
    }







}
