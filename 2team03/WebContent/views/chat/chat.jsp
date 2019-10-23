<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<form action="create.chat" method="post">
	<button>방 맹글기</button>
</form>

<table>
	<%	ArrayList<Integer> list=(ArrayList<Integer>)request.getAttribute("list");
		for(int i=0;i<list.size();i++){%>
	<tr>
		<td><a href="<%=request.getContextPath()%>/enter.chat?room_no=<%=list.get(i) %>"><%=list.get(i) %>번방 입장</a></td>
	</tr>
	<%	} %>
</table>
</body>
</html>