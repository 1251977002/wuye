package com.dz.controller;

import com.dz.pojo.User;
import com.dz.shiro.sendsms;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
    //管理人员

    /*跳转到登录页面*/
    @RequestMapping(value = "index")
    public String index(){
        return "admin/login";
    }

    /*验证码*/
    @RequestMapping(value = "code")
    public void code(String tel){
        sendsms.getcode(tel);
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

}
