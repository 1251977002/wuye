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
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PropertService {

    @Autowired
    private PropertDao propertDao;
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
    public Propert findByBnameAndUname(String buildname, String username) {
        String username1 = "%" + username + "%";
        return propertDao.findByBnameAndUname(buildname,username1);
    }
}
