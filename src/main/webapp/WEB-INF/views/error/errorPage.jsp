<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<div style="text-align:center; margin-top:100px">
	<img src="../resources/img/error_txt1.png">
</head>
<body>
	<%-- <h1>에러가 발생했습니다.</h1>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
	<c:out value="${error.STATUS_CODE }"> </c:out>
	<p>페이지를 찾을 수 없습니다. --%>
	<p><a href = "${contextPath}/main">메인페이지로 이동합니다</a></p><!-- </p> -->
	<%-- </c:if>
	<c:if test="${requestScope['javax.servlet.error.stauts_code'] == 500}">
	<p>요청을 수행할 수 없습니다. 
	<a href = "${contextPath}/main">메인이동</a></p>
	</c:if> --%>
</body>
</html>