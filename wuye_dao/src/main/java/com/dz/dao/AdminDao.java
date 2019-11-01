package com.dz.dao;

import com.dz.pojo.Admin;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface AdminDao {

    @Select("select * from t_admin where adminname = #{adminname}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(property = "roleList",column = "id",many = @Many(select = "com.dz.dao.RoleDao.findRoleByUid"))
    })
    Admin findByLoginName(String adminname);
}
