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
			var formObj = $("form[name='updateForm']");
			 
			$(".cancel_btn").on("click", function(){
				//event.preventDefault();
				location.href = "/issue/list";
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
				<form name="updateForm" role="form" method="post" action="/issue/update">
				<input type="hidden" name="i_Num" value="${issueUpdate.i_Num}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="i_Name">제목</label><input type="text" id="i_Name" name="i_Name" value="${issueUpdate.i_Name}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="i_Content">내용</label><textarea id="i_Content" name="i_Content"><c:out value="${issueUpdate.i_Content}" /></textarea>
								</td>
							</tr>
							
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>