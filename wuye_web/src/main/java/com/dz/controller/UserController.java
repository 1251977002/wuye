package com.dz.controller;

import com.dz.pojo.Unit;
import com.dz.pojo.User;
import com.dz.service.AdminService;
import com.dz.service.HouseService;
import com.dz.service.UnitService;
import com.dz.service.UserService;
import com.github.pagehelper.PageInfo;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;


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
    @Autowired
    private AdminService adminService;

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
        userPageInfo.getList().get(0).getModel();
        return userPageInfo;
    }

    //保存user
    @RequestMapping("save")
    public String saveUser( User user,String unithouse, int modelid) {
        //保存user
        int userId = userService.save(user, unithouse);
        //保存到admin登陆表中
        adminService.save(user);
        //保存到房间表中
        return "user/user-list";
    }

    //查找某个房间有没有住户
    @RequestMapping(value = "findByBuildAndUnitHouse", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public User findByBuildAndUnitHouse(User user) {
        return userService.findByBuildAndUnitHouse(user);
    }

    //删除住户
    @RequestMapping(value = "delByhouseNum")
    public String delByhouseNum(String housenum) {
        //user表中删除
        userService.delByhouseNum(housenum);
        return "user/user-list";
    }

    //更新住户信息
    @RequestMapping(value = "update", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public int updateUser(User user){
        userService.update(user);
        return 0;
    }

    //根据id查找user
    @RequestMapping(value = "findById", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public User findById(int id){
        return userService.findById(id);
    }

    //导出
    @RequestMapping(value = "export", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public void export(HttpServletResponse response, HttpServletRequest request) throws IOException {
        //查询所有的user
        List<User> userList = userService.findAll();
        //创建excel表格并把user存入表格中
        Workbook book = new HSSFWorkbook();
        Sheet sheet = book.createSheet();

        Row row = sheet.createRow(0);
        Cell cell1 = row.createCell(0);
        Cell cell2 = row.createCell(1);
        Cell cell3 = row.createCell(2);
        Cell cell4 = row.createCell(3);
        Cell cell5 = row.createCell(4);
        Cell cell6 = row.createCell(5);
        Cell cell7 = row.createCell(6);
        Cell cell8 = row.createCell(7);
        cell1.setCellValue("户主姓名");
        cell2.setCellValue("性别");
        cell3.setCellValue("身份证号");
        cell4.setCellValue("手机号");
        cell5.setCellValue("楼栋");
        cell6.setCellValue("单元号");
        cell7.setCellValue("房间号");
        cell8.setCellValue("房型");
        if(userList != null && userList.size() > 0){
            for (int i = 1;i <= userList.size();i++){
                User rowUser = userList.get(i - 1);
                Row userRow = sheet.createRow(i);
                Cell cel1 = userRow.createCell(0);
                Cell cel2 = userRow.createCell(1);
                Cell cel3 = userRow.createCell(2);
                Cell cel4 = userRow.createCell(3);
                Cell cel5 = userRow.createCell(4);
                Cell cel6 = userRow.createCell(5);
                Cell cel7 = userRow.createCell(6);
                Cell cel8 = userRow.createCell(7);
                cel1.setCellValue(rowUser.getUsername());
                cel2.setCellValue(rowUser.getSex());
                cel3.setCellValue(rowUser.getCard());
                cel4.setCellValue(rowUser.getTel());
                cel5.setCellValue(rowUser.getBuildingname());
                cel6.setCellValue(rowUser.getUnitname());
                cel7.setCellValue(rowUser.getHousenum());
                cel8.setCellValue(rowUser.getModel().getModelname());
            }
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename=\"book.xls\"");

            OutputStream os = response.getOutputStream();
            book.write(os);
            os.close();
        }
    }
    @RequestMapping(value = "findByPageNo", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public PageInfo findByPageNo(int pageNum){
        return userService.findByPageNo(pageNum);
    }
}
