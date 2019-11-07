package com.dz.controller;

import com.dz.pojo.File;
import com.dz.service.FileService;
import com.dz.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;

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
    public PageInfo<File> findByPage(int pageNum, String userid) {
        PageInfo<File> userPageInfo = fileService.findFileByUserId(pageNum, Integer.parseInt(userid));
        return userPageInfo;
    }

    //根据id删除文件
    @RequestMapping(value = "deleteFile")
    public String deleteFile(int id) {
        fileService.deleteFileById(id);
        return "user/user-list";
    }

    //预览

    @RequestMapping("showFile")
    @ResponseBody    //不做跳转
    public void showFile(String filename, HttpServletResponse response) throws Exception {
        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(new java.io.File("e:/upload/" + filename)));
        BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
        int len = -1;
        while((len = bis.read()) != -1){
            bos.write(len);
        }
        bis.close();
        bos.flush();
        bos.close();
        return;
    }
}
