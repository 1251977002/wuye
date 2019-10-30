package com.dz.controller;

import com.dz.pojo.Building;
import com.dz.pojo.Pay;
import com.dz.pojo.Propert;
import com.dz.service.PayService;
import com.dz.service.PropertService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public PageInfo<Propert> findByPage(int pageNum){
        PageInfo<Propert> pageInfo = propertService.findByPage(pageNum);
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
    @RequestMapping(value = "findByBidAndUid",produces = "application/json;charset=utf-8")
    @ResponseBody
    public Propert findByBidAndUid(HttpServletRequest request, HttpServletResponse response){
        String buildingname = request.getParameter("buildingid");

        String username = request.getParameter("username");
        Propert propert = propertService.findByBidAndUid(buildingname,username);
        return propert;
    }
}
