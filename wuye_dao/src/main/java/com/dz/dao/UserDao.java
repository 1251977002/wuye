package com.dz.dao;


import com.dz.pojo.Model;
import com.dz.pojo.User;
import com.github.pagehelper.PageInfo;
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
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(property = "model",column = "id",one = @One(select = "com.dz.dao.ModelDao.findByUid"))
    })
    User findByPid(Integer pid);

    /*添加套房信息*/
    @Insert("insert into t_user(username,tel,buildingname,unitname,housenum,modelname) values(#{username},#{tel},#{buildingname},#{unitname},#{housenum},#{modelname})")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    void saveroom(User user);


    //保存user
    @Insert("insert into t_user (username,loginname,password,sex,card,tel,buildingname,unitname,housenum,modelid) values (#{username},#{loginname},#{password},#{sex},#{card},#{tel},#{buildingname},#{unitname},#{housenum},#{modelid})")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    void save(User user);

    @Select("select * from t_user where buildingname = #{buildingname} and unitname = #{unitname} and housenum = #{housenum}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "model",column = "id",one = @One(select = "com.dz.dao.ModelDao.findByUid"))
    })
    User findByBuildAndUnitHouse(User user);

    //删除住户
    @Delete("delete from t_user where id = #{id} ")
    void delUser(int id);

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

    /*更新用户与其所欠金额*/
    @Update("update t_user set owemoney = #{owemoney} where id = #{id}")
    void updateOweMoney(User user);

    /*查找逾期总人数*/
    @Select("select count(*) from t_user where owemoney>0")
    Integer findcount();

    /*查找逾期所欠总金额*/
    @Select("select sum(owemoney) from t_user")
    Double findCountMoney();

    /*首页分页所需的数据*/
    @Select("SELECT buildingname,COUNT(*)totaluser,COUNT(IF(owemoney=0,TRUE,NULL))payuser,COUNT(IF(owemoney>0,TRUE,NULL))overuser,ROUND(COUNT(IF(owemoney=0,TRUE,NULL))/COUNT(*)*100,2) AS rate\n" +
            " FROM t_user GROUP BY buildingname")
    List<User> findPageByEveryBuildingName();

    /*通过id改变欠费*/
    @Update("update t_user set owemoney=#{param1} where id=#{param2}")
    void updateById(double owemoney, int id);
}
