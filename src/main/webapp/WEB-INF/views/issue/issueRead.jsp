<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		//수정페이지로 이동 jquery
		$(".update_btn").on("click", function(){
				formObj.attr("action", "/issue/update");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
		//삭제 jquery
	$(".delete_btn").on("click", function(){
		alert("삭제되었습니다.");
		formObj.attr("action", "/issue/delete");
		formObj.attr("method", "post");
		formObj.submit();
	})
	})
	</script>
	
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="i_Num">글 번호</label><input type="text" id="i_Num" name="i_Num" value="${issueRead.i_Num}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="i_Name">제목</label><input type="text" id="i_Name" name="i_Name" value="${issueRead.i_Name}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="i_Content">내용</label><textarea id="i_Content" name="i_Content"><c:out value="${issueRead.i_Content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="mem_Id">작성자</label><input type="text" id="mem_Id" name="mem_Id" value="${issueRead.mem_Id}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="i_Date">작성날짜</label><input type="text" id="i_Date" name="i_Date" value="${issueRead.i_Date}" />
														
								</td>
							</tr>		
						</tbody>			
					</table>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="update_btn">수정</button>

				</form>
			</section>
			<hr />
		</div>
	</body>
</html>