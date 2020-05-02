<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />



<style>
.accent-teal .btn-link, .accent-teal a:not(.dropdown-item):not(.btn-app):not(.nav-link):not(.brand-link) {
    color: #343a40;
}
@font-face {
	font-family: 'Recipekorea';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
.nav-pills .nav-link.active{
		    background-color: #dc3545;
}


</style>

<script type="text/javascript">
$(document).ready(function() {
	

    
	$("#checkAll").click(function(){
		if($("#checkAll").is(":checked")==true){
			
			$("input[name='checkbox']").prop("checked", true); 
	
		}else{
			$("input[name='checkbox']").prop("checked", false); 
		}		
	})

  });
  
  function fileDelete(){
	  
	//체크박스 중 체크된 체크박스만 가져와서 Loop 합니다.
	  $("input:checkbox[name=checkbox]:checked").each(function(i,elements){
	      //해당 index(순서)값을 가져옵니다.
	      index = $(elements).index("input:checkbox[name=checkbox]");                
	      //해당 index에 해당하는 체크박스의 ID 속성을 가져옵니다.        
	      alert($("input:checkbox[name=checkbox]").eq(index).attr("id"));
	     
	  });
  }
  

		
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
						href="/personal/search/myBoardlist?mem_Id=${member.mem_Id}" id="activityMenu"><b>내가 쓴 글</b></a></li>
					<li class="nav-item" ><a class="nav-link"
						href="#" data-toggle="tab" id="activityMenu">내가 쓴 댓글</a></li>
					
				</ol>
				
								
			</div>
			
						<!-- Main content -->
	<section class="content">
		
			
			
			       <!-- 리스트 부분 -->
        <div class="card-body p-0">
           <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
           
           <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
              <thead style="font-size:13px;">
                <tr role="row">
                <th><input type="checkbox" value="" id="checkAll" name="checkAll"></th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" style="width: 203.4px;">협업공간명</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 262.6px;">글 제목</th>
                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 233px;">작성일</th>
               </tr>
            
              </thead>
              <tbody>
              
			<c:choose>
			<c:when test="${fn:length(myBoardlist)!=0}">
                 <c:forEach var="myBoardlist" items="${myBoardlist}" >	
                  <tr role="row" class="odd">
                  <!-- 체크박스 -->
                  	 <td style="width:5%" class="sorting_1">	
                        <input type="checkbox" value="" id="checkbox${myBoardlist.rnum}" name="checkbox">
                        <input type="text" value="${myBoardlist.rnum}" id="text${myBoardlist.rnum}" name="checkbox">
				  </td>
				  <!-- 협업공간명 -->
				  <td class="sorting_1" style="width:10%;">
				   <font size="3em">
				  <c:if test="${myBoardlist.c_Name==null}">내 공간</c:if>
				  <c:if test="${myBoardlist.c_Name!=null}"> ${myBoardlist.c_Name}</c:if></font>
					 
				  </td>
               	<!-- 링크 -->
				<td class="sorting_1" style="width:60%">	
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
				  <td class="sorting_1" style="width:25%; text-align:center">	
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
                  <button type="button" class="btn btn-danger" onclick="javascript:fileDelete()" style="text-align:center; float:right; font-family: Spoqa Han Sans; font-size:13px;">
								<b>삭제</b></button>
          </div>

        
        
        </div>
        <!-- /리스트 부분 -->
       
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

  