package com.dz.service;

import com.dz.dao.UserDao;
import com.dz.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;
    //分页
    public PageInfo<User> findUserByParam(int pageNum,String username,String status) {
        PageHelper.startPage(pageNum, 3);
        Map<String,Object> map = new HashMap<String,Object>();
        if(!StringUtils.isEmpty(username)){
            map.put("username","%" + username + "%");
        }
        if(!StringUtils.isEmpty(status)){
            map.put("status",status);
        }
        List<User> users = userDao.findUserByParam(map);
        PageInfo<User> pageInfo = new PageInfo<User>(users);
        //pageInfo.setList(users);
        return pageInfo;
    }

    


}
