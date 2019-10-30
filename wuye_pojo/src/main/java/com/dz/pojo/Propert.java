package com.dz.pojo;

public class Propert {
    
    /*物业费表*/
    private int id;
    private String buildingname;
    private String housename;
    private String propertno;/*类型*/
    private double money;
    private String state;/*状态*/
    private String paytime;/*缴费日期*/
    private String begintime;/*开始时间*/
    private String endtime;
    private User user;
    private int userid;
    private int payid;
    private String payway; /*缴费方式*/

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBuildingname() {
        return buildingname;
    }

    public void setBuildingname(String buildingname) {
        this.buildingname = buildingname;
    }

    public String getHousename() {
        return housename;
    }

    public void setHousename(String housename) {
        this.housename = housename;
    }

    public String getPropertno() {
        return propertno;
    }

    public void setPropertno(String propertno) {
        this.propertno = propertno;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }

    public String getBegintime() {
        return begintime;
    }

    public void setBegintime(String begintime) {
        this.begintime = begintime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getPayid() {
        return payid;
    }

    public void setPayid(int payid) {
        this.payid = payid;
    }

    public String getPayway() {
        return payway;
    }

    public void setPayway(String payway) {
        this.payway = payway;
    }
}
