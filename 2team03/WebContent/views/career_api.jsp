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
<input oninput="school($(this).val())">
<div id=info>검색어를 입력해주세요</div>
<input oninput="department($(this).val())">
<div id=info1>검색어를 입력해주세요</div>
<!-- <iframe src="http://career.go.kr/cnet/iframe/JobDic.do?apiKey=255d4fd2c5c5509325bf6b119940f88a&gubun=job_dic_list" scrolling="no" name="ce" width="680" height="1080" frameborder="0" style="border-width:0px;border-color:white; border-style:solid;"> </iframe> -->
<!-- <iframe src="http://career.go.kr/cnet/iframe/MajorDic.do?apiKey=255d4fd2c5c5509325bf6b119940f88a&gubun=univDic" scrolling="no" name="ce" width="680" height="1080" frameborder="0" style="border-width:0px;border-color:white; border-style:solid;"> </iframe> -->
<script>
	function school(key){
		if(key==""){
			$('#info').html("검색어를 입력해주세요")
			return;
		}
		$.getJSON("http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=255d4fd2c5c5509325bf6b119940f88a&svcType=api&svcCode=SCHOOL&contentType=json&gubun=univ_list&searchSchulNm="+key,
				function(data){
			var schools=data.dataSearch.content;
			var str=""
			for(i=0;i<schools.length;i++){
				str+=schools[i].schoolName+"<br>"
			}
			$('#info').html(str)
		})
	}
	function department(key){
		console.log(key)
		if(key==""){
			$('#info1').html("검색어를 입력해주세요")
			return;
		}
		$.getJSON("http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=255d4fd2c5c5509325bf6b119940f88a&svcType=api&svcCode=MAJOR&contentType=json&gubun=univ_list&univSe=univ&searchTitle="+key,
				function(data){
			var departments=data.dataSearch.content;
			var str=""
			for(i=0;i<departments.length;i++){
				if(departments[i].facilName.indexOf(key)>0){
					str+=departments[i].mClass+"<br>"
					continue;
				}
			}
			$('#info1').html(str)
		})
	}
	
</script>
</body>
</html>