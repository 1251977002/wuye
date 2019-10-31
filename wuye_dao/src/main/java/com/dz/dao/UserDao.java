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

}
