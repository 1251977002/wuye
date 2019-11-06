package com.dz.shiro;


import com.dz.pojo.Admin;
import com.dz.pojo.Permission;
import com.dz.pojo.Role;
import com.dz.pojo.User;
import com.dz.service.AdminService;
import com.dz.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.web.session.mgt.DefaultWebSessionContext;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class ShiroDbRealm extends AuthorizingRealm {

    @Autowired
    private AdminService adminService;

    /*授权：分配角色和权限*/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String loginName = (String) principalCollection.fromRealm(getName()).iterator().next();
        Admin admin = adminService.findByLoginName(loginName);
        if(admin != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
             //添加角色(Set集合<字符串>)
            List<Role> roleList = admin.getRoleList();
            Set<String> roleSet = new HashSet<>();
            for(Role role : roleList){
                String roleStr = role.getRolename();
                roleSet.add(roleStr);
            }
            info.setRoles(roleSet);
            //迭代用户对应的角色集合， 为了获取角色对应的权限

            for(Role role : admin.getRoleList()) {
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

    /*认证：登录*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        //用户账号
        String adminname = (String) token.getPrincipal();
        //从数据库中查找这个username，如果没有就会返回空
        Admin admin = adminService.findByLoginName(token.getUsername());

        if(admin != null) {
            return new SimpleAuthenticationInfo(admin.getAdminname(),
                    admin.getPassword(),getName());
        }
       /* Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("admin", admin);
        return SimpleAuthenticationInfo;*/
        /*String password = user.getPassword();*/


        /*String md5Pwd = new Md5Hash(password,username).toHex();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo(user,md5Pwd,
                ByteSource.Util.bytes(username),getName()
        );*/
        return null;
    }


    @Bean
    public DefaultWebSessionManager sessionManager(){
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        //去掉shiro登录时出现的sessionID
        sessionManager.setSessionIdUrlRewritingEnabled(false);
        return sessionManager;
    }
}
