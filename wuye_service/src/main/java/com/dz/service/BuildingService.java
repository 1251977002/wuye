package com.dz.service;

import com.dz.dao.BuidlingDao;
import com.dz.pojo.Building;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

import java.util.List;
import java.util.Map;

@Service
public class BuildingService {

    @Autowired
    private BuidlingDao buidlingDao;

    /*展示所有楼栋信息*/
    public List<Building> findAllBuilding(Model model) {
        return buidlingDao.findAllbuilding(model);
    }

    /*删除楼栋信息*/
    public void deleteBuilding(int id) {
        buidlingDao.deletebuilding(id);
    }


    public List<Building> findAll() {
        return buidlingDao.findAll();
    }


    /*添加楼栋信息*/
    public void saveBuilding(Building building) {
        buidlingDao.saveBuilding(building);
    }

    /*添加套房列表中的信息*/
    public void saveroom(Building building) {
        buidlingDao.saveroom(building);
    }

    /*查找所有的楼栋*/
    public List<String> findBuilding() {
        return buidlingDao.findBuilding();
    }
}
