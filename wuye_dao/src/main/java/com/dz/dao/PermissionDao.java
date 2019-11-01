package com.dz.dao;

import com.dz.pojo.Permission;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PermissionDao {
    @Select("SELECT * FROM t_permission WHERE id IN(SELECT permissionid FROM t_role_permission WHERE roleid=#{roleid})")
    List<Permission> findPermissionByRoleId(Integer roleId);
}
