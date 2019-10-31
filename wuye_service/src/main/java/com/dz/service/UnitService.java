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

    //根据单元名称查
    public Unit findByName(String name) {
        return unitDao.findByName(name);
    }
}
