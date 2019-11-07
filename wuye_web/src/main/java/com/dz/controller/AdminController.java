package com.dz.controller;

import com.dz.dao.MD5Utils;
import com.dz.pojo.Admin;
import com.dz.pojo.User;
import com.dz.shiro.sendsms;
import com.dz.service.AdminService;
import com.dz.service.PropertService;
import com.dz.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
    //管理人员
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    @Autowired
    private PropertService propertService;

    /*跳转到登录页面*/
    @RequestMapping(value = "index")
    public String index(){
        return "admin/login";
    }
    @RequestMapping(value = "nopermission")
    public String nopermission(){
        return "admin/403";
    }

    /*验证码*/
    @RequestMapping(value = "code")
    public void code(String tel){
        sendsms.getcode(tel);
    }

    /*登录验证 */
    @RequestMapping(value = "login")
    public String viefy(User user,Model model){
        String password = user.getPassword();
        String MD5password = MD5Utils.MD5Encode(password, "utf-8");
        System.out.println(MD5password);
        try {
            SecurityUtils.getSubject().login(
                    new UsernamePasswordToken(user.getUsername(), MD5password)
            );
        } catch (AuthenticationException e) {
            e.printStackTrace();
            model.addAttribute("msg","用户名或密码错误");
            return "admin/login";
        }
        Integer countOwe = userService.findcount();
        double countOweMoney = userService.findCountMoney();
        Integer countSeven = propertService.findSeven();
        model.addAttribute("countOwe",countOwe);
        model.addAttribute("countOweMoney",countOweMoney);
        model.addAttribute("countSeven",countSeven);

            try {

                SecurityUtils.getSubject().login(
                        new UsernamePasswordToken(user.getUsername(), MD5password)
                );
            } catch (AuthenticationException e) {
                e.printStackTrace();
                model.addAttribute("msg", "用户名或密码错误");
                return "admin/login";
            }
        return "owe/owe-data";
        }



    /*退出*/
    @RequestMapping("logout")
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "admin/login";
    }

    //通过用户名查找pwd
    @RequestMapping(value = "findByName", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public Admin findByName(String name){
        return adminService.findByLoginName(name);
    }
}
