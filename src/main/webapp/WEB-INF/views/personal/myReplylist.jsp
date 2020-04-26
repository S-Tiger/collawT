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
						href="/personal/search/myBoardlist?mem_Id=${member.mem_Id}" id="activityMenu">내가 쓴 글</a></li>
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
              <th></th>
              <th>협업공간명</th>
              <th>글 제목</th>
              <th>작성일</th>
              </thead>
              <tbody>
              
			<c:choose>
			<c:when test="${fn:length(myBoardlist)!=0}">
                 <c:forEach var="myBoardlist" items="${myBoardlist}" >	
                  <tr>
                  <!-- 체크박스 -->
                  	 <td style="width:5%">	
                        <input type="checkbox" value="" id="${myBoardlist.rnum}" name="${myBoardlist.rnum}">
				  </td>
				  <!-- 협업공간명 -->
				  <td style="width:10%; text-align:center">
				   <font size="3em">
				  <c:if test="${myBoardlist.c_Name==null}">내 공간</c:if>
				  <c:if test="${myBoardlist.c_Name!=null}"> ${myBoardlist.c_Name}</c:if></font>
					 
				  </td>
               	<!-- 링크 -->
				<td style="width:60%">	
				<c:if test="${myBoardlist.boardtype==1}">
				<a href="/project/issue/read?c_Id=${myBoardlist.c_Id}&i_Num=${myBoardlist.i_Num}"> <font size="3em"><b>${myBoardlist.i_Name}</b></font></a>
				</c:if>
				<c:if test="${myBoardlist.boardtype==2}">
				<a href="/project/vote/read?c_Id=${myBoardlist.c_Id}&v_Num=${myBoardlist.i_Num}"> <font size="3em"><b>${myBoardlist.i_Name}</b></font></a>
				</c:if>
				<c:if test="${myBoardlist.boardtype==3}">
				<a href="/personal/read?mem_Id=${myBoardlist.mem_Id}&p_Num=${myBoardlist.i_Num}"> <font size="3em"><b>${myBoardlist.i_Name}</b></font></a>
				</c:if>
					  
					  <br>
				  </td>
				  <td style="width:25%; text-align:center">	
					  <font size="3em"><b>${myBoardlist.i_Date}</b></font>
					  <br>
				  </td>
                    
                     
                   </tr>
                   
                   </c:forEach>
                 </c:when>
                 <c:otherwise>
                 <p style="text-align:center;"><small><br><br>작성한 글이 없습니다.</small></p>
                 </c:otherwise>
                 </c:choose>
              </tbody>
          </table>
        </div>
        <!-- /리스트 부분 -->
       
         <br>
        <input type="checkbox" value="" id="chackAll" name="chackAll">전체선택
		<br>
       

	</section>
	<!-- /.content -->
					
				
				</div>
				        <!-- 페이징 -->
 <div class="form-group" style="margin-left:20px">

   <ul class="pagination pagination-sm m-0">
    <c:if test="${pageMaker.prev}">
    	<li class="page-item" id="liStyle"><a class="page-link" href="myBoardlist${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    <c:choose>
    <c:when test="${pageMaker.page==idx}">
    	<li class="page-item" id="liStyle"><a class="page-link" href="myBoardlist${pageMaker.makeQuery(idx)}" style="background-color:#DC3545; color:white">${idx}</a></li>
    </c:when>
    <c:otherwise>
    <li class="page-item" id="liStyle"><a class="page-link" href="myBoardlist${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:otherwise>
    </c:choose>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page-item" id="liStyle"><a class="page-link" href="myBoardlist${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
    </c:if> 
  </ul>
  <br>
  </div>
  
 
        <!--/페이징  -->
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