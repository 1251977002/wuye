package com.dz.dao;

import com.dz.pojo.Record;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface RecordDao {
    @Select("select * from t_record where userid = #{userid} order by createtime desc")
    List<Record> findByUserid(int userid);
    @Insert("insert into t_record(content,createtime,adminname,userid)values(#{content},#{createtime},#{adminname},#{userid})")
    void saveRecord(Record record);
    @Select("SELECT t.* FROM (SELECT * FROM t_record ORDER BY createtime DESC)t WHERE userid = #{userid} GROUP BY userid")
    Record findByUseridAndCurTime(int userid);
}
