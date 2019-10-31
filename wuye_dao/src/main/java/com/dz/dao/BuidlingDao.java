package com.dz.dao;

import com.dz.pojo.Building;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.ui.Model;

import java.util.List;

import com.dz.pojo.Building;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BuidlingDao {

    String SELECT_FINALL = "select * from t_building";

    /*查询所有楼栋列表*/
    @Select(SELECT_FINALL)
    List<Building> findAllbuilding(Model model);

    /*删除楼栋列表 根据id*/
    @Delete("delete from t_building where id = #{id}")
    void deletebuilding(int id);

    /*查询所有楼栋*/
    @Select(SELECT_FINALL)
    List<Building> findAll();

}
