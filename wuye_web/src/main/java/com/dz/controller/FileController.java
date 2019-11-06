package com.dz.controller;

import com.dz.pojo.File;
import com.dz.pojo.User;
import com.dz.service.FileService;
import com.dz.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/file/")
public class FileController {
    @Autowired
    private FileService fileService;
    @Autowired
    private UserService userService;

    //分页查找关于一个用户的所有文件
    @RequestMapping(value = "findByPage", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public PageInfo<File> findByPage(int pageNum, String username) {
        User user = userService.findByUserName(username);
        PageInfo<File> userPageInfo = fileService.findFileByUserId(pageNum, user.getId());
        return userPageInfo;
    }

    //根据id删除文件
    @RequestMapping(value = "deleteFile")
    public String deleteFile(int id) {
        fileService.deleteFileById(id);
        return "user/user-list";
    }
}
