package com.dz.dao;

import com.dz.pojo.House;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface HouseDao {
    @Select("select * from t_house where id = #{hid}")
   /* @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "unitid",many = @Many(select = "com.dz.dao.UnitDao.findById"))
    })*/
    List<House> findById(int hid);
}
