package com.dz.controller;

import com.dz.pojo.User;
import com.dz.service.PropertService;
import com.dz.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
    //管理人员
    @Autowired
    private UserService userService;
    @Autowired
    private PropertService propertService;

    /*跳转到登录页面*/
    @RequestMapping(value = "index")
    public String index(){
        return "admin/login";
    }
    /*登录验证 */
    @RequestMapping(value = "login")
    public String viefy(User user,Model model){
        try {
            SecurityUtils.getSubject().login(
                    new UsernamePasswordToken(user.getUsername(), user.getPassword())
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

        return "owe/owe-data";

    }

    @RequestMapping("logout")
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "admin/login";
    }

}
