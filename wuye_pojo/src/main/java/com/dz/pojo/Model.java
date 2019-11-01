package com.dz.pojo;

public class Model {
    /*户型表 也就是三室两厅或别墅*/
    private int id;
    private String modelname;
    private int area;/*面积*/
    private double propertmoney;/*物业费收费标准*/
    private String note;/*备注*/

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModelname() {
        return modelname;
    }

    public void setModelname(String modelname) {
        this.modelname = modelname;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getPropertmoney() {
        return propertmoney;
    }

    public void setPropertmoney(double propertmoney) {
        this.propertmoney = propertmoney;
    }



}
