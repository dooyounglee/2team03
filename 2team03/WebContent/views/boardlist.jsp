<%@page import="com.kh.test.BoardList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	ArrayList<BoardList> list=(ArrayList<BoardList>)request.getAttribute("list");
	if(list.size()>0){
		for(BoardList bl:list){%>
		<a href="<%=request.getContextPath()%>/<%=bl.getTitle()%>"><%=bl.getTitle() %></a><br>
<%		}
	}%>
<form action="board.list" method="post">
	누가만듬<input name="createdBy"><br>
	제목<input name="title"><br>
	소개<input name="intro"><br>
<button>게시판 만들기</button>
</form>
</body>
</html>