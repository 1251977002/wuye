package com.dz.controller;

import com.dz.pojo.Building;
import com.dz.service.BuildingService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/building/")
public class BuildingController {
    //楼栋
    @Autowired
    private BuildingService buildingService;

    /*跳转到楼栋列表并展示所有数据   用building表*/
    @RequestMapping(value = "buildinglist")
    public String buildinglist(Model model){

        return "building/building-list";
    }
    /*跳转到添加楼栋*/
    @RequestMapping(value = "addbuilding")
    public String addbuilding(){
        return "building/building-add";
    }
    /*删除楼栋信息*/
    @RequestMapping(value = "deletebuilding")
    public String deletebuilding(int id){
        buildingService.deleteBuilding(id);
        return "redirect:buildinglist";
    }
    /*添加楼栋*/
    @RequestMapping(value = "savebuilding")
    public String savebuilding(String name,String note){
        Building building = new Building();
        building.setName(name);
        building.setNote(note);
        buildingService.saveBuilding(building);
        return "redirect:buildinglist";
    }
    /*显示所有楼栋*/
    @RequestMapping(value = "findAll",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public List<Building> findAll(){
        List<Building> buildingList = buildingService.findAll();
        return buildingList;
    }
    /*分页*/
    @RequestMapping(value = "findByPage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public PageInfo findByPage(int pageNum){
        PageInfo pageInfo = buildingService.findByPage(pageNum);
        return pageInfo;
    }
    /*编辑楼栋信息*/
    @RequestMapping(value = "edit", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public int updateUser(Building building){
        buildingService.edit(building);
        return 0;
    }
}
