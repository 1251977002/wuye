package com.dz.service;

import com.dz.dao.RecordDao;
import com.dz.pojo.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class RecordService {
    @Autowired
    private RecordDao recordDao;


    public List<Record> findByUserid(int userid){
        return recordDao.findByUserid(userid);
    }

    public void saveRecord(Record record) {
        recordDao.saveRecord(record);
    }
}
