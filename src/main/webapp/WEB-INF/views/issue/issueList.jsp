<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		
		
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 협업공간명 불러오기로 수정할 것!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>프라이빗 공간</h1>
            <small>자유롭게 사용 가능한 개인 공간입니다 :D</small>
          </div>
          
         
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">
    	
    

    <!-- card -->
      <div class="card">
      
      
        <!-- 표 윗부분 -->
<div class="card-header" style="background-color:#fff;">
        <ol class="breadcrumb-sm-left" style="margin:0px; border:none; padding-inline-start: 0px;  width:400px; float:left">
          <li class="breadcrumb-item"><a href="#">협업공간 이슈</a></li>
          <li class="breadcrumb-item"><a href="#">칸반</a></li>
          <li class="breadcrumb-item"><a href="#">내가 작성한 이슈</a></li>
          <li class="breadcrumb-item"><a href="#">캘린더</a></li>
         </ol>
         <input type="button" value="이슈 작성" class="btn btn-success float-right" onclick="location.href='insert'" 
         style="width:100px; text-align:center; float:right">
    </div>
    
        <!-- /표 윗부분 -->
        
        <!-- 리스트 부분 -->
        <div class="card-body p-0">
           
          <table id="example1" class="table table-striped projects">
              <tbody>

                 <c:forEach var="issueList" items="${issueList}" >	
                  <tr>
                      <td>  ${issueList.mem_Name}    </td>
                      <td> <a href="/issue/read?i_Num=${issueList.i_Num}"> ${issueList.i_Name}</a>    </td>
                      <td>  ${issueList.i_Date}    </td>
                   </tr>
                   </c:forEach>
              </tbody>
          </table>
        </div>
        <!-- /리스트 부분 -->
        
        <!-- 페이징 -->
  <div class="card-footer">
        
   <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </div>
  
</div>
        <!--/페이징  -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /Main content -->
  </div>
  <!-- /.content-wrapper -->
  
  <script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,

    });
    
    
</script>


<%@include file="../includes/footer.jsp"%>