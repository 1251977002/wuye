package com.dz.dao;

import com.dz.pojo.Unit;
import org.apache.ibatis.annotations.Select;

public interface UnitDao {
    @Select("select * from t_unit where id = #{uid}")
    Unit findById(int uid);
}
