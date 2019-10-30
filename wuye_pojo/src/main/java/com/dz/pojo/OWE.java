package com.dz.pojo;

public class OWE {
    /*欠费表  业主没按规定时间缴纳费用*/
    private int id;
    private String buildingname;
    private int totalnum;/*入住总户数*/
    private int alreadypay;/*已欠费户数*/
    private int overday;/*已逾期天数*/
    private int rate; /*百分比 用已欠费的户数 除以 总户数*/

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

    public int getTotalnum() {
        return totalnum;
    }

    public void setTotalnum(int totalnum) {
        this.totalnum = totalnum;
    }

    public int getAlreadypay() {
        return alreadypay;
    }

    public void setAlreadypay(int alreadypay) {
        this.alreadypay = alreadypay;
    }

    public int getOverday() {
        return overday;
    }

    public void setOverday(int overday) {
        this.overday = overday;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

}
