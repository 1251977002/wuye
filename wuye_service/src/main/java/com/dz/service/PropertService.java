package com.dz.service;

import com.dz.dao.PropertDao;
import com.dz.pojo.Propert;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertService {

    @Autowired
    private PropertDao propertDao;

    public PageInfo findByPage(int pageNum) {
        PageHelper.startPage(pageNum,3);
        List<Propert> propertList = propertDao.findByPage();
        PageInfo pageInfo = new PageInfo(propertList);
        return pageInfo;
    }

    public Propert findByBidAndUid(String buildingname, String username) {
        return propertDao.findByBidAndUid(buildingname,username);
    }

}
