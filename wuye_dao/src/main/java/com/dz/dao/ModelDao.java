package com.dz.dao;

import com.dz.pojo.Model;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

import com.dz.pojo.Model;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ModelDao {

    /*删除户型 通过id*/
    @Delete("delete from t_model where id = #{id}")
    void deletemodel(int id);


    /*查询所有户型列表*/
    @Select("select * from t_model")
    List<Model> findAllModel(org.springframework.ui.Model model);

    /*添加户型信息*/
    @Insert("insert into t_model(modelname,area,note,propertmoney) values(#{modelname},#{area},#{note},#{propertmoney})")
    void savemodel(Model model);

    /*添加套房信息*/
    @Insert("insert into t_model(modelname,propertmoney) values(#{modelname},#{propertmoney})")
    void saveroom(Model model);
    String FIND_ALL = "select * from t_model";
    String FIND_BY_ID = "select * from t_model where id = #{modelid}";

    @Select(FIND_ALL)
    List<Model> findAll();

    @Select(FIND_BY_ID)
    Model findModelById(int modelid);
}
