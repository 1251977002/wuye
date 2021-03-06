package com.dz.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.List;
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class User implements Serializable {
    /*业主表 */
    private int id;
    private String username;
    private String loginname;
    private String password;
    private String sex;
    private String card;
    private String tel;
    private double owemoney;
    private String unitname;
    private String buildingname;
    private String housenum;
    private int modelid;
    private List<Propert> propertList;
    private Model model;
    private int totaluser;/*一栋楼的所有业主数*/
    private int payuser;/*一栋楼支付过物业费的所有业主数*/
    private int overuser;/*一栋楼预期的所有业主数*/
    private double rate;/*一栋楼支付过的业主占总业主数的百分比*/

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public double getOwemoney() {
        return owemoney;
    }

    public void setOwemoney(double owemoney) {
        this.owemoney = owemoney;
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

    public String getHousenum() {
        return housenum;
    }

    public void setHousenum(String housenum) {
        this.housenum = housenum;
    }

    public int getModelid() {
        return modelid;
    }

    public void setModelid(int modelid) {
        this.modelid = modelid;
    }

    public List<Propert> getPropertList() {
        return propertList;
    }

    public void setPropertList(List<Propert> propertList) {
        this.propertList = propertList;
    }

    public Model getModel() {
        return model;
    }

    public void setModel(Model model) {
        this.model = model;
    }

    public int getTotaluser() {
        return totaluser;
    }

    public void setTotaluser(int totaluser) {
        this.totaluser = totaluser;
    }

    public int getPayuser() {
        return payuser;
    }

    public void setPayuser(int payuser) {
        this.payuser = payuser;
    }

    public int getOveruser() {
        return overuser;
    }

    public void setOveruser(int overuser) {
        this.overuser = overuser;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
}
