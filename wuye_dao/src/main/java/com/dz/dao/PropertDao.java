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
    String INSERT_SQL = "INSERT INTO t_propert(buildingname,housenum,propertno,money, begintime,endtime,userid,payid,payway,username,title,unitname,adminname) VALUES " +
            "(#{buildingname},#{housenum},#{propertno},#{money},#{begintime},#{endtime},#{userid},#{payid},#{payway},#{username},#{title},#{unitname},#{adminname})";
    String SELECT_BYID = "select * from t_propert where id=#{param1}";
    String SELECT_BY_UID = "select * from t_propert where userid=#{param1} order by endtime desc";
    String UPDATE_BYID = "update t_propert set paytime=#{param1},payway=#{param2},state=#{param3} where id=#{param4}";


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

    //通过id查找物业账单
    @Select(SELECT_BYID)
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid"))
    })
    Propert findById(Integer propertid);


    /*查找所有的物业费信息*/
    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getPropertSQL")//写成动态SQL
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid"))
    })
    List<Propert> findAll(Map<String,Object> map);

    /*查找所有的物业费信息*/
    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getRoomSQL")//写成动态SQL
    @Results({
            @Result(column = "userid", property = "userid"),
            @Result(column = "userid",property = "user",one = @One(select = "com.dz.dao.UserDao.findUserByUserid"))
    })
    List<Propert> findAll1(Map<String,Object> map);

    /*删除room*/
    @Delete("delete from t_propert where id = #{id}")
    void delroom(int id);

    /*导出所有的propert，不用分页*/
    @Select("SELECT t.* FROM (SELECT * FROM t_propert ORDER BY begintime DESC)t GROUP BY userid")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid"))
    })
    List<Propert> findAllBuilding();

    /*分页查找逾期用户信息*/
    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getPropertMoreSQL")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid")),
            @Result(column = "userid",property = "record",one = @One(select = "com.dz.dao.RecordDao.findByUseridAndCurTime"))//通过userID查找最新的一条Record;
    })
    List<Propert> findPropertByPage(Map<String,Object> map);

    /*查找逾期用户信息*/
    @Select("SELECT p.*,DATEDIFF(CURTIME(),endtime) AS overday, ROUND(DATEDIFF(CURTIME(),endtime)*propertmoney/365,2) AS overmoney  FROM (SELECT t.* FROM "  +
           "(SELECT * FROM t_propert ORDER BY endtime DESC)t GROUP BY t.userid)p " +
           "JOIN t_user u JOIN t_model m " +
           "WHERE p.userid=u.id AND u.modelid = m.id " +
           "AND DATEDIFF(CURTIME(),endtime)>0 AND state = \"已缴费\" group by p.userid")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid")),
            @Result(column = "userid",property = "record",one = @One(select = "com.dz.dao.RecordDao.findByUseridAndCurTime"))//通过userID查找最新的一条Record;
    })
    List<Propert> findPropertowe();


    /*根据用户id查找物业账单*/
    @Select(SELECT_BY_UID)
    List<Propert> findByUserid(Integer userid);

    /*根据id更改缴费时间*/
    @Update(UPDATE_BYID)
    void updateById(String paytime,String state,String payway,int propertid);
    @Insert("insert into t_propert(userid) values(#{userid})")
    void save(int userId);

    /*分页查找七天内到期的用户*/
    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getSevenPropertSQL")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid")),
            @Result(column = "userid",property = "record",one = @One(select = "com.dz.dao.RecordDao.findByUseridAndCurTime"))//通过userID查找最新的一条Record;
    })
    List<Propert> findSevenPropertByPage(Map<String,Object> map);

    /*查找七天内到期的用户*/
    @Select("select t.* from (SELECT * FROM t_propert ORDER BY endtime DESC)t where DATEDIFF(endtime,CURDATE())<7 AND DATEDIFF(endtime,CURDATE())>0 AND state = \"已缴费\" group by userid")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "user",one= @One(select = "com.dz.dao.UserDao.findByPid")),
            @Result(column = "userid",property = "record",one = @One(select = "com.dz.dao.RecordDao.findByUseridAndCurTime"))//通过userID查找最新的一条Record;
    })
    List<Propert> findSevenPropertOwe();



    /*查找七天内过期的总人数*/
    @Select("select count(*) from (SELECT * FROM t_propert ORDER BY endtime DESC)t where DATEDIFF(endtime,CURDATE())<7 AND DATEDIFF(endtime,CURDATE())>0 AND state = \"已缴费\"")
    Integer findSeven();
}
