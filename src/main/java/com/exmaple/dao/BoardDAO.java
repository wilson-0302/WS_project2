package com.exmaple.dao;

import com.exmaple.bean.BoardVO;
import com.exmaple.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, anonymous, `like`, writer, content) values(?,?,?,?,?)";
    private final String BOARD_UPDATE = "update BOARD set title = ?, anonymous = ?, like = ?, writer = ?, content = ?, regdate = ? where id = ?";
    private final String BOARD_DELETE = "delete from BOARD where id = ?";
    private final String BOARD_LIST = "select * from BOARD";
    private final String BOARD_GET = "select * from BOARD where id = ?";

    public int insertBoard(BoardVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getTitle());
            stmt.setBoolean(2, vo.isAnonymous());
            stmt.setInt(3, vo.getLike());
            stmt.setString(4, vo.getWriter());
            stmt.setString(5, vo.getContent());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<BoardVO> getBoardList(){
        List<BoardVO> list = new ArrayList<BoardVO>();

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_LIST);
            rs = stmt.executeQuery();
            while (rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setId(rs.getInt("id"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setAnonymous(rs.getBoolean("anonymous"));
                vo.setLike(rs.getInt("like"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getString("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                list.add(vo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    public int deleteBoard(int id){
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

}
