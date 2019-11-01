package com.dz.dao;

import com.dz.pojo.Building;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.ui.Model;

import java.util.List;

import com.dz.pojo.Building;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BuidlingDao {

    String SELECT_FINALL = "select * from t_building";

    String SELECT_FINDALL = "select * from t_building";
    @Select(SELECT_FINDALL)
    List<Building> findAll();

    /*查询所有楼栋列表*/
    @Select(SELECT_FINALL)
    List<Building> findAllbuilding(Model model);

    /*删除楼栋列表 根据id*/
    @Delete("delete from t_building where id = #{id}")
    void deletebuilding(int id);


    /*添加楼栋信息*/
    @Insert("insert into t_building(name,note) values(#{name},#{note})")
    void saveBuilding(Building building);

    /*添加套房列表中的信息*/
    @Insert("insert into t_building(name) values(#{name})")
    void saveroom(Building building);

    /*查询所有楼栋*/
    @Select(SELECT_FINALL)
    List<Building> findAll();

}
