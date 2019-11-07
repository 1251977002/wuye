package com.dz.dao;

import com.dz.pojo.Notice;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface NoticeDao {
    @Select("select * from t_notice")
    List<Notice> findBypageNo();
    @Insert("insert into t_notice(content,createtime,title,loginname)values(#{content},#{createtime},#{title},#{loginname})")
    void saveNotice(Notice notice);
    @Delete("delete from t_notice where id = #{noticeid}")
    void delBynoticeid(int noticeid);


}
