package com.dz.dao;

import com.dz.pojo.Propert;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface PropertDao {

    String SELECT_ALL = "select * from t_propert";
    String SELECT_BYBU = "select * from t_propert where buildingname=#{buildingname} and username=#{username}";

    @Select(SELECT_ALL)
    List<Propert> findByPage();

    @Select(SELECT_BYBU)
    Propert findByBidAndUid(String buildingname, String username);
}
