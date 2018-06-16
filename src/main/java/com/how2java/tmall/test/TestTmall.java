package com.how2java.tmall.test;
 
import java.sql.*;

public class TestTmall {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        for (int i = 0; i <50 ; i++) {
            try (Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/tmall_ssm?characterEncoding=UTF-8","root","admin");
                 PreparedStatement ps=c.prepareStatement("insert into product  values (null,?,?,?,?,?,?,?);")){
                ps.setString(1,"测试"+i);
                ps.setString(2,"测试"+i+"的内容");
                ps.setFloat(3,1111.1f);
                ps.setFloat(4,2222.2f);
                ps.setInt(5,66);
                ps.setInt(6,53);
                ps.setTimestamp(7,new Timestamp(new java.util.Date().getTime()));
                ps.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}