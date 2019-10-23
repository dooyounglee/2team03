package com.kh.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ChatDao {

	public int createRoom(Connection conn, int room_no) {
		int result=0;
		PreparedStatement ps=null;
		
		String sql="create table chat"+room_no+"(chat_no number,chatfrom varchar2(100),chatto varchar2(100),";
		sql+="regdate date,status varchar2(10))";
		try {
			ps=conn.prepareStatement(sql);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertChatRoomList(Connection conn) {
		int result=0;
		PreparedStatement ps=null;
		
		String sql="insert into chatlist values(seq_chatlist.nextval,'me','you',sysdate,'Y')"; 
		try {
			ps=conn.prepareStatement(sql);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getLastestRoom(Connection conn) {
		int result=0;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql="select * from (select chatroom_no from chatlist order by 1 desc) where rownum=1";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Integer> getChatRoomList(Connection conn) {
		ArrayList<Integer> list=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql="select * from chatlist";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
