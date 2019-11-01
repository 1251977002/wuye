package com.dz.dao;

import com.dz.pojo.House;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface HouseDao {
    //查找所有的house信息
    @Select("select * from t_house where id = #{hid}")
    List<House> findById(int hid);

    //保存house信息
    @Select("insert into t_house (housenum,userid,unitid,modelid) values (#{housenum},#{userid},#{unitid},#{modelid})")
    void save(House house);

    //删除住户的house信息
    @Delete("delete from t_house where housenum = #{housenum}")
    void del(int housenum);
}
