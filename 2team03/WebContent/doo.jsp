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
					//사진 여러개 업로드. multiple이라서 한번에 여러개 선택.
					//더 좋은 코드는 spring에서 MultipartHttpServletRequest라는게 있대네.
					var _this=this;
 				    for(var i=0; i<files.length; i++){
 				    	var formData = new FormData();
				        formData.append('uploadFile', files[i]);
					    $.ajax({
					        url: '/2team/upload',
					        data: formData,
					        processData: false,
					        contentType: false,
					        type: 'POST',
					        success: function (data) {
					            $(_this).summernote('editor.insertImage', "resources/images/"+data);
					        }
					    });
 				    }
		            alert("이미지 업로드 성공");
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