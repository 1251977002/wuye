package com.dz.service;

import com.dz.dao.BuidlingDao;
import com.dz.dao.PropertDao;
import com.dz.dao.UserDao;
import com.dz.pojo.Building;
import com.dz.pojo.Propert;
import com.dz.pojo.User;
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

    //分页显示物业收取列表
    public PageInfo findByPage(int pageNum,String buildingname,String username) {
        PageHelper.startPage(pageNum, 3);
        Map<String,Object> map = new HashMap<String,Object>();
        if(!StringUtils.isEmpty(buildingname)){
            map.put("buildingname",buildingname);
        }
        if(!StringUtils.isEmpty(username)){
            map.put("username","%" + username + "%");
        }
        List<Propert> propertList = propertDao.findByPage(map);
        PageInfo pageInfo = new PageInfo(propertList);
        return pageInfo;
    }

    //通过楼栋和姓名查找
    public Propert findByBnameAndHname(String buildname, String housename) {
        return propertDao.findByBnameAndHname(buildname,housename);
    }

    //查找物业费，看是否有重复
    public Propert findPropert(Propert propert) {
        String begintime = propert.getBegintime();
        String buildingname = propert.getBuildingname();
        String unitname = propert.getUnitname();
        String housenum = propert.getHousenum();
        return propertDao.findPropert(begintime,buildingname,unitname,housenum);
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


    public void saveInfo(Propert propert) {
        propertDao.saveInfo(propert);
    }

    public Propert findById(Integer propertid) {
        return propertDao.findById(propertid);
    }
}
