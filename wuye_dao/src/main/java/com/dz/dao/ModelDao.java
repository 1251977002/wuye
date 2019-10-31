package com.dz.dao;

import com.dz.pojo.Model;
import org.apache.ibatis.annotations.Select;

public interface ModelDao {

    String SELECT_BYUID = "SELECT * FROM t_model WHERE id IN (SELECT modelid FROM t_user WHERE id=#{uid})";

    @Select(SELECT_BYUID)
    Model findByUid(Integer uid);   /*通过uid查找户型*/
}
