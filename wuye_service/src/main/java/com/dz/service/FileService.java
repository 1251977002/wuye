package com.dz.service;

import com.dz.dao.FileDao;
import com.dz.pojo.File;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileService {
    @Autowired
    private FileDao fileDao;
    public void save(File file1) {
        fileDao.save(file1);
    }

    //文件夹分页
    public PageInfo<File> findFileByUserId(int pageNum, int userid) {
        PageHelper.startPage(pageNum, 3);
        List<File> files = fileDao.findFileByUserId(userid);
        PageInfo<File> pageInfo = new PageInfo<File>(files);
        return pageInfo;
    }

    //删除文件
    public void deleteFileById(int id) {
        fileDao.deleteFileById(id);
    }
}
