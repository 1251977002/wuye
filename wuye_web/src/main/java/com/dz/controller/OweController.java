package com.dz.controller;

import com.dz.pojo.Propert;
import com.dz.pojo.Record;
import com.dz.pojo.User;
import com.dz.service.PropertService;
import com.dz.service.RecordService;
import com.dz.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/owe/")
public class OweController {
    //欠费管理
    @Autowired
    private PropertService propertService;
    @Autowired
    private RecordService recordService;
    @Autowired
    private UserService userService;
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    /*跳转到首页*/
    @RequestMapping(value = "owedata")
    public String oweData(){
        return "owe/owe-data";
    }

    /*跳转到距离逾期还有七天（owe-qitian）页面*/
    @RequestMapping(value = "oweqitian")
    public String oweQitian(){
        return "owe/owe-qitian";
    }

    /*跳转已逾期页面（owe-yuqi）*/
    @RequestMapping(value = "oweyuqi")
    public String oweYuqi(){
        return "owe/owe-yuqi";
    }

    /*通过最新的一条账单的endtime和当前时间的比较查找逾期的用户*/
    @RequestMapping(value = "findPageByEndTime")
    @ResponseBody
    public PageInfo findPageByEndTime(int pageNum,String buildingname,String username){
        PageInfo pageInfo = propertService.findPropertByPage(pageNum,buildingname,username);
        List<Propert> propertList = pageInfo.getList();
        for (Propert propert1:propertList){
            User user = propert1.getUser();
            user.setOwemoney(propert1.getOvermoney());
            userService.updateOweMoney(user);
        }
        return pageInfo;
    }

    /*通过userID查找备注*/
    @RequestMapping(value = "findbyuserid",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Record> findByUserid(@RequestParam("userid") int userid){
        System.out.println(userid);
        return recordService.findByUserid(userid);
    }

    /*存储一条备注*/
    @RequestMapping(value = "saveRecord")
    public String saveRecord(String title,String adminname,Integer userid){
        Record record = new Record();
        record.setAdminname(adminname);
        record.setContent(title);
        record.setCreatetime(sdf.format(new Date()));
        record.setUserid(userid);
        recordService.saveRecord(record);
        return "redirect:oweyuqi";
    }

    @RequestMapping(value = "saveRecordSeven")
    public String saveRecordSeven(String title,String adminname,Integer userid){
        Record record = new Record();
        record.setAdminname(adminname);
        record.setContent(title);
        record.setCreatetime(sdf.format(new Date()));
        record.setUserid(userid);
        recordService.saveRecord(record);
        return "redirect:oweqitian";
    }

    /*通过最新的一条账单的endtime和当前时间的比较查找七天内到期的用户*/
    @RequestMapping(value = "findPageBySevenDay")
    @ResponseBody
    public PageInfo findPageBySevenDay(int pageNum,String buildingname,String username){
        PageInfo pageInfo = propertService.findSevenPropertByPage(pageNum,buildingname,username);
        return pageInfo;
    }
}
