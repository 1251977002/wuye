package com.dz.dao.provider;

import java.util.Map;

public class GetUserSql {
    public String getUserSQL(Map<String, Object> map) {
        String sql = "select * from t_user where ";
        if (map.containsKey("username")) {
            sql += "username like #{username} and ";
        }
        if (map.containsKey("password")) {
            sql += "password = #{password} ";
        }
        if (map.containsKey("status")) {
            sql += "buildingname = #{status} ";
        }
        if (sql.endsWith("where ")) {
            sql = sql.substring(0, sql.indexOf("where"));
        }
        if (sql.endsWith("and ")) {
            sql = sql.substring(0, sql.lastIndexOf("and"));
        }
        System.out.println("SQL:" + sql);
        return sql;
    }
}
