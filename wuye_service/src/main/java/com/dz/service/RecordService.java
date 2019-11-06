package com.dz.service;

import com.dz.dao.RecordDao;
import com.dz.pojo.Record;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

    public void save(Record record) {
        recordDao.save(record);
    }

    public PageInfo<Record> findNoticeByUserId(int pageNum, int userid) {
        PageHelper.startPage(pageNum, 3);
        List<Record> recordList = recordDao.findNoticeByUserId(userid);
        PageInfo<Record> pageInfo = new PageInfo<Record>(recordList);
        return  pageInfo;
    }
}
