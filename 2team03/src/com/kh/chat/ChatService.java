package com.kh.chat;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

public class ChatService {

	public int createRoom() {
		Connection conn=getConnection();
		int room_no;
		//채팅방리스트에 기록
		int result=new ChatDao().insertChatRoomList(conn);
		if(result>0) {
			room_no=new ChatDao().getLastestRoom(conn);
			System.out.println(room_no);
			//채팅방 테이블생성
			new ChatDao().createRoom(conn,room_no);
		}
		close(conn);
		return result;
	}

	public ArrayList<Integer> getChatRoomList() {
		Connection conn=getConnection();
		ArrayList<Integer> list=new ChatDao().getChatRoomList(conn);
		close(conn);
		return list;
	}

	
}
