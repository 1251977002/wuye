package com.dz.controller;



import com.dz.pojo.Notice;
import com.dz.service.NoticeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resources;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {
    //公告板
    @Autowired
    private NoticeService noticeService;
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @RequestMapping(value = "noticeList")
    public String noticeList(){
        return "notice/notice-list";
    }
    @RequestMapping(value = "noticePost")
    public String noticePost(){
        return "notice/notice-post";
    }
    /*对noticelist进行分页*/
    @RequestMapping(value = "findPageNotice")
    @ResponseBody
    public PageInfo<Notice> findPageNotice(int pageNum){

        return noticeService.findBypageNo(pageNum);
    }
    /*保存一个Notice*/
    @RequestMapping(value = "saveNotice")
    public String saveNotice(String title,String content){
        Notice notice = new Notice();
        notice.setContent(content);
        notice.setTitle(title);
        notice.setCreatetime(sdf.format(new Date()));
        notice.setAdminid(1);
        noticeService.saveNotice(notice);
        return "redirect:noticeList";
    }
    /*删除一个Notice并删除它所对应的评论*/
    @RequestMapping(value = "noticeDel")
    public String noticeDel(int noticeid){
        noticeService.delBynoticeid(noticeid);
        return "redirect:noticeList";
    }
}
