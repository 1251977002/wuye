package com.dz.dao;

import com.dz.pojo.Permission;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PermissionDao {
    @Select("select * from t_permission where id in(select permissionid from t_role_permission where roleid=#{roleid})")
    List<Permission> findPermissionByRoleId(Integer roleId);
}
