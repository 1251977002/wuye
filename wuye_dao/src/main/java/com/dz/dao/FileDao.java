package com.dz.dao;

import com.dz.pojo.File;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FileDao {
    @Insert("insert into t_file (filename,note,userid,adminname,createtime) values (#{filename},#{note},#{userid},#{adminname},#{createtime})")
    void save(File file1);


    @Select("select * from t_file where userid = #{userid}")
    List<File> findFileByUserId(int userid);

    @Delete("delete from t_file where id = #{id}")
    void deleteFileById(int id);
}
