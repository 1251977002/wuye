package com.dz.service;

import com.dz.dao.UnitDao;
import com.dz.pojo.Unit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class UnitService {
    /*查询所有单元信息*/

    @Autowired
    private UnitDao unitDao;


    /*查询所有单元信息*/
    public List<Unit> findAllUnit(Model model) {
        return unitDao.findAllUnit(model);
    }

    /*删除单元信息*/
    public void deleteUnit(int id) {
        unitDao.deleteUnit(id);
    }

    /*添加单元信息*/
    public void saveUnit(Unit unit) {
        unitDao.saveUnit(unit);
    }
    /*添加套房列表中的信息*/
    public void saveroom(Unit unit) {
        unitDao.saveroom(unit);
    }
}
