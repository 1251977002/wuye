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

    String SELECT_BYLOGINNAME = "select * from t_user where username = #{username}";
    String SELECT_BYPID = "SELECT * FROM t_user WHERE id IN(SELECT userid FROM t_propert WHERE id=#{pid})";

    //用户登录
    @Select(SELECT_BYLOGINNAME)
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "roleList",column = "id",many = @Many(select = "com.dz.dao.RoleDao.findRoleByUid"))
    })
    User findByLoginName(String username);

    //分页显示用户
    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getUserSQL")
    List<User> findUserByParam(Map<String,Object> map);

    //通过物业费id查找用户
    @Select(SELECT_BYPID)
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "model",one= @One(select = "com.dz.dao.ModelDao.findByUid"))
    })
    User findByPid(Integer pid);

    /*添加套房信息*/
    @Insert("insert into t_user(username,tel) values(#{username},#{tel})")
    void saveroom(User user);
    //保存user
    @Insert("insert into t_user (username,password,sex,card,tel,buildingname,unitname,housenum) values (#{username},#{password},#{sex},#{card},#{tel},#{buildingname},#{unitname},#{housenum})")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    void save(User user);

    @Select("select * from t_user where buildingname = #{buildingname} and unitname = #{unitname} and housenum = #{housenum}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "model",one= @One(select = "com.dz.dao.ModelDao.findByUid"))
    })
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
