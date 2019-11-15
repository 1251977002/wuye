package com.dz.controller;

import com.dz.pojo.Propert;
import com.dz.pojo.Record;
import com.dz.pojo.User;
import com.dz.service.PropertService;
import com.dz.service.RecordService;
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
    public String oweData(Model model){
        Integer countOwe = userService.findcount();
        double countOweMoney = userService.findCountMoney();
        Integer countSeven = propertService.findSeven();
        model.addAttribute("countOwe",countOwe);
        model.addAttribute("countOweMoney",countOweMoney);
        model.addAttribute("countSeven",countSeven);
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
    /*保存一条备注*/
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
    /*导出逾期Excel表*/
    @RequestMapping(value = "exportyuqi")
    @ResponseBody
    public void exportyuqi(HttpServletResponse response, HttpServletRequest request) throws IOException {
        List<Propert> propertList = propertService.findPropertowe();
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
        Cell cell10 = row.createCell(9);
        cell1.setCellValue("楼栋号");
        cell2.setCellValue("单元");
        cell3.setCellValue("房间号");
        cell4.setCellValue("业主姓名");
        cell5.setCellValue("联系电话");
        cell6.setCellValue("到期时间");
        cell7.setCellValue("物业费标准");
        cell8.setCellValue("逾期天数");
        cell9.setCellValue("所欠物业费");
        cell10.setCellValue("备注");
        if(propertList != null && propertList.size()>0){
            for(int i = 1; i<=propertList.size();i++){
                Propert propert = propertList.get(i-1);
                Row row1 = sheet.createRow(i);
                Cell c1 = row1.createCell(0);
                Cell c2 = row1.createCell(1);
                Cell c3 = row1.createCell(2);
                Cell c4 = row1.createCell(3);
                Cell c5 = row1.createCell(4);
                Cell c6 = row1.createCell(5);
                Cell c7 = row1.createCell(6);
                Cell c8 = row1.createCell(7);
                Cell c9 = row1.createCell(8);
                Cell c10 = row1.createCell(9);
                c1.setCellValue(propert.getBuildingname());
                c2.setCellValue(propert.getUnitname());
                c3.setCellValue(propert.getHousenum());
                c4.setCellValue(propert.getUser().getUsername());
                c5.setCellValue(propert.getUser().getTel());
                c6.setCellValue(propert.getEndtime());
                c7.setCellValue(propert.getUser().getModel().getPropertmoney());
                c8.setCellValue(propert.getOverday());
                c9.setCellValue(propert.getOvermoney());
                c10.setCellValue(propert.getRecord().getContent());
            }

        }
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition","attachment;filename=\"temp1.xls\"");

        OutputStream os = response.getOutputStream();
        workbook.write(os);
        os.close();

    }
    /*导出七天过期的Excel表*/
    @RequestMapping(value = "exportqitian")
    @ResponseBody
    public void exportqitian(HttpServletResponse response, HttpServletRequest request) throws IOException {
        List<Propert> propertList = propertService.findSevenPropertOwe();
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
        Cell cell10 = row.createCell(9);
        cell1.setCellValue("楼栋号");
        cell2.setCellValue("单元");
        cell3.setCellValue("房间号");
        cell4.setCellValue("业主姓名");
        cell5.setCellValue("联系电话");
        cell6.setCellValue("物业费标准");
        cell7.setCellValue("到期时间");
        cell8.setCellValue("备注");
        if(propertList != null && propertList.size()>0){
            for(int i = 1; i<=propertList.size();i++){
                Propert propert = propertList.get(i-1);
                Row row1 = sheet.createRow(i);
                Cell c1 = row1.createCell(0);
                Cell c2 = row1.createCell(1);
                Cell c3 = row1.createCell(2);
                Cell c4 = row1.createCell(3);
                Cell c5 = row1.createCell(4);
                Cell c6 = row1.createCell(5);
                Cell c7 = row1.createCell(6);
                Cell c8 = row1.createCell(7);
                c1.setCellValue(propert.getBuildingname());
                c2.setCellValue(propert.getUnitname());
                c3.setCellValue(propert.getHousenum());
                c4.setCellValue(propert.getUser().getUsername());
                c5.setCellValue(propert.getUser().getTel());
                c6.setCellValue(propert.getEndtime());
                c7.setCellValue(propert.getUser().getModel().getPropertmoney());
                c8.setCellValue(propert.getRecord().getContent());
            }

        }
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition","attachment;filename=\"temp1.xls\"");

        OutputStream os = response.getOutputStream();
        workbook.write(os);
        os.close();

    }
}
