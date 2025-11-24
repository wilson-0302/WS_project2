package com.exmaple.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mariadb://walab.handong.edu:3306/W25_22200320",
                    "W25_22200320",
                    "Dumie3"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
