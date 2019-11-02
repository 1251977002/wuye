package com.dz.dao;

import com.dz.pojo.Building;
import com.dz.pojo.Propert;
import org.apache.ibatis.annotations.*;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface PropertDao {

    String SELECT_BYBH = "select * from t_propert where buildingname=#{param1} and housename=#{param2}";
    String SELECT_BYPRO = "select * from t_propert where begintime=#{param1} and buildingname=#{param2} and unitname=#{param3} and housenum=#{param4}";
    String INSERT_SQL = "INSERT INTO t_propert(buildingname,housenum,propertno,money, begintime,endtime,userid,payid,payway,username,title,unitname) VALUES " +
            "(#{buildingname},#{housenum},#{propertno},#{money},#{begintime},#{endtime},#{userid},#{payid},#{payway},#{username},#{title},#{unitname})";
    String SELECT_BYID = "select * from t_propert where id=#{param1}";

    //分页查询
    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getPropertSQL")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid"))
    })
    List<Propert> findByPage(Map<String,Object> map);


    //通过房间号查找
    @Select(SELECT_BYBH)
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid"))
    })
    Propert findByBnameAndHname(String buildname, String housename);

    //通过时间和房间号查找是否有物业账单
    @Select(SELECT_BYPRO)
    Propert findPropert(String begintime, String buildingname, String unitname, String housenum);

    //添加物业费账单
    @Insert(INSERT_SQL)
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    void saveInfo(Propert propert);

    @Select(SELECT_BYID)
    Propert findById(Integer propertid);


    /*查找所有的物业费信息*/
    @Select("select * from t_propert")
    @Results({
            @Result(column = "userid", property = "userid"),
            @Result(column = "userid",property = "user",one = @One(select = "com.dz.dao.UserDao.findUserByUserid"))
    })
    List<Propert> findAll();


    /*删除room*/
    @Delete("delete from t_propert where id = #{id}")
    void delroom(int id);

    /*所有的buildingname*/
    @Select("select * from t_propert")
    List<Propert> findAllBuilding();

}
