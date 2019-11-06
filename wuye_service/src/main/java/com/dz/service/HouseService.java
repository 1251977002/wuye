package com.dz.service;

import com.dz.dao.HouseDao;
import com.dz.pojo.House;
import com.dz.pojo.Unit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HouseService {
    @Autowired
    private HouseDao houseDao;
    //保存住户的房间信息
    public void save(String housenum, String buildingname, int userId, String unitname, int modelid) {
        House house = new House();
        house.setHousenum(Integer.parseInt(housenum));
        house.setUserid(userId);
        house.setUnitname(unitname);
        house.setModelid(modelid);
        house.setBuildingname(buildingname);
        houseDao.save(house);
    }
    //删除住户的房间信息
    public void del(int housenum,String buildingname,String unitname) {
        houseDao.del(housenum,buildingname,unitname);
    }
}
