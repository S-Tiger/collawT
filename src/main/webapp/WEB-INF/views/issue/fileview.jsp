<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div class="card-body p-0">
        <form name="fileForm" >   
          <table id="example1" class="table table-striped projects">
              <tbody>

                 <c:forEach var="file" items="${file}" >	
                  <tr>
                      <td> <span id="a_RealName" name="a_RealName">${file.a_RealName}</span>    </td>
                      <td> <span id="a_Size" name="a_Size">${file.a_Size}</span>   </td>
                      
                      <td>  <span id="a_Num" name="a_Num">${file.a_Num}</span>   </td>
                     
                      <td>  <a href="/issue/download?a_Num=${file.a_Num}">다운로드 </a></td>
                      
                   </tr>
                   </c:forEach>
              </tbody>
          </table>
          </form>
        </div>
</body>
</html>