package com.dz.dao;

import com.dz.pojo.Building;
import com.dz.pojo.Propert;
import org.apache.ibatis.annotations.*;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface PropertDao {

    String SELECT_ALL = "select * from t_propert";
    String SELECT_BYBU = "select * from t_propert where buildingname=#{buildingname} and username=#{username}";

    @Select(SELECT_ALL)
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid"))
    })
    List<Propert> findByPage();

    @Select(SELECT_BYBU)
    Propert findByBidAndUid(String buildingname, String username);


    /*查找所有的物业费信息*/
    @Select("select * from t_propert")
    @Results({
            @Result(column = "userid", property = "userid"),
            @Result(column = "userid",property = "user",one = @One(select = "com.dz.dao.UserDao.findUserByUserid"))
    })
    List<Propert> findAll();


    /*删除room*/
    @Delete("delete from t_propert where id = #{id}")
    void delroom(int id);

    /*所有的buildingname*/
    @Select("select * from t_propert")
    List<Propert> findAllBuilding();
}
