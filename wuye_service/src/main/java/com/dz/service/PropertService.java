package com.dz.service;

import com.dz.dao.BuidlingDao;
import com.dz.dao.PropertDao;
import com.dz.dao.UserDao;
import com.dz.pojo.Building;
import com.dz.pojo.Propert;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PropertService {

    @Autowired
    private PropertDao propertDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private BuidlingDao buidlingDao;

    public PageInfo findByPage(int pageNum) {
        PageHelper.startPage(pageNum,3);
        List<Propert> propertList = propertDao.findByPage();
        PageInfo pageInfo = new PageInfo(propertList);
        return pageInfo;
    }

    public Propert findByBidAndUid(String buildingname, String username) {
        return propertDao.findByBidAndUid(buildingname,username);
    }
    /*查找所有的物业费表中的信息*/
    //todo
    public PageInfo findByPageroomList(int pageNum,String username,String status) {
        PageHelper.startPage(pageNum,3);

        if(!StringUtils.isEmpty(username)){
            userDao.findUserByusername(username);
        }
        if(!StringUtils.isEmpty(status)){
            buidlingDao.findBuildingByName(status);
        }

        List<Propert> propertList = propertDao.findAll();
        PageInfo pageInfo = new PageInfo(propertList);
        return pageInfo;
    }

    /*删除room*/
    public void delroom(int id) {
        propertDao.delroom(id);
    }

    /*查询所有buildingname*/
    public List<Propert> findAllBuilding() {
        return propertDao.findAllBuilding();
    }


    /*public Propert findById(Integer id) {
        Propert propert = propertDao.findById(id);
        return propert;
    }*/
}
