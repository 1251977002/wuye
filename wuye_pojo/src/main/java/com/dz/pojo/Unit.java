package com.dz.pojo;

import org.apache.ibatis.annotations.Select;

public class Unit {
    /*单元表 和楼栋表是用在一起的*/

    private int id;
    private String name;
    private String  note;

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
