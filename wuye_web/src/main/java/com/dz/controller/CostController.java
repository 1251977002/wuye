package com.dz.controller;

import com.dz.pojo.Pay;
import com.dz.pojo.Propert;
import com.dz.service.PayService;
import com.dz.service.PropertService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/cost/")
public class CostController {

    @Autowired
    private PropertService propertService;
    @Autowired
    private PayService payService;

    //跳到物业费账单
    @RequestMapping("list")
    public String list(){
        return "cost/cost-list";
    }

    //跳到收取物业费
    @RequestMapping("add")
    public String add(){
        return "cost/cost-add";
    }

    //跳到缴费记录
    @RequestMapping("feelist")
    public String feelist(){
        return "cost/cost-fee-list";
    }

    //跳到收据
    @RequestMapping("shouju")
    public String shouju(){
        return "cost/shouju";
    }

    //分页显示物业账单信息
    @RequestMapping(value = "findByPage",produces = "application/json;charset=utf-8")
    @ResponseBody
    public PageInfo findByPage(int pageNum,String buildingname,String username){
        PageInfo pageInfo = propertService.findByPage(pageNum,buildingname,username);
        return pageInfo;
    }

    //显示年份
    @RequestMapping(value = "findAllYear",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Pay> findAllYear(){
        List<Pay> payList = payService.findAllYear();
        return payList;
    }

    //收取物业费
    @RequestMapping(value = "findByBnameAndUname",produces = "application/json;charset=utf-8")
    @ResponseBody
    public Propert findByBnameAndUname(String buildname, String username){
        Propert propert = propertService.findByBnameAndUname(buildname,username);
        return propert;
    }

    //收取物业费
    @RequestMapping(value = "findByYear",produces = "application/json;charset=utf-8")
    @ResponseBody
    public Propert findByYear(int year,double promoney,double owemoney){
        double money = owemoney + promoney * year;

        Propert propert = new Propert();
        return propert;
    }


}
