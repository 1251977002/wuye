package com.dz.dao;

import com.dz.pojo.BBSComment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BBSCommentDao {
    @Select("select * from t_bbscomment where bbsid = #{id}")
    List<BBSComment> findPageBBSComment(int id);
    @Insert("insert into t_bbscomment(content,createtime,bbsid,userid)values(#{content},#{createtime},${bbsid},#{userid})")
    void saveBBSComment(BBSComment bbsComment);
}
