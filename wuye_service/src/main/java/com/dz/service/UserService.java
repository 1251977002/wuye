package com.dz.service;

import com.dz.dao.UserDao;
import com.dz.pojo.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional/*事务控制*/
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User findByLoginName(String username) {
        return userDao.findByLoginName(username);
    }
}
