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
    public PageInfo findByPageroomList(int pageNum,String username,String buildingname) {
        PageHelper.startPage(pageNum,3);
        Map<String,Object> map = new HashMap<String,Object>();
        if(!StringUtils.isEmpty(username)){
            map.put("username","%" + username + "%");
        }
        if(!StringUtils.isEmpty(buildingname)){
            map.put("buildingname",buildingname);
        }

        List<Propert> propertList = propertDao.findAll(map);
        PageInfo pageInfo = new PageInfo(propertList);
        return pageInfo;
    }

    /*查找所有的物业费表中的信息*/
    public PageInfo findByPageroomList1(int pageNum,String username,String status) {
        PageHelper.startPage(pageNum,3);
        Map<String,Object> map = new HashMap<String,Object>();
        if(!StringUtils.isEmpty(username)){
            map.put("username","%" + username + "%");
        }
        if(!StringUtils.isEmpty(status)){
            map.put("status",status);
        }

        List<Propert> propertList = propertDao.findAll1(map);
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

    /*保存账单信息*/
    public void saveInfo(Propert propert) {
        propertDao.saveInfo(propert);
    }

    /*通过id查找物业账单*/
    public Propert findById(Integer propertid) {
        return propertDao.findById(propertid);
    }

    /*对逾期用户进行分页*/
    public PageInfo findPropertByPage(int pageNum,String buildingname,String username) {
        PageHelper.startPage(pageNum, 3);
        Map<String,Object> map = new HashMap<String,Object>();
        if(!StringUtils.isEmpty(buildingname)){
            map.put("buildingname",buildingname);
        }
        if(!StringUtils.isEmpty(username)){
            map.put("username","%" + username + "%");
        }
        List<Propert> propertList = propertDao.findPropertByPage(map);
        PageInfo pageInfo = new PageInfo(propertList);
        return pageInfo;
    }

    /*查找所有逾期用户并不分页*/
    public List<Propert> findPropertowe() {

        List<Propert> propertList = propertDao.findPropertowe();
        return propertList;

    }

    /*对七天内到期用户进行分页*/
    public PageInfo findSevenPropertByPage(int pageNum,String buildingname,String username) {
        PageHelper.startPage(pageNum, 3);
        Map<String,Object> map = new HashMap<String,Object>();
        if(!StringUtils.isEmpty(buildingname)){
            map.put("buildingname",buildingname);
        }
        if(!StringUtils.isEmpty(username)){
            map.put("username","%" + username + "%");
        }
        List<Propert> propertList = propertDao.findSevenPropertByPage(map);
        PageInfo pageInfo = new PageInfo(propertList);
        return pageInfo;
    }

    /*查找七天内到期用户不分页*/
    public List<Propert> findSevenPropertOwe() {

        List<Propert> propertList = propertDao.findSevenPropertOwe();

        return propertList;
    }


    public void saveroom(int userId) {
        Propert propert = new Propert();
        propert.setUserid(userId);
        propertDao.save(userId);
    }

    /*通过用户id查找物业账单*/
    public List<Propert> findByUserid(Integer userid) {
        return propertDao.findByUserid(userid);
    }

    /*通过id改变缴费时间*/
    public void updateById(String paytime,String payway,String state,int propertid) {
        propertDao.updateById(paytime,payway,state,propertid);
    }
    /*查找七天内物业费过期的总人数*/
    public Integer findSeven() {
        return propertDao.findSeven();
    }
}
