package com.dz.dao;

import com.dz.pojo.BBSComment;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

public interface BBSCommentDao {
    @Select("select * from t_bbscomment where bbsid = #{id}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "userid",property = "user",one= @One(select = "com.dz.dao.UserDao.findById")),
    })
    List<BBSComment> findPageBBSComment(int id);

    @Insert("insert into t_bbscomment(content,createtime,bbsid,loginname)values(#{content},#{createtime},${bbsid},#{loginname})")
    void saveBBSComment(BBSComment bbsComment);

    @Delete("delete from t_bbscomment where bbsid = #{bbsid}")
    void delBybbsid(int bbsid);
}
