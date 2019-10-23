<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="send()">내가</button>
<script type="text/javascript">
	var webSocket = new WebSocket('ws://<%=request.getServerName()%>:<%=request.getServerPort()%>/2team/chat');
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
        console.log(event.data)
    }
    function onOpen(event) {
        //textarea.value += "연결 성공\n";
        console.log("연결성공")

    }
    function onClose(event) {
        //textarea.value += "연결 성공\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        //textarea.value += "나 : " + inputMessage.value + "\n";
    	webSocket.send("eeeeeeeeee");
    }
  </script>
</body>
</html>