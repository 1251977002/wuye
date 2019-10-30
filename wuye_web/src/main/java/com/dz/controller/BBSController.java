package com.dz.controller;

import com.dz.pojo.BBS;
import com.dz.pojo.BBSComment;
import com.dz.service.BBSService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/bbs/")
public class BBSController {
    //社区论坛
    @Autowired
    private BBSService bbsService;
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   /*跳转到bbs-list页面*/
    @RequestMapping(value = "bbslist")
    public String bbsLIst(){
        return "bbs/bbs-list";
    }

    /*对bbslist进行分页*/
    @RequestMapping(value = "findPageBBS")
    @ResponseBody
    public PageInfo<BBS> findPageBBS(int pageNum){

        return bbsService.findBypageNo(pageNum);
    }
    /*跳转到bbs-post页面*/
    @RequestMapping(value = "bbspost")
    public String bbsPost(){

        return "bbs/bbs-post";
    }
    /*保存一个BBS*/
    @RequestMapping(value = "saveBBS")
    public String saveBBS(String title,String content){
        BBS bbs = new BBS();
        bbs.setContent(content);
        bbs.setTitle(title);
        bbs.setCreatetime(sdf.format(new Date()));
        bbs.setUserid(1);
        bbsService.saveBBS(bbs);
        return "redirect:bbslist";
    }

    @RequestMapping(value = "bbsshow")
    public String bbsShow(int bbsid, Model model){
        BBS bbs =bbsService.findByid(bbsid);
        model.addAttribute("bbs",bbs);
        return "bbs/bbs-show";
    }

}
