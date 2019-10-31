package com.dz.dao;

import com.dz.pojo.Pay;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PayDao {

    String SELECT_FINDALL = "select * from t_pay";

    @Select(SELECT_FINDALL)
    List<Pay> findAllYear();
}
