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
/* $(document).ready(function() {
	$("#submit").click(function(){
		var searchLevel1 = $("#searchLevel1").val();
		alert(searchLevel1);
	
	});
}) */
				
</script>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header" style="height: 20px">
     
    </section>

	<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-2">

          <div class="card">
            
            <div class="card-body p-0">
              <ul class="nav nav-pills flex-column">
                  <li class="nav-item active">
                  <a href="/search/wholeresult?keyword=${keyword}" class="nav-link">
                    <i class="fas fa-th-large"></i> 전체
                    <span class="badge bg-primary float-right">12</span>
                  </a>
                </li>
                <li class="nav-item active">
                  <a href="/search/issueresult?keyword=${keyword}" class="nav-link">
                     <i class="far fa-file-alt"></i> 이슈
                    <span class="badge bg-primary float-right">12</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="/search/voteresult?keyword=${keyword}" class="nav-link">
                    <i class="fas fa-vote-yea"></i> 투표
                  </a>
                </li>
                <li class="nav-item">
                  <a href="/search/fileresult?keyword=${keyword}" class="nav-link">
                    <i class="fas fa-inbox"></i> 파일
                  </a>
                </li>
                <li class="nav-item">
                  <a href="/search/replyresult?keyword=${keyword}" class="nav-link">
                    <i class="fas fa-comment-dots"></i> 댓글 및 메모
                    <span class="badge bg-warning float-right">65</span>
                  </a>
                </li>
               
              </ul>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <div class="card">
            
            <div class="card-body p-0">
              <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <i class="far fa-circle text-danger"></i>
                    	전체 협업공간
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <i class="far fa-circle text-warning"></i> 전체 작성자
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <i class="far fa-circle text-primary"></i>
                    	최신 순
                  </a>
                </li>
              </ul>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
        <div class="col-md-10">
          <div class="card card-danger card-outline">
            <div class="card-header">
              <h4 class="card-title"><b>검색 결과 총 ${voteCount}건</b></h4>

              <div class="card-tools">
                <div class="input-group input-group-sm">
                  <div class="input-group-append">

                  </div>
                </div>
              </div>
              <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
            
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <c:forEach var="item" items="${voteList}" >
                  <tr>
              
                    <td class="mailbox-name">
                    <div class="row" style="padding-bottom:10px;">
                     <span>
						<a  style="color:black;" href="/project/vote/read?c_Id=${item.c_Id}&v_Num=${item.v_Num}">
	                    <b>${item.v_Name}</b> </a>
	                   
	                   &nbsp;&nbsp;
	                   
			                   <span style= "height : 17px; font-size : 10px; vertical-align : text-bottom; padding: .4em .4em;
									<c:if test="${item.vs_Num == '1'}">background-color:#28a745;</c:if>
									<c:if test="${item.vs_Num == '2'}">background-color:#6c757d;</c:if>
									"
									id="ig_Name" name="ig_Name" class="badge badge-success">
									
									<c:if test="${item.vs_Num == '1'}">진행중</c:if>
									<c:if test="${item.vs_Num == '2'}">완료</c:if>
									
									
								</span>
								<br>
								<small>주제 : ${item.v_Subject}</small>
						
                     
                  	</span>

								
                    </div>
                      <div class="row" style= "vertical-align:text-bottom;">
                    
                  
                    <span>
                   <img class="img-fluid img-circle img-sm"
								src="/member/getByteImage?mem_Id=${item.wr_mem_Id}" alt="Alt Text" width="30" height="30" >
								 <small>&nbsp;${item.mem_Name}(${item.wr_mem_Id})</small></span>
								&nbsp;&nbsp;
								
								<span><small>from&nbsp;&nbsp;</small></span>
								
								<span><small><b>

								<a href="/project/main?c_Id=${item.c_Id}">
								${item.c_Name}</a>
							
								</b></small>
								</span>
					</div>
                    </td>
                    <td class="mailbox-subject">
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="mailbox-date">
                    <span><small>${item.v_Date}</small></span>
                    <!-- 5 mins ago --></td>
                  </tr>
              </c:forEach>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer p-0">
              <div class="mailbox-controls">
                <!-- Check all button -->
                
                <div class="btn-group">
                  
                </div>
                
                <div class="float-left">
                 	      <div class="form-group" style="margin-left:20px">

   <ul class="pagination pagination-sm m-0">
    <c:if test="${votepageMaker.prev}">
    	<li class="page-item" id="liStyle"><a class="page-link" href="voteresult?${votepageMaker.makeQuery(votepageMaker.startPage - 1)}">&laquo;</a></li>
    </c:if> 

    <c:forEach begin="${votepageMaker.startPage}" end="${votepageMaker.endPage}" var="idx">
    <c:choose>
    <c:when test="${votepageMaker.page==idx}">
    	<li class="page-item" id="liStyle"><a class="page-link" href="voteresult${votepageMaker.makeQuery(idx)}" style="background-color:#DC3545; color:white">${idx}</a></li>
    </c:when>
    <c:otherwise>
    <li class="page-item" id="liStyle"><a class="page-link" href="voteresult${votepageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:otherwise>
    </c:choose>
    </c:forEach>

    <c:if test="${votepageMaker.next && votepageMaker.endPage > 0}">
    	<li class="page-item" id="liStyle"><a class="page-link" href="voteresult${votepageMaker.makeQuery(votepageMaker.endPage + 1)}">&raquo;</a></li>
    </c:if> 
  </ul>
  
  </div>
                </div>
                <!-- /.float-right -->
              </div>
            </div>
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
	<!-- /.content -->
	</div>
		
<!-- /.content-wrapper -->

<script>
  $(function () {
    //Enable check and uncheck all functionality
   

  })
</script>