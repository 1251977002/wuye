package com.dz.dao;

import com.dz.pojo.Model;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ModelDao {
    String FIND_ALL = "select * from t_model";
    String FIND_BY_ID = "select * from t_model where id = #{modelid}";

    @Select(FIND_ALL)
    List<Model> findAll();

    @Select(FIND_BY_ID)
    Model findModelById(int modelid);
}
