package com.dz.service;

import com.dz.dao.BBSCommentDao;
import com.dz.pojo.BBS;
import com.dz.pojo.BBSComment;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BBSCommentService {
    @Autowired
    private BBSCommentDao bbsCommentDao;
    public PageInfo<BBSComment> findPageBBSComment(int id, int pageNum) {
        PageHelper.startPage(pageNum, 3);
        List<BBSComment> bbsCommentList = bbsCommentDao.findPageBBSComment(id);
        PageInfo<BBSComment> pageInfo = new PageInfo<BBSComment>(bbsCommentList);
        return  pageInfo;
    }

    public void saveBBSComment(BBSComment bbsComment) {
        bbsCommentDao.saveBBSComment(bbsComment);
    }

    public void delBybbsid(int bbsid) {
        bbsCommentDao.delBybbsid(bbsid);
    }
}
