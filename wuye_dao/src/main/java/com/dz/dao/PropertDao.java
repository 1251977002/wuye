package com.dz.dao;

import com.dz.pojo.Propert;
import org.apache.ibatis.annotations.*;

import java.util.List;

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
}
