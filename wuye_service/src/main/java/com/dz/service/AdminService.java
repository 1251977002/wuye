package com.dz.service;

import com.dz.dao.AdminDao;
import com.dz.pojo.Admin;
import com.dz.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    private AdminDao adminDao;

    /*登录时候需要验证*/
    public Admin findByLoginName(String adminname) {
        return adminDao.findByLoginName(adminname);
    }

    //保存用户登录的name和pwd
    public void save(User user) {
        Admin admin = new Admin();
        admin.setAdminname(user.getUsername());
        admin.setPassword(user.getCard().substring(0,3));
        admin.setRoleid(2);
        adminDao.save(admin);
    }
}
