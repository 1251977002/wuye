package com.dz.dao;

import com.dz.pojo.Propert;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface PropertDao {

    String SELECT_BYBU = "select * from t_propert where buildingname=#{param1} and username like #{param2}";

    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getPropertSQL")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid"))
    })
    List<Propert> findByPage(Map<String,Object> map);

    @Select(SELECT_BYBU)
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid"))
    })
    Propert findByBnameAndUname(String buildname, String username1);
}
