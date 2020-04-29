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
		var url = "${contextPath}/search/replyresult";
		url = url + "?keyword="+$('#keyword').val();
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
		
		
		<input type="text" id="keyword" name="keyword">
        
		
		<input type="search" id = "search" name = "search" value="검색" on class="btn btn-danger btn-sm float-right" style="margin:3px;">
		
		<div style="border-width:3px; width:40px; height:50px; border-color:white; border-style:outset; text-align:center; ">
		<span class="badge badge-success"  style= "height : 17px; width : 100%; font-size : 13px; vertical-align : text-bottom;">txt</span></div>
		
						<!-- Main content -->

			
			<!-- 리스트 부분 -->

			<!-- /.card-body -->
		
		
<!-- /.content-wrapper -->
