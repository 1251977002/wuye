package com.dz.dao;

import com.dz.pojo.Unit;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.ui.Model;

import java.util.List;

import com.dz.pojo.Unit;
import org.apache.ibatis.annotations.Select;

public interface UnitDao {

    /*查询所有单元信息*/
    @Select("select * from t_unit")
    List<Unit> findAllUnit(Model model);

    /*删除单元信息*/
    @Delete("delete from t_unit where id = #{id}")
    void deleteUnit(int id);

    @Select("select * from t_unit where id = #{uid}")
    Unit findById(int uid);

    /*添加单元信息*/
    @Insert("insert into t_unit(name,note) values(#{name},#{note})")
    void saveUnit(Unit unit);

    /*添加套房列表中的信息*/
    @Insert("insert into t_unit(name) values(#{name})")
    void saveroom(Unit unit);

    @Select("select * from t_unit where name = #{name}")
    Unit findByName(String name);

    //所有单元
    @Select("select * from t_unit")
    List<Unit> findAll();
}
