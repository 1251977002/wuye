package com.dz.controller;

import com.dz.pojo.*;
import com.dz.service.*;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.soap.SOAPBinding;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/room/")
public class RoomController {
    //套房

    @Autowired
    private BuildingService buildingService;
    @Autowired
    private UnitService unitService;
    @Autowired
    private ModelService modelService;
    @Autowired
    private UserService userService;
    @Autowired
    private PropertService propertService;
    @Autowired
    private HouseService houseService;


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



    /*分页*/
    @RequestMapping(value = "findByPage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public PageInfo findByPage(int pageNum,String username,String status){
        PageInfo pageInfo = propertService.findByPageroomList(pageNum,username,status);
        return pageInfo;
    }
    /*分页*/
    @RequestMapping(value = "findByPage1",produces = "application/json;charset=utf-8")
    @ResponseBody
    public PageInfo findByPage1(int pageNum,String username,String status){
        PageInfo pageInfo = propertService.findByPageroomList1(pageNum,username,status);
        return pageInfo;
    }


    /*查询所有的楼栋名字*/
    @RequestMapping(value = "findAllBuilding",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Building>  findAllBuilding(){
        List<Building> buildingList = buildingService.findAll();
        return  buildingList;
    }

    /*删除*/
    @RequestMapping(value = "deleteroom")
    public String deleteroom(int id){
        propertService.delroom(id);
        return "redirect:roomlist";
    }







}
