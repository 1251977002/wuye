package com.dz.dao;

import com.dz.pojo.Building;
import org.apache.ibatis.annotations.*;
import org.springframework.ui.Model;

import java.util.List;

import com.dz.pojo.Building;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface BuidlingDao {

    String SELECT_FINDALL = "select * from t_building";

    /*查询所有楼栋列表*/
    @Select(SELECT_FINDALL)
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
    @Select(SELECT_FINDALL)
    List<Building> findAll();

    /*查询该楼栋名字*/
    @Select("select * from t_propert where buildingname=#{status}")
    void findBuildingByName(String status);

    @Select("select buildingname from t_propert")
    List<String> findBuilding();


    @Update("update t_building set name = #{name},note = #{note} where id = #{id}")
    void edit(Building building);
}
