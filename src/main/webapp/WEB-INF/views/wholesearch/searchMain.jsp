<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<style>
@font-face {
	font-family: 'Recipekorea';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}


</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#search").click(function(){
		var url = "${contextPath}/search/result";
		url = url + "?searchType="+$('#searchType').val();
		url = url + "&keyword="+$('#keyword').val();
		alert(url);
		location.href=url;
	
	});
})
				
</script>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header" style="height: 100px">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"
							style="font-family: Recipekorea; max-width: 80%;">
							검색</h1>
          <p class="breadcrumb float-sm-left">레이아웃 바꿀 예정입니다~</p>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
		<select class="form-control custom-select" id="searchType" name="searchType">

		<option id="i_Name" name="i_Name" value="i_Name">제목</option>
		<option id="i_Content" name="i_Content" value="i_Content">내용</option>
		<option id="wr_mem_Id" name="wr_mem_Id" value="wr_mem_Id">작성자 아이디</option>
		<option id="mem_Name" name="mem_Name" value="mem_Name">작성자 닉네임</option>

		</select>
		
		<input type="text" id="keyword" name="keyword">
        
		
		<input type="search" id = "search" name = "search" value="검색" on class="btn btn-danger btn-sm float-right" style="margin:3px;">
		
						<!-- Main content -->

			
			<!-- 리스트 부분 -->

			<!-- /.card-body -->
		
		
<!-- /.content-wrapper -->
