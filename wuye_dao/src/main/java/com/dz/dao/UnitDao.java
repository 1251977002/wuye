package com.dz.dao;

import com.dz.pojo.Unit;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.ui.Model;

import java.util.List;

public interface UnitDao {

    /*查询所有单元信息*/
    @Select("select * from t_unit")
    List<Unit> findAllUnit(Model model);

    /*删除单元信息*/
    @Delete("delete from t_unit where id = #{id}")
    void deleteUnit(int id);
}
