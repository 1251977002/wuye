package com.dz.service;

import com.dz.dao.NoticeDao;
import com.dz.pojo.Notice;
import com.dz.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private NoticeDao noticeDao;
    public PageInfo<Notice> findBypageNo(int pageNum) {
        PageHelper.startPage(pageNum, 3);
        List<Notice> noticeList = noticeDao.findBypageNo();
        PageInfo<Notice> pageInfo = new PageInfo<Notice>(noticeList);
        return  pageInfo;
    }

    public void saveNotice(Notice notice) {
        noticeDao.saveNotice(notice);
    }

    public void delBynoticeid(int notice) {
        noticeDao.delBynoticeid(notice);
    }

    public void save(Notice notice) {
        noticeDao.save(notice);
    }

    public PageInfo<Notice> findNoticeByUserId(int pageNum, int userid) {
        PageHelper.startPage(pageNum, 3);
        List<Notice> noticeList = noticeDao.findNoticeByUserId(userid);
        PageInfo<Notice> pageInfo = new PageInfo<Notice>(noticeList);
        return  pageInfo;
    }
}
