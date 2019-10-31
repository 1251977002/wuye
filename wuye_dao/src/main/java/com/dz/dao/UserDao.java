package com.dz.dao;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.*;

public interface UserDao {


    @Select("select * from t_user where username = #{username}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "roleList",column = "id",many = @Many(select = "com.dz.dao.RoleDao.findRoleByUid"))
    })
    User findByLoginName(String username);
}
