package com.dz.service;

import com.dz.dao.PayDao;
import com.dz.pojo.Pay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PayService {

    @Autowired
    private PayDao payDao;

    public List<Pay> findAllYear() {
        return payDao.findAllYear();
    }
}
