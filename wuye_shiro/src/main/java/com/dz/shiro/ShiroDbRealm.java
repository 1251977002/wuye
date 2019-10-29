package com.dz.shiro;


import com.dz.pojo.User;
import com.dz.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class ShiroDbRealm extends AuthorizingRealm {
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        return null;
    }
    /*@Autowired
    private UserService userService;
    *//*授权：分配角色和权限*//*
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String loginName = (String) principalCollection.fromRealm(getName()).iterator().next();
        User user = userService.findByLoginName(loginName);
        if(user != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
             //添加角色(Set集合<字符串>)
            List<Role> roleList = user.getRoleList();
            Set<String> roleSet = new HashSet<>();
            for(Role role : roleList){
                String roleStr = role.getRolename();
                roleSet.add(roleStr);
            }
            info.setRoles(roleSet);
            //迭代用户对应的角色集合， 为了获取角色对应的权限

            for(Role role : user.getRoleList()) {
                List<String> permissionList = new ArrayList<>();
                for(Permission permission : role.getPermissionList()){
                    permissionList.add(permission.getPermissionname());
                }

                //添加permission
                info.addStringPermissions(permissionList);
            }
            return info;
        }
        return null;
    }

    *//*认证：登录*//*
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        User user = userService.findByLoginName(token.getUsername());
        if(user != null) {
            return new SimpleAuthenticationInfo(user.getUsername(),
                    user.getPassword(),getName());
        }
        return null;
    }*/
}
