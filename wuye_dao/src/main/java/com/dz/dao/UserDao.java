package com.dz.dao;


import com.dz.pojo.Model;
import com.dz.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.*;


import org.springframework.stereotype.Service;




public interface UserDao {


    @Select("select * from t_user where username = #{username}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "roleList",column = "id",many = @Many(select = "com.dz.dao.RoleDao.findRoleByUid"))
    })
    User findByLoginName(String username);

    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getUserSQL")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(property = "model",column = "id",one = @One(select = "com.dz.dao.ModelDao.findByUid"))
    })
    List<User> findUserByParam(Map<String,Object> map);

    @Select("SELECT * FROM t_user WHERE id IN(SELECT userid FROM t_propert WHERE id=#{pid})")
    User findByPid(Integer pid);

    /*添加套房信息*/
    @Insert("insert into t_user(username,tel) values(#{username},#{tel})")
    void saveroom(User user);
    //保存user
    @Insert("insert into t_user (username,password,sex,card,tel,buildingname,unitname,housenum,modelid) values (#{username},#{password},#{sex},#{card},#{tel},#{buildingname},#{unitname},#{housenum},#{modelid})")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    void save(User user);

    @Select("select * from t_user where buildingname = #{buildingname} and unitname = #{unitname} and housenum = #{housenum}")
    User findByBuildAndUnitHouse(User user);

    /*分页查找逾期用户*/
    @Select("Select * from t_user where owemoney>0")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "",column = "id",many = @Many(select = "com.dz.dao.RoleDao.findRoleByUid"))
    })
    List<User> findPageByOweMoney(int pageNum);


    //删除住户
    @Delete("delete from t_user where housenum = #{housenum}")
    void delByhouseNum(String housenum);

    @Update("update t_user set buildingname = #{buildingname},unitname = #{unitname},housenum = #{housenum},modelid = #{modelid} where id = #{id}")
    void update(User user);

    @Select("select * from t_user where id = #{id}")
    User findById(int id);

    //查找所有的user
    @Select("select * from t_user")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(property = "model",column = "id",one = @One(select = "com.dz.dao.ModelDao.findByUid"))
    })
    List<User> findAll();

    //查询所有业主
    @Select("select * from t_user")
    List<User> findAllUser(Model model);

    /*通过userid查询到该user*/
    @Select("SELECT * FROM t_user WHERE id IN(SELECT userid FROM t_propert WHERE id=#{userid})")
    User findUserByUserid(Integer userid);



    /*模糊查询通过username*/
    @Select("SELECT * FROM t_user WHERE username LIKE '%#{username}%'")
    void findUserByusername(String username);

/*    *//*通过owemoney查找用户*//*
    @Select("select * from t_user where ownmoney >0")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "propertList",column = "id",many = @Many(select = "com.dz.dao.OweDao.findByuserid"))
    })
    List<User> findPageByOweMoney(int pageNum);*/

    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method = "getPropertSQL")
    List<User> findPageByOweMoney(Map<String ,Object> map);
}
