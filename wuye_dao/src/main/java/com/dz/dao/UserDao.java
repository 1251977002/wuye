package com.dz.dao;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.ui.Model;

public interface UserDao {



    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getUserSQL")
    List<User> findUserByParam(Map<String,Object> map);

    @Select("SELECT * FROM t_user WHERE id IN(SELECT userid FROM t_propert WHERE id=#{pid})")
    User findByPid(Integer pid);

    /*添加套房信息*/
    @Insert("insert into t_user(username,tel) values(#{username},#{tel})")
    void saveroom(User user);
    //保存user
    @Insert("insert into t_user (username,password,sex,card,tel,buildingname,unitname,housenum) values (#{username},#{password},#{sex},#{card},#{tel},#{buildingname},#{unitname},#{housenum})")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    void save(User user);

    @Select("select * from t_user where buildingname = #{buildingname} and unitname = #{unitname} and housenum = #{housenum}")
    User findByBuildAndUnitHouse(User user);

    //查询所有业主
    @Select("select * from t_user")
    List<User> findAllUser(Model model);

    /*通过userid查询到该user*/
    @Select("SELECT * FROM t_user WHERE id IN(SELECT userid FROM t_propert WHERE id=#{userid})")
    User findUserByUserid(Integer userid);



    /*模糊查询通过username*/
    @Select("SELECT * FROM t_user WHERE username LIKE '%#{username}%'")
    void findUserByusername(String username);
}
