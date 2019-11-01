package com.dz.dao;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;



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

    //保存user
    @Insert("insert into t_user (username,password,sex,card,tel,buildingname,unitname,housenum) values (#{username},#{password},#{sex},#{card},#{tel},#{buildingname},#{unitname},#{housenum})")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    void save(User user);

    @Select("select * from t_user where buildingname = #{buildingname} and unitname = #{unitname} and housenum = #{housenum}")
    User findByBuildAndUnitHouse(User user);
}
