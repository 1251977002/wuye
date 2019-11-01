package com.dz.dao;

import com.dz.pojo.Admin;
import org.apache.ibatis.annotations.*;

public interface AdminDao {

    @Select("select * from t_admin where adminname = #{adminname}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "roleList",column = "id",many = @Many(select = "com.dz.dao.RoleDao.findRoleByid"))
    })
    Admin findByLoginName(String adminname);

    //保存用户登录的name和pwd
    @Insert("insert into t_admin (adminname,password,roleid) values (#{adminname},#{password},#{roleid})")
    void save(Admin admin);
}
