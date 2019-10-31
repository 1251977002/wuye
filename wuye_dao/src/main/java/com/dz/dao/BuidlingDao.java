package com.dz.dao;

import com.dz.pojo.Building;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.ui.Model;

import java.util.List;

public interface BuidlingDao {

    /*查询所有楼栋列表*/
    @Select("select * from t_building")
    List<Building> findAllbuilding(Model model);

    /*删除楼栋列表 根据id*/
    @Delete("delete from t_building where id = #{id}")
    void deletebuilding(int id);
}
