package com.dz.pojo;

import java.util.List;

public class Role_permission {
    /*角色权限表 和角色表是多对多的关系*/
    private int roleid;
    private int permissionid;
    private List<Role> roleList;

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public int getPermissionid() {
        return permissionid;
    }

    public void setPermissionid(int permissionid) {
        this.permissionid = permissionid;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }


}
