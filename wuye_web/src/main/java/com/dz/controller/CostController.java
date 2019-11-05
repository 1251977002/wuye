package com.dz.controller;

import com.dz.pojo.Pay;
import com.dz.pojo.Propert;
import com.dz.pojo.User;
import com.dz.service.PayService;
import com.dz.service.PropertService;
import com.dz.service.UserService;
import com.github.pagehelper.PageInfo;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
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
    public String feelist(@RequestParam(value="userid",required = false) Integer userid,Model model){
        List<Propert> propertList = propertService.findByUserid(userid);
        model.addAttribute("propertList",propertList);
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
    public User findByBnameAndHname(User user){
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
    public Propert addPropert(User user , int year, double money, String payway, String title,String adminname){
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
        propert.setAdminname(adminname);
        Propert propert1 = propertService.findPropert(propert);
        if(propert1 == null){
            propertService.saveInfo(propert);
        }
        return propert;
    }

    //通过id查询物业费
    @RequestMapping(value = "findAllById",produces = "application/json;charset=utf-8")
    @ResponseBody
    public Propert findAllById(int propertid){
        Propert propert = propertService.findById(propertid);
        return propert;
    }

    //通过id更改物业账单（若时间不为0，说明已缴纳，无需重新缴纳）
    @RequestMapping(value = "updateById",produces = "application/json;charset=utf-8")
    @ResponseBody
    public Propert updateById(int propertid,String payway){
        Propert propert = propertService.findById(propertid);
        String time = propert.getPaytime();
        if(time.equals("0")){
            String paytime = sdf.format(new Date());
            propertService.updateById(paytime,payway,propertid);
        }
        return propert;
    }

    //导出excel表格
    @RequestMapping(value = "export")
    @ResponseBody
    public void export(HttpServletResponse response, HttpServletRequest request) throws IOException {
        List<Propert> propertList = propertService.findAllBuilding();
        Workbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet();
        Row row = sheet.createRow(0);
        Cell cell1 = row.createCell(0);
        Cell cell2 = row.createCell(1);
        Cell cell3 = row.createCell(2);
        Cell cell4 = row.createCell(3);
        Cell cell5 = row.createCell(4);
        Cell cell6 = row.createCell(5);
        Cell cell7 = row.createCell(6);
        Cell cell8 = row.createCell(7);
        Cell cell9 = row.createCell(8);
        cell1.setCellValue("楼栋号");
        cell2.setCellValue("单元");
        cell3.setCellValue("房号");
        cell4.setCellValue("业主姓名");
        cell5.setCellValue("物业费开始时间");
        cell6.setCellValue("物业费到期时间");
        cell7.setCellValue("往年欠费");
        cell8.setCellValue("标准物业费");
        cell9.setCellValue("应付总计");
        if(propertList != null && propertList.size() > 0){
            for(int i = 1;i <= propertList.size();i++){
                Propert rowPro = propertList.get(i - 1);
                Row proRow = sheet.createRow(i);
                Cell c1 = proRow.createCell(0);
                Cell c2 = proRow.createCell(1);
                Cell c3 = proRow.createCell(2);
                Cell c4 = proRow.createCell(3);
                Cell c5 = proRow.createCell(4);
                Cell c6 = proRow.createCell(5);
                Cell c7 = proRow.createCell(6);
                Cell c8 = proRow.createCell(7);
                Cell c9 = proRow.createCell(8);
                c1.setCellValue(rowPro.getBuildingname());
                c2.setCellValue(rowPro.getUnitname());
                c3.setCellValue(rowPro.getHousenum());
                c4.setCellValue(rowPro.getUsername());
                c5.setCellValue(rowPro.getBegintime());
                c6.setCellValue(rowPro.getEndtime());
                c7.setCellValue(rowPro.getUser().getOwemoney());
                c8.setCellValue(rowPro.getUser().getModel().getPropertmoney());
                c9.setCellValue(rowPro.getMoney());
            }
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition","attachment;filename=\"temp1.xls\"");

            OutputStream os = response.getOutputStream();
            workbook.write(os);
            os.close();
        }

    }

}
