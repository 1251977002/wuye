package com.dz.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class BBSComment {
    /*论坛评论表*/
    private int id;
    private String content;
    private String createtime;
    private int bbsid;
    private String  loginname;


    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getBbsid() {
        return bbsid;
    }

    public void setBbsid(int bbsid) {
        this.bbsid = bbsid;
    }

}
