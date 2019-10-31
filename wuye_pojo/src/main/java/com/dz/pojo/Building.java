package com.dz.pojo;

public class Building {
    /* 楼栋表 也就是哪个单元哪个楼的楼栋表*/
    private int id;
    private String name;
    private String note;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
