<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action = "/notify/insert"  method = "post">
이슈번호<input type= "text" name = "not_Num">
링크<input type= "text" name = "not_Link">
상태<input type= "text" name = "not_Status">
종류<input type= "text" name = "not_Kind">
아이디<input type= "text" name = "mem_Id">
게시글아이디<input type= "text" name = "c_Id">
<input type ="submit" value = "작성완료">
</form>
</body>
</html>