package com.dz.dao;

import com.dz.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDao {

    String SELECT_BYPID = "SELECT * FROM t_user WHERE id IN(SELECT userid FROM t_propert WHERE id=#{pid})";

    @Select(SELECT_BYPID)
    User findByPid(Integer pid);

}
