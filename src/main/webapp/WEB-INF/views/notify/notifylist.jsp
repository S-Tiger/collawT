<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "/notify/update" method ="post">
 <c:forEach var = "notifyList" items="${notifyList}" >
 
 <ul>
 	<li> ${notifyList.mem_Id}</li>
 	<li> ${notifyList.c_Id}</li>
 	<li> ${notifyList.not_Link}</li>
 <%-- 	<li><a href = "/notify/update >새글확인 </a> </li>--%>
  </ul> 
  
  <%-- <input type = "hidden" name = "mem_Id" value = "${notifyList.mem_Id}"> --%>
  <input type = "submit" value = "확인">
 </c:forEach>
 </form>
<!-- <script>
var tt = '<c:out value = "${nott}"/>';


</script>
 -->


</body>
</html>