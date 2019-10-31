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
    public List<Model> findAll() {
        return modelDao.findAll();
    }

    public Model findModelById(int modelid) {
        return modelDao.findModelById(modelid);
    }
}
