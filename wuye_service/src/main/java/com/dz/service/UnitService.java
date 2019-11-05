package com.dz.service;

import com.dz.dao.UnitDao;
import com.dz.pojo.Unit;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

    //根据单元名称查
    public Unit findByName(String name) {
        return unitDao.findByName(name);
    }

    //所有的单元
    public List<Unit> findAll() {
        return unitDao.findAll();
    }

    /*分页*/
    public PageInfo findByPage(int pageNum) {
        PageHelper.startPage(pageNum,3);
        List<Unit> unitList = unitDao.findAll();
        PageInfo pageInfo = new PageInfo(unitList);
        return pageInfo;

    }

    /*编辑单元信息*/
    public void edit(Unit unit) {
        unitDao.edit(unit);
    }
}
