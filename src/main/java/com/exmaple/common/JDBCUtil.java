package com.exmaple.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
    private static Connection con=null;
    public static Connection getConnection(){

        try{
            if(con == null) {
                Class.forName("org.mariadb.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/W25_22200320"
                        ,"W25_22200320"
                        ,"Dumie3");
            }
            System.out.println("db 연결 성공");
        }catch(Exception e){
            System.out.println(e);
            System.out.println("db 연결 실패");
        }

        return con;
    }
}
