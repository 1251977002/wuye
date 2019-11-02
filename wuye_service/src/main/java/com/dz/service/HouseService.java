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
    public void save(String housenum, int userId, Unit unit, int modelid) {
        House house = new House();
        house.setHousenum(Integer.parseInt(housenum));
        house.setUserid(userId);
        house.setUnitid(unit.getId());
        house.setModelid(modelid);
        houseDao.save(house);
    }
    //删除住户的房间信息
    public void del(int housenum) {
        houseDao.del(housenum);
    }
}
