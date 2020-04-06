<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");
			

		//수정페이지로 이동 jquery
		$("#update_btn").on("click", function() {
			
			formObj.attr("action", "/issue/update");
			formObj.attr("method", "get");
			formObj.submit();
		})

		//삭제 jquery
		$("#delete_btn").on("click", function() {
			if(confirm("삭제하시겠습니까?")){
				formObj.attr("action", "/issue/delete");
				formObj.attr("method", "post");
				formObj.submit();
				alert("삭제되었습니다.");
			}
			
		})
		
		
 		//댓글 입력 버튼 클릭 시 이벤트
		$("#replyInsert_btn").on("click", function() {
			var r_Content = $("#r_Content").val();
			//댓글 입력 비어있으면 아무 이벤트도 일어나지 않게 하기
			if(r_Content==''){
				return false;
			}
		})
			/* }else{
				$.ajax({
					url:"/reply/replyInsert",
					type:'get',
					data:{
						r_Content: $("#r_Content").val(),
						i_Num : $("#i_Num").val(),
						c_Id : $("#c_Id").val()
					},
					success:function(data){
						if(data == 1) {
	                        console.log("댓글이 정상적으로 입력되었습니다.");
	                        $("#r_Content").val("");
						}
					}
				})
			}
		}) */
		
		//댓글 조회 ajax
		/* $.ajax({
			url : 'issue/read'
		}) */
		
	})
	
	
</script>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					
				</div>
				<div class="col-sm-6">
			
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->

	<section class="content">

		<div class="row">
			<div class="col-md-6">

				<!-- Box Comment -->
<!-- 본문 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				
				<form name="readForm" role="form">

					<div class="card card-widget">
						<div class="card-header">
							<span id="i_Name" name="i_Name"><b><c:out
										value="${issueRead.i_Name}" /></b></span>
							<!-- /.user-block -->
							<div class="card-tools">

								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool"
									data-card-widget="remove">
									<i class="fas fa-times"></i>
								</button>
							</div>
							<!-- /.card-tools -->
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<div class="user-block">


								<!-- 멤버이미지 넣기 -->
								<img class="img-circle"
									src="../resources/dist/img/user1-128x128.jpg" alt="User Image">
								<span class="username" id="mem_Name" name="mem_Name"><c:out
										value="${issueRead.mem_Name}" /></span> <span class="description"
									id="i_Date" name="i_Date"><c:out
										value="${issueRead.i_Date}" /></span>
							</div>
							<br>
							<br>
							<br>
								<p id="i_Content" name="i_Content"><c:out value="${issueRead.i_Content}" escapeXml="false"/></p>
						
							
							
							<br>
							<br>
							<br>
							<!-- 이거 나중에 기능 넣기 -->
							<button type="button" class="btn btn-default btn-sm">
								<i class="fas fa-share"></i> Share
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<i class="far fa-thumbs-up"></i> Like
							</button>
							<span class="float-right text-muted">127 likes - 3
								comments</span> <input type="hidden" id="i_Num" name="i_Num"
								value="${issueRead.i_Num}" /> <br>
							<br>

							
							
<!-- 첨부파일 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				

					<div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">Files</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-minus"></i></button>
              </div>
            </div>
            <div class="card-body p-0">
              <table class="table">
                <thead>
                  <tr>
                    <th>File Name</th>
                    <th>File Size</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>

                  <tr>
                    <td>Functional-requirements.docx</td>
                    <td>49.8005 kb</td>
                    <td class="text-right py-0 align-middle">
                      <div class="btn-group btn-group-sm">
                        <a href="#" class="btn btn-info"><i class="fas fa-eye"></i></a>
                        <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                      </div>
                    </td>
                 
                </tbody>
              </table>
            </div>
           <!--  /.card-body -->
          </div>
          <!-- /.card -->
<!-- 본인만 글 수정, 삭제 가능-->
						
						<c:if test="${sessionScope.mem_Id == issueRead.mem_Id}">
						
								<input type="submit" value="삭제" id="delete_btn"
									class="btn btn-success float-right">
								<input type="submit" value="수정" id="update_btn"
									class="btn btn-success float-right">
						</c:if>

							<input type="button" value="목록"
								class="btn btn-success float-right"
								onclick="location.href='list'">
								
								<br><br><br>
						</div>

						<!-- /.card-body -->

						<!-- /.card -->
					</div>

					<!-- /.col -->
					<div class="col-md-6">
						<!-- Box Comment -->

					</div>

					<!-- /.card -->
					
			</div>
			</form>

<!-- /.card -->




<!-- 댓글 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				

			<div class="col-md-6">
				<div class="card">
					<div class="card-header">

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" data-toggle="tooltip"
								title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
						</div>
					</div>
					<!-- /.card-body -->
					<div class="card-footer card-comments">
						<div class="card-comment">
							<!-- User image 나중에 바꾸기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<c:forEach var="replyList" items="${replyList}" >
							<img class="img-circle img-sm"
								src="../resources/dist/img/user3-128x128.jpg" alt="User Image">

							<div class="comment-text">
							
								
								<span class="username"> ${replyList.mem_Name}
								
								
								<span class="text-muted float-right">${replyList.r_Date} </span>
								<span class="text-muted float-right">삭제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<span class="text-muted float-right">수정&nbsp;&nbsp;&nbsp;</span>
								
								</span>
								<!-- /.username -->
								${replyList.r_Content}
								
							</div>
							<div class="comment-text">
							</div>
							<br>
							</c:forEach>
							<!-- /.comment-text -->
						</div>
						<!-- /.card-comment -->
						<div class="card-comment">
							<!-- User image -->
						
							
							<!-- /.comment-text -->
						</div>
						<!-- /.card-comment -->
					</div>
					<!-- /.card-footer -->
					<div class="card-footer">

						<!-- 댓글  입력-->
						<form name="replyForm" action="/reply/replyInsert" method="post" encType="UTF-8">
							<img class="img-fluid img-circle img-sm"
								src="../resources/dist/img/user4-128x128.jpg" alt="Alt Text">
							<!-- .img-push is used to add margin to elements next to floating images -->
							<div class="img-push">
								<input type="text" id="r_Content" name="r_Content" class="form-control form-control-sm"
									placeholder="댓글을 입력하세요">
									<input type="submit" id="replyInsert_btn" name="replyInsert_btn" class="btn btn-block btn-default btn-xs" value="입력" />
									
									<input type="hidden" id="i_Num" name="i_Num" value="${issueRead.i_Num}" />
									<input type="hidden" id="c_Id" name="c_Id" value="${issueRead.i_Num}" />
								
								
							</div>
						</form>


						<!-- /.card-body -->
					</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-12"></div>
			</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../includes/footer.jsp"%>
