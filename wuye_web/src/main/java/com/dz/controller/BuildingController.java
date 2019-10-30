package com.dz.controller;

import com.dz.pojo.Building;
import com.dz.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/building/")
public class BuildingController {
    //楼栋
    @Autowired
    private BuildingService buildingService;

    @RequestMapping(value = "findAll",produces = "application/json;charset=utf-8")
    public @ResponseBody List<Building> findAll(){
        List<Building> buildingList = buildingService.findAll();
        return buildingList;
    }
}
