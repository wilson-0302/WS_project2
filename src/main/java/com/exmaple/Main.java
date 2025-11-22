package com.exmaple;

import com.exmaple.common.JDBCUtil;

import java.sql.Connection;

public class Main {
    public static void main(String[] args) {

        Connection con = JDBCUtil.getConnection();
    }
}
