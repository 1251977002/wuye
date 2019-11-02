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

public interface UserDao {


    @Select("select * from t_user where username = #{username}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "roleList",column = "id",many = @Many(select = "com.dz.dao.RoleDao.findRoleByUid"))
    })
    User findByLoginName(String username);

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

    /*分页查找逾期用户*/
    @Select("Select * from t_user where owemoney>0")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "",column = "id",many = @Many(select = "com.dz.dao.RoleDao.findRoleByUid"))
    })
    List<User> findPageByOweMoney(int pageNum);

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
