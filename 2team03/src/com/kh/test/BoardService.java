package com.kh.test;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

public class BoardService {

	public void db() {
		Connection conn=getConnection();
		new BoardDao().db(conn);
		close(conn);
	}

	public ArrayList<BoardList> getBoardList() {
		Connection conn=getConnection();
		ArrayList<BoardList> list=new BoardDao().getBoardList(conn);
		close(conn);
		return list;
	}

	public int createBoard(BoardList bl) {
		Connection conn=getConnection();
		int result=new BoardDao().insertBoardList(conn,bl);
		if(result>0) {
			int boardlist_no=new BoardDao().getLastestBoardList(conn);
			new BoardDao().createBoard(conn,boardlist_no);
		}
		close(conn);
		return result;
	}

	
}
