<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

</head>
<body>
<button onclick="showw()">봉줘</button>
<div id=info></div>
<form method="post">
  <textarea id="summernote" name="editordata"><p>fdsafdsafdsaf</p><p><img style="width: 499.987px;" src="resources/images/logo.png"></p><p>udsjfioeiofjisjailfds</p></textarea>
</form>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			callbacks : {
				onImageUpload : function(files) {
					$(this).summernote('editor.insertImage', "resources/images/logo.png");
				}
			}
		});
	});

	function showw() {
		var markupStr = $('#summernote').summernote('code');
		$('#info').text(markupStr)
	}
</script>
</body>
</html>