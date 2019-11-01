package com.dz.service;

import com.dz.dao.BBSDao;
import com.dz.pojo.BBS;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BBSService {
    @Autowired
    private BBSDao bbsDao;
    public void saveBBS(BBS bbs) {
        bbsDao.saveBBS(bbs);
    }

    public PageInfo<BBS> findBypageNo(int pageNum) {
        PageHelper.startPage(pageNum, 3);
        List<BBS> bbsList = bbsDao.findBypageNo();
        PageInfo<BBS> pageInfo = new PageInfo<BBS>(bbsList);
        return  pageInfo;
    }

    public BBS findByid(int bbsid) {
        return bbsDao.findByid(bbsid);

    }

    public void delBybbsid(int bbsid) {
        bbsDao.delBybbsid(bbsid);
    }
}
