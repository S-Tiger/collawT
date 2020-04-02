<%@ page language="java" contentType="text/html; charset=UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("UTF-8");%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<c:if test="${sessionScope.mem_id != null}">
	<form action="/member/mypage">마이페이지(${sessionScope.mem_id})
	<input type="submit" value="마이페이지 이동하기">
	</form>
</c:if>
<form action="/member/updateMember" method="post">
<input type="text" name="mem_Id" value="${sessionScope.mem_id}"><br>
<input type="text" name="mem_Pwd" value="${sessionScope.mem_pwd}">${sessionScope.mem_pwd}<br>
<input type="text" name="mem_Name" value="${sessionScope.mem_name}">${sessionScope.mem_name}<br>
<input type="submit" value="수정">

</form>
</body>
</html>