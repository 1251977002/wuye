package com.dz.dao;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDao {

    @SelectProvider(type=com.dz.dao.provider.GetUserSql.class,method="getUserSQL")
    List<User> findUserByParam(Map<String,Object> map);


    String SELECT_BYPID = "SELECT * FROM t_user WHERE id IN(SELECT userid FROM t_propert WHERE id=#{pid})";

    @Select(SELECT_BYPID)
    User findByPid(Integer pid);

}
