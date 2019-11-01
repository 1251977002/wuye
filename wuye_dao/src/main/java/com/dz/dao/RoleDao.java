package com.dz.dao;

import com.dz.pojo.Role;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleDao {
    @Select("select * from t_role where id in(select roleid from t_admin where id = #{id})")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(property = "permissionList",column = "id",many = @Many(select = "com.dz.dao.PermissionDao.findPermissionByRoleId"))
    })
    List<Role> findRoleByid(int adminid);
}
