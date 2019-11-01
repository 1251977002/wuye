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
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.UserRoleAuthorizationInterceptor;

import javax.jws.soap.SOAPBinding;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional/*事务控制*/
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    /*登录时候需要验证*/
    public User findByLoginName(String username) {
        return userDao.findByLoginName(username);
    }

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
        user.setPassword(user.getCard().substring(0,3));
        user.setBuildingname(user.getBuildingname());
        user.setHousenum(housenum);
        user.setUnitname(unitname);
        user.setCard(user.getCard());
        user.setSex(user.getSex());
        user.setTel(user.getTel());
        user.setModelid(user.getModelid());
        userDao.save(user);
        return user.getId();
    }
    //查找房间中是否有住户
    public User findByBuildAndUnitHouse(User user) {
        return userDao.findByBuildAndUnitHouse(user);
    }

    //删除
    public void delByhouseNum(String housenum) {
        userDao.delByhouseNum(housenum);
    }

    //更新
    public void update(User user) {

        userDao.update(user);
    }
    //根据id查找user
    public User findById(int id) {
        return userDao.findById(id);
    }

    public List<User> findAll() {
        List<User> userList =  userDao.findAll();
        return userList;
    }
}
