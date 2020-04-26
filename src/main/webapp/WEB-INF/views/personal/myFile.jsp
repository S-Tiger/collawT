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
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header" style="height: 100px">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"
							style="font-family: Recipekorea; max-width: 80%;">
							전체 파일함</h1>
          <p class="breadcrumb float-sm-left">레이아웃 바꿀 예정입니다~</p>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
			
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