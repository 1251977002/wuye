package com.dz.dao.provider;

import java.util.Map;

public class GetUserSql {
    //用户的动态sql
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

    //物业费的动态sql
    public String getPropertSQL(Map<String, Object> map) {
        String sql = "select t.* from (SELECT * FROM t_propert ORDER BY begintime DESC)t where ";
        if (map.containsKey("buildingname")) {
            sql += "buildingname = #{buildingname} and ";
        }
        if (map.containsKey("username")) {
            sql += "username like #{username} ";
        }
        if (sql.endsWith("where ")) {
            sql = sql.substring(0, sql.indexOf("where"));
        }
        if (sql.endsWith("and ")) {
            sql = sql.substring(0, sql.lastIndexOf("and"));
        }
        sql+="group by userid";
        System.out.println("SQL:" + sql);
        return sql;
    }
    //套房列表的动态sql
    public String getRoomSQL(Map<String, Object> map) {
        String sql = "select *,DATEDIFF(CURTIME(),endtime) AS overday from t_propert where ";
        if (map.containsKey("status")) {
            sql += "buildingname = #{status} and ";
        }
        if (map.containsKey("username")) {
            sql += "username like #{username} ";
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
    //物业费,以及逾期天数，所欠物业费的动态sql
    public String getPropertMoreSQL(Map<String, Object> map) {
        String sql = "SELECT p.*,DATEDIFF(CURTIME(),endtime) AS overday, ROUND(DATEDIFF(CURTIME(),endtime)*propertmoney/365,2) AS overmoney  FROM (SELECT t.* FROM (\n" +
                "SELECT * FROM t_propert ORDER BY endtime DESC)t GROUP BY t.userid)p\n" +
                "JOIN t_user u JOIN t_model m \n" +
                "WHERE p.userid=u.id AND u.modelid = m.id \n" +
                "AND DATEDIFF(CURTIME(),endtime)>0 AND state = \"已缴费\" and ";
        if (map.containsKey("buildingname")) {
            sql += "p.buildingname = #{buildingname} and ";
        }
        if (map.containsKey("username")) {
            sql += "p.username like #{username} ";
        }
        if (sql.endsWith("where ")) {
            sql = sql.substring(0, sql.indexOf("where"));
        }
        if (sql.endsWith("and ")) {
            sql = sql.substring(0, sql.lastIndexOf("and"));
        }
        sql += "group by p.userid";
        System.out.println("SQL:" + sql);
        return sql;
    }

    //七天内物业费到期的用户
    public String getSevenPropertSQL(Map<String, Object> map) {
        String sql = "select t.* from (SELECT * FROM t_propert ORDER BY endtime DESC)t where DATEDIFF(endtime,CURDATE())<7 AND DATEDIFF(endtime,CURDATE())>0 AND state = \"已缴费\" and ";
        if (map.containsKey("buildingname")) {
            sql += "buildingname = #{buildingname} and ";
        }
        if (map.containsKey("username")) {
            sql += "username like #{username} ";
        }
        if (sql.endsWith("where ")) {
            sql = sql.substring(0, sql.indexOf("where"));
        }
        if (sql.endsWith("and ")) {
            sql = sql.substring(0, sql.lastIndexOf("and"));
        }
        sql+="group by userid";
        System.out.println("SQL:" + sql);
        return sql;
    }

}
