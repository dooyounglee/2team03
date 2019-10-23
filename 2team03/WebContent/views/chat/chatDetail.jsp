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
<a href="<%=request.getContextPath() %>/create.table">나가기</a>
<h1><span id="room_no"><%=request.getParameter("room_no")%></span>번 채팅방</h1>
<h2><span id="userCount">0</span>명</h2>
<input id="msg" onkeyup="send()">
<button onclick="send_click()">내가</button><input id=nick>
<div id="chat"></div>
<script type="text/javascript">
	var webSocket = new WebSocket('ws://<%=request.getServerName()%>:<%=request.getServerPort()%>/2team/<%=request.getParameter("room_no")%>');
	webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onclose = function(event) {
        onClose(event)
      };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        //textarea.value += "상대 : " + event.data + "\n";
        var jsonData=JSON.parse(event.data)
    	//var id=$('#id').val();
    	//var room_no=$('#room_no').text();
		
        $('#chat').html($('#chat').html()+jsonData.nick+": "+jsonData.text+"<br>")
        //$('#chat').html($('#chat').html()+"상대: "+event.data+"<br>")
    	//$('#chat').html($('#chat').html()+event.data.text+"<br>")
    }
    function onOpen(event) {
        //textarea.value += "연결 성공\n";
        $('#chat').html($('#chat').html()+"당신이 입장했습니다<br>")
        var msg={
    		text:"딴사람이 입장했습니다",
    		nick:"",
    	}
   		webSocket.send(JSON.stringify(msg));
    }
    function onClose(event) {
        //textarea.value += "연결 성공\n";
        //webSocket.send("딴사람이 퇴장했습니다");
        
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        //textarea.value += "나 : " + inputMessage.value + "\n";
        if (window.event.keyCode == 13) {
        	send_click()
        }
    }
    
    function send_click() {
        //textarea.value += "나 : " + inputMessage.value + "\n";
       	var msg={
    		text:$('#msg').val(),
    		//id:$('#id').val(),
    		nick:$('#nick').val(),
    	}
   		webSocket.send(JSON.stringify(msg));
       	$('#chat').html($('#chat').html()+"나: "+msg.text+"<br>")
       	$('#msg').val("").focus()
    }
  </script>
</body>
</html>