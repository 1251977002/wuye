package com.dz.dao;

import com.dz.pojo.Building;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BuidlingDao {

    String SELECT_FINDALL="select * from t_building";

    @Select(SELECT_FINDALL)
    List<Building> findAll();
}
