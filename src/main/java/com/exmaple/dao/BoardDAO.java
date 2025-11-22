package com.exmaple.dao;

import com.exmaple.bean.BoardVO;
import com.exmaple.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, writer, content, regdate, cnt) values(?,?,?,?,?)";
    private final String BOARD_UPDATE = "update BOARD set title = ?, writer = ?, content = ?, regdate = ? where id = ?";
    private final String BOARD_DELETE = "delete from BOARD where id = ?";
    private final String BOARD_GET = "select * from BOARD";
    private final String BOARD_LIST = "select * from BOARD where id = ?";




    public int insertBoard(BoardVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getWriter());
            stmt.setString(3, vo.getContent());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
