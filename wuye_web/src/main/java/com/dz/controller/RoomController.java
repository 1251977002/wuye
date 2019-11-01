package com.dz.controller;

import com.dz.pojo.Building;
import com.dz.pojo.Model;
import com.dz.pojo.Unit;
import com.dz.pojo.User;
import com.dz.service.BuildingService;
import com.dz.service.ModelService;
import com.dz.service.UnitService;
import com.dz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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


    /*跳转到套房管理的主页面  几个表合起来用*/
    @RequestMapping(value = "roomlist")
    public String roomlist(org.springframework.ui.Model model){
        return "room/room-list";
    }
    /*跳转到添加套房*/
    @RequestMapping(value = "addroom")
    public String addroom(){
        return "room/room-add";
    }

    @RequestMapping(value = "saveroom")
    public String saveroom(String buildingname,String unitname,
                           String modelname,Double modelpropertmoney,
                           String username,String tel ){

        Building building = new Building();
        Unit unit = new Unit();
        Model model = new Model();
        User user = new User();
        building.setName(buildingname);
        unit.setName(unitname);
        model.setModelname(modelname);
        model.setPropertmoney(modelpropertmoney);
        user.setUsername(username);
        user.setTel(tel);

        buildingService.saveroom(building);
        unitService.saveroom(unit);
        modelService.saveroom(model);
        userService.saveroom(user);
        return "redirect:roomlist";

    }







}
