package com.dz.pojo;

public class House {
    /*房间信息表*/
    private int id;
    private int housenum;
    private int userid;
    private String unitname;
    private int modelid;
    private String buildingname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHousenum() {
        return housenum;
    }

    public void setHousenum(int housenum) {
        this.housenum = housenum;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getModelid() {
        return modelid;
    }

    public void setModelid(int modelid) {
        this.modelid = modelid;
    }

    public String getUnitname() {
        return unitname;
    }

    public void setUnitname(String unitname) {
        this.unitname = unitname;
    }

    public String getBuildingname() {
        return buildingname;
    }

    public void setBuildingname(String buildingname) {
        this.buildingname = buildingname;
    }
}
