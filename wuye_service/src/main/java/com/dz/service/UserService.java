package com.dz.service;

import com.dz.dao.UserDao;
import com.dz.pojo.Model;
import com.dz.pojo.User;

import org.springframework.beans.factory.annotation.Autowired;
import com.dz.dao.UserDao;
import com.dz.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

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
        user.setLoginname(user.getLoginname());
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
    public void delUser(int id) {
        userDao.delUser(id);
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

    /*查询所有业主信息*/
    public List<User> findAllUser(Model model) {
        return userDao.findAllUser(model);
    }

    /*更新user表中的owemoney*/
    public void updateOweMoney(User user) {
         userDao.updateOweMoney(user);
    }

    /*查找逾期总人数*/
    public Integer findcount() {
        return userDao.findcount();
    }
    /*查找逾期所欠总金额*/
    public double findCountMoney() {
        return userDao.findCountMoney();
    }

    /*首页分页所需的数据*/
    public PageInfo<User> findByPageNo(int pageNum) {
        PageHelper.startPage(pageNum, 5);
        List<User> userList = userDao.findPageByEveryBuildingName();
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        return  pageInfo;
    }

    public void updateNameAndTel(String username,String tel,int id) {
        userDao.updateNameAndTel(username,tel,id);
    }

    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    public void updateById(double owemoney, int id) {
        owemoney = 0;
        userDao.updateById(owemoney,id);
    }
}
