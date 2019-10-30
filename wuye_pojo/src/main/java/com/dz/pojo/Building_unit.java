package com.dz.pojo;

public class Building_unit {
    /*楼栋表和单元 也就是哪个单元哪个楼栋*/
    private int id;
    private int buildingid;
    private int unitid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBuildingid() {
        return buildingid;
    }

    public void setBuildingid(int buildingid) {
        this.buildingid = buildingid;
    }

    public int getUnitid() {
        return unitid;
    }

    public void setUnitid(int unitid) {
        this.unitid = unitid;
    }


}
