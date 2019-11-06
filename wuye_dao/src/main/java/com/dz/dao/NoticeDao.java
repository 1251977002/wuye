package com.dz.dao;

import com.dz.pojo.Notice;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface NoticeDao {
    @Select("select * from t_notice")
    List<Notice> findBypageNo();
    @Insert("insert into t_notice(content,createtime,title,adminid)values(#{content},#{createtime},#{title},#{adminid})")
    void saveNotice(Notice notice);
    @Delete("delete from t_notice where id = #{noticeid}")
    void delBynoticeid(int noticeid);

    //给管理员对用户进行的操作添加备注
    @Insert("insert into t_notice(title,content,createtime,adminname,userid) values(#{title},#{content},#{createtime},#{adminname},#{userid})")
    void save(Notice notice);

    @Select("select * from t_notice where userid = #{userid}")
    List<Notice> findNoticeByUserId(int userid);
}
