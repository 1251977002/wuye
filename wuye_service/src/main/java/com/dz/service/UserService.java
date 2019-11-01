package com.dz.service;

import com.dz.dao.UserDao;
import com.dz.pojo.User;

import org.springframework.beans.factory.annotation.Autowired;
import com.dz.dao.UserDao;
import com.dz.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional/*事务控制*/
@Service
public class UserService {

    @Autowired
    private UserDao userDao;


    //user列表分页
    public PageInfo<User> findUserByParam(int pageNum,String username,String status) {
        PageHelper.startPage(pageNum, 3);
        Map<String,Object> map = new HashMap<String,Object>();
        if(!StringUtils.isEmpty(username)){
            map.put("username","%" + username + "%");
        }
        if(!StringUtils.isEmpty(status)){
            map.put("status",status);
        }
        List<User> users = userDao.findUserByParam(map);
        PageInfo<User> pageInfo = new PageInfo<User>(users);
        //pageInfo.setList(users);
        return pageInfo;
    }


    /*添加套房信息*/
    public void saveroom(User user) {
        userDao.saveroom(user);
    }

    //分页
    //保存user
    public int save(User user,String unithouse) {
        String unitname = unithouse.substring(0,3);
        String housenum = unithouse.substring(3);
        user.setUsername(user.getUsername());
        user.setBuildingname(user.getBuildingname());
        user.setHousenum(housenum);
        user.setUnitname(unitname);
        user.setCard(user.getCard());
        user.setSex(user.getSex());
        user.setTel(user.getTel());
        user.setPassword(user.getCard().substring(0,3));
        userDao.save(user);
        return user.getId();
    }
    //查找房间中是否有住户
    public User findByBuildAndUnitHouse(User user) {
        return userDao.findByBuildAndUnitHouse(user);
    }

    /*查询所有业主信息*/
    public List<User> findAllUser(Model model) {
        return userDao.findAllUser(model);
    }

}
