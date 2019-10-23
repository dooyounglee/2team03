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
<form action="board.doo" method="get">
	<button>get</button>
</form>
<form action="board.doo" method="post">
	<button>post</button>
</form>
<form action="board.doo" method="post">
	<button>put</button>
	<input type="hidden" name="_method" value="put" />
</form>
<form action="board.doo" method="post">
	<button>delete</button>
	<input type="hidden" name="_method" value="delete" />
</form>
<button id="get">get</button>
<button id="post">post</button>
<button id="put">put</button>
<button id="delete">delete</button>
<script>
$('#get').click(function(){
	$.ajax({
		url:'board.dooo',
		type:'get',
		success:function(data){
			alert("d")
		},
	})
})
$('#post').click(function(){
	$.ajax({
		url:'board.dooo',
		type:'post',
		success:function(data){
			alert("d")
		},
	})
})
$('#put').click(function(){
	$.ajax({
		url:'board.dooo',
		type:'put',
		success:function(data){
			alert("d")
		},
	})
})
$('#delete').click(function(){
	$.ajax({
		url:'board.dooo',
		type:'delete',
		success:function(data){
			alert("d")
		},
	})
})
</script>
</body>
</html>