package com.dz.service;

import com.dz.dao.BuidlingDao;
import com.dz.pojo.Building;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuildingService {
    @Autowired
    private BuidlingDao buidlingDao;

    public List<Building> findAll() {
        return buidlingDao.findAll();
    }
}
