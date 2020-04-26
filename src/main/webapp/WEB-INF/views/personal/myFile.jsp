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

				
</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="background-color: #ffeded">
	<div class="content-header" style="height: 100px">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<div>
						<h1 class="m-0 text-dark"
							style="font-family: Recipekorea; max-width: 80%; display: contents;">내 공간</h1>
					</div>
					<div>
					<p class="breadcrumb float-sm-left" style="position: absolute; margin-top: 10px">나만의 이슈와 내가 쓴 글을 한번에 관리하세요 :D</p>
					</div>
					</div>
			</div>
		</div>
	</div>
	<div class="col-md-9" style="max-width: 100%;">
		<div class="card">
			<div class="card-header p-2">
				<ol class="nav nav-pills" style="font-family: Spoqa Han Sans; font-size:15px; margin:0px; border:none; padding-inline-start: 0px;  width:400px; float:left;  ">
					<li class="nav-item" ><a class="nav-link"
						href="/personal/list?mem_Id=${member.mem_Id}"  id="activityMenu" >내 이슈</a></li>
					<li class="nav-item" ><a class="nav-link active" style="background-color:#DC3545;"
						href="/personal/search/myFile?mem_Id=${member.mem_Id}" id="activityMenu">내가 쓴 글</a></li>
					<li class="nav-item" ><a class="nav-link"
						href="#" data-toggle="tab" id="activityMenu">내가 쓴 댓글</a></li>
					<li class="nav-item" ><a class="nav-link"
						href="#" data-toggle="tab" id="activityMenu">파일함</a></li>
				</ol>
				
								
			</div>
			
						<!-- Main content -->
	<section class="content">
		
			
			
			       <!-- 리스트 부분 -->
        <div class="card-body p-0">
           
          <table class="table table-striped projects">
              <thead style="text-align:center">
             
              <th>협업공간명</th>
              <th>파일명</th>
              <th>파일크기</th>
              <th>확장자</th>
              <th>글제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>다운로드</th>
              </thead>
              <tbody>
              
			<c:choose>
			<c:when test="${fn:length(myFile)!=0}">
                 <c:forEach var="myFile" items="${myFile}" >	
                  <tr>
                     <td>${myFile.c_Name}</td>
                  	 <td>${myFile.a_RealName}</td>
                  	 <td>${myFile.a_Size}</td>
                  	 <td>${myFile.a_NameEx}</td>
                  	 <td>${myFile.i_Name}</td>
                  	 <td>${myFile.mem_Name}</td>
                  	 <td>${myFile.i_Date}</td>
                  	 <td>${myFile.a_File}</td>
                   </tr>
                   
                   </c:forEach>
                 </c:when>
                 <c:otherwise>
                 <p style="text-align:center;"><small><br><br>파일이 없습니다.</small></p>
                 </c:otherwise>
                 </c:choose>
              </tbody>
          </table>
        </div>
        <!-- /리스트 부분 -->
       
       

	</section>
	<!-- /.content -->
					
				
				</div>
				       
			</div>
			<!-- /.card-body -->
		
		
<!-- /.content-wrapper -->

  <script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    })
  });
    
    
</script>