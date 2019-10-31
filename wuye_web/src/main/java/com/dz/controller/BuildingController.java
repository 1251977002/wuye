package com.dz.controller;

import com.dz.pojo.Building;
import com.dz.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/building/")
public class BuildingController {
    //楼栋
    @Autowired
    private BuildingService buildingService;

    /*跳转到楼栋列表并展示所有数据   用building表*/
    @RequestMapping(value = "buildinglist")
    public String buildinglist(Model model){
        List<Building> buildingList = buildingService.findAllBuilding(model);
        model.addAttribute("buildinglist",buildingList);
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
}
