package com.dz.dao;

import com.dz.pojo.BBS;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

public interface BBSDao {

    @Insert("insert into t_bbs(content,createtime,title,userid)values(#{content},#{createtime},#{title},#{userid})")
    void saveBBS(BBS bbs);

    @Select("select * from t_bbs")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "userid",property = "user",one= @One(select = "com.dz.dao.UserDao.findById")),
    })
    List<BBS> findBypageNo();

    @Select("select * from t_bbs where id = #{bbsid}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "userid",property = "user",one= @One(select = "com.dz.dao.UserDao.findById")),
    })
    BBS findByid(int bbsid);

    @Delete("delete from t_bbs where id = #{bbsid}")
    void delBybbsid(int bbsid);
}
