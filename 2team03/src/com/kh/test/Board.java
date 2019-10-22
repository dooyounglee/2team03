package com.kh.test;

public class Board {

	private int b_no;
	private String title;
	private String writer;
	private String content;
	public Board() {
		super();
	}
	public Board(int b_no, String title, String writer, String content) {
		super();
		this.b_no = b_no;
		this.title = title;
		this.writer = writer;
		this.content = content;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Board [b_no=" + b_no + ", title=" + title + ", writer=" + writer + ", content=" + content + "]";
	}
	
}
