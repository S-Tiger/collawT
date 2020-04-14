<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

$(document).ready(function() {
	
	$('#submit').on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='a_File']");
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i=0; i<files.length; i++){
			formData.append("a_File", files[i]);
			
		}
		
		$.ajax({
			url:'/issue/fileUpload',
			processData:false,
			contentType:false,
			data:formData,
			type:'POST',
			success:function(result){
				alert("업로드!!");
			}
		});
	});
	
})

</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/issue/fileUpload" enctype="multipart/form-data"
									method="post" class="form-horizontal">
<input type='file' name='a_File' id='a_File' multiple="multiple">
<input type='text' name='i_Num' id='i_Num'>
<input type="button" name="submit" id="submit">
</form>



</body>
</html>