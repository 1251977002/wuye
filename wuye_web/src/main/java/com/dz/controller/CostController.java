package com.dz.controller;

import com.dz.pojo.Pay;
import com.dz.pojo.Propert;
import com.dz.pojo.User;
import com.dz.service.PayService;
import com.dz.service.PropertService;
import com.dz.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/cost/")
public class CostController {
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

    @Autowired
    private PropertService propertService;
    @Autowired
    private PayService payService;
    @Autowired
    private UserService userService;

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
    public String shouju(@RequestParam(value="propertid",required = false) Integer propertid,Model model){
        Propert propert = propertService.findById(propertid);
        String begintime = propert.getBegintime();
        String year = begintime.substring(0,4);
        String month = begintime.substring(5,7);
        String day = begintime.substring(8);
        model.addAttribute("year",year);
        model.addAttribute("month",month);
        model.addAttribute("day",day);
        model.addAttribute("propert",propert);
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

    //收取物业费，查出该住户信息
    @RequestMapping(value = "findByBnameAndHname",produces = "application/json;charset=utf-8")
    @ResponseBody
    public User findByBnameAndUname(User user){
        User user1 = userService.findByBuildAndUnitHouse(user);
        return user1;
    }

    //改变年份时，应该改变对应的合计应交费用
    @RequestMapping(value = "findByYear",produces = "application/json;charset=utf-8")
    @ResponseBody
    public double findByYear(int year,double promoney,double owemoney){
        double money = owemoney + promoney * year;
        money = (double)Math.round(money*100)/100;
        return money;
    }

    //保存内容
    @RequestMapping(value = "addPropert",produces = "application/json;charset=utf-8")
    @ResponseBody
    public Propert addPropert(User user , int year, double money, String payway, String title){
        String propertno = UUID.randomUUID().toString().replace("-","");
        Date date = new Date();
        String begintime = sdf.format(date);
        long dateTime = date.getTime(); //将date类型转换成long类型进行计算
        long time = 60*60*365*1000*24L;     //24个小时，365天，几年60个60分钟，乘以1000，几年转换成毫秒
        dateTime = dateTime + time;     //将当前时间加上时间
        String endtime = sdf.format(dateTime); //打印时间

        User user1 = userService.findByBuildAndUnitHouse(user);
        Propert propert = new Propert();
        propert.setBuildingname(user1.getBuildingname());
        propert.setHousenum(user1.getHousenum());
        propert.setPropertno(propertno);
        propert.setMoney(money);
        propert.setBegintime(begintime);
        propert.setEndtime(endtime);
        propert.setUserid(user1.getId());
        propert.setPayid(year);
        propert.setPayway(payway);
        propert.setUsername(user1.getUsername());
        propert.setTitle(title);
        propert.setUnitname(user1.getUnitname());
        Propert propert1 = propertService.findPropert(propert);
        if(propert1 == null){
            propertService.saveInfo(propert);
        }
        return propert;
    }


}
