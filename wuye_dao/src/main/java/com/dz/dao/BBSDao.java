package com.dz.dao;

import com.dz.pojo.BBS;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

public interface BBSDao {

    @Insert("insert into t_bbs(content,createtime,title,userid)values(#{content},#{createtime},#{title},#{userid})")
    void saveBBS(BBS bbs);

    @Select("select * from t_bbs")
    List<BBS> findBypageNo();

    @Select("select * from t_bbs where id = #{bbsid}")
    BBS findByid(int bbsid);

    @Delete("delete from t_bbs where id = #{bbsid}")
    void delBybbsid(int bbsid);
}
