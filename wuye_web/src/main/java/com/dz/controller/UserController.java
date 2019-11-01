package com.dz.controller;

import com.dz.pojo.Unit;
import com.dz.pojo.User;
import com.dz.service.HouseService;
import com.dz.service.UnitService;
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
    @Autowired
    private UnitService unitService;
    @Autowired
    private HouseService houseService;

    //住户列表
    @RequestMapping("list")
    public String list() {
        return "user/user-list";
    }

    //添加新住户
    @RequestMapping("add")
    public String add() {
        return "user/user-add";
    }

    //分页、查找用户信息
    @RequestMapping(value = "findByPage", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public PageInfo<User> findByPage(int pageNum, String username, String status) {
        PageInfo<User> userPageInfo = userService.findUserByParam(pageNum, username, status);
        return userPageInfo;
    }

    //保存user
    @RequestMapping("save")
    public String saveUser( User user,String unithouse, int modelid) {
        int userId = userService.save(user, unithouse);
        Unit unit = unitService.findByName(unithouse.substring(0, 3));
        houseService.save(unithouse.substring(3), userId, unit, modelid);
        return "user/user-list";
    }

    //查找某个房间有没有住户
    @RequestMapping(value = "findByBuildAndUnitHouse", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public User findByBuildAndUnitHouse(User user) {
        return userService.findByBuildAndUnitHouse(user);
    }

}
