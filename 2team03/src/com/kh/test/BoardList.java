package com.kh.test;

public class BoardList {

	private int boardlist_no;
	private String createdBy;
	private String title;
	private String intro;
	private String regdate;
	private String status;
	public BoardList() {
		super();
	}
	public BoardList(int boardlist_no, String createdBy, String title, String intro, String regdate, String status) {
		super();
		this.boardlist_no = boardlist_no;
		this.createdBy = createdBy;
		this.title = title;
		this.intro = intro;
		this.regdate = regdate;
		this.status = status;
	}
	public int getBoardlist_no() {
		return boardlist_no;
	}
	public void setBoardlist_no(int boardlist_no) {
		this.boardlist_no = boardlist_no;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BoardList [boardlist_no=" + boardlist_no + ", createdBy=" + createdBy + ", title=" + title + ", intro="
				+ intro + ", regdate=" + regdate + ", status=" + status + "]";
	}
	
	
}
