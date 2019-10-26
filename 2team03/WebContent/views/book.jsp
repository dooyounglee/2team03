<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="http://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<!-- <input id="search" oninput="aaa()">
<input id="page" oninput="aaa()">
<div id="info"></div>
<script>
function aaa(){
	$('#info').text('')
	$.ajax({
	    beforeSend: function(request) {
	        request.setRequestHeader("Authorization","KakaoAK e0ca2d55c6ab16fdfdcbbea7e1f2b2df");
	    },
	    url: 'https://dapi.kakao.com/v3/search/book?query='+$('#search').val()+"&page="+$('#page').val(),
	    success:function(data){
	    	var arr=data.documents;
	    	for(i=0;i<arr.length;i++){
	    		$('#info').append("<img src='"+arr[i].thumbnail+"'><br>")
	    	}
	    }
	});
}
</script> -->

<hr>

<div id="info0"></div>
<script>
$('#info0').text('')
$.ajax({
    url: '/2team/book',
    type:'post',
    dataType:'json',
    success:function(data){
    	console.log(data)
    	var arr=data.items
    	for(i=0;i<arr.length;i++){
    		$('#info0').append("<img src='"+arr[i].image+"'><br>")
    	}
    },
    error:function(data){
    	console.log("error "+JSON.stringify(data))
    }
});
</script>
</body>
</html>