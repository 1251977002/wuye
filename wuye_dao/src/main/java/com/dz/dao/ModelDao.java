package com.dz.dao;

import com.dz.pojo.Model;
import org.apache.ibatis.annotations.Select;

import java.util.List;

import com.dz.pojo.Model;
import org.apache.ibatis.annotations.Select;

public interface ModelDao {

    String SELECT_BYUID = "SELECT * FROM t_model WHERE id IN (SELECT modelid FROM t_user WHERE id=#{uid})";

    @Select(SELECT_BYUID)
    Model findByUid(Integer uid);   /*通过uid查找户型*/
    String FIND_ALL = "select * from t_model";
    String FIND_BY_ID = "select * from t_model where id = #{modelid}";

    @Select(FIND_ALL)
    List<Model> findAll();

    @Select(FIND_BY_ID)
    Model findModelById(int modelid);
}
