package com.kh.test;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;

public class BoardDao {

	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = JDBCTemplate.class.getResource("").getPath();
		fileName=fileName.substring(0, fileName.lastIndexOf("WEB-INF"))+"sql/board.properties";
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void db(Connection conn) {
		
	}

	public ArrayList<BoardList> getBoardList(Connection conn) {
		ArrayList<BoardList> list=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=prop.getProperty("getBoardList");
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				BoardList bl=new BoardList(rs.getInt("boardlist_no"),
						rs.getString("createdBy"),
						rs.getString("title"),
						rs.getString("intro"),
						rs.getDate("regdate")+" "+rs.getTime("regdate"),
						rs.getString("status"));
				list.add(bl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int insertBoardList(Connection conn, BoardList bl) {
		int result=0;
		PreparedStatement ps=null;
		
		String sql=prop.getProperty("insertBoardList");
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, bl.getCreatedBy());
			ps.setString(2, bl.getTitle());
			ps.setString(3, bl.getIntro());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getLastestBoardList(Connection conn) {
		int result=0;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql=prop.getProperty("getLastestBoardList");
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				result=rs.getInt("boardlist_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void createBoard(Connection conn, int boardlist_no) {
		PreparedStatement ps=null;
		
		String sql="create table Board"+boardlist_no+"("
				+ "b_no number primary key, "
				+ "title varchar2(1000) not null, "
				+ "writer varchar2(1000) not null, "
				+ "content varchar2(4000) not null)";
		try {
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
