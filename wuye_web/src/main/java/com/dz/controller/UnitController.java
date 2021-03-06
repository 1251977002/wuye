package com.dz.controller;

import com.dz.pojo.Building;
import com.dz.pojo.Unit;
import com.dz.service.UnitService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/unit/")
public class UnitController {
    //单元
    @Autowired
    private UnitService unitService;

    /*跳转到单元列表   用unit表*/
    @RequestMapping(value = "unitlist")
    public String unitlist(Model model){
        List<Unit> unitList = unitService.findAllUnit(model);
        model.addAttribute("unitlist",unitList);
        return "unit/unit-list";
    }
    /*跳转到添加楼栋*/
    @RequestMapping(value = "addunit")
    public String addunit(){
        return "unit/unit-add";
    }

    /*删除单元信息*/
    @RequestMapping(value = "deleteunit")
    public String deleteunit(int id){
        unitService.deleteUnit(id);
        return "redirect:unitlist";
    }
    /*添加单元*/
    @RequestMapping(value = "saveunit")
    public String saveunit(String name,String note){
        Unit unit = new Unit();
        unit.setName(name);
        unit.setNote(note);
        unitService.saveUnit(unit);
        return "redirect:unitlist";
    }

    //查找所有单元
    @RequestMapping(value = "findAll",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public List<Unit> findAll(){
        List<Unit> unitList = unitService.findAll();
        return unitList;
    }
    /*分页*/
    @RequestMapping(value = "findByPage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public PageInfo findByPage(int pageNum){
        PageInfo pageInfo = unitService.findByPage(pageNum);
        return pageInfo;
    }
    /*编辑单元*/
    @RequestMapping(value = "edit", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public int updateUser(Unit unit){
        unitService.edit(unit);
        return 0;
    }
}
