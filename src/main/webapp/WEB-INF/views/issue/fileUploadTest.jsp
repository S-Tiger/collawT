<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>


</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/issue/saveFile" enctype="multipart/form-data"
									method="post" class="form-horizontal" enctype="multipart/form-data">
<input type='file' name='a_File' id='a_File' multiple="multiple">
<input type='text' name='i_Num' id='i_Num'>
<input type="submit">
</form>



</body>
</html>