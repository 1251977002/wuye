package com.dz.service;

import com.dz.dao.ModelDao;
import com.dz.pojo.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModelService {

    @Autowired
    private ModelDao modelDao;
    /*删除户型信息*/
    public void deletemodel(int id) {
        modelDao.deletemodel(id);
    }

    /*查询所有户型*/
    public List<Model> findAllModel(org.springframework.ui.Model model) {
        return modelDao.findAllModel(model);
    }

    /*添加户型信息*/
    public void savemodel(Model model) {
        modelDao.savemodel(model);
    }

    /*添加套房信息*/
    public void saveroom(Model model) {
        modelDao.saveroom(model);
    }
}
