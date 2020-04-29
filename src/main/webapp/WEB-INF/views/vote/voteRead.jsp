<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.btn-app {
	border-radius: 3px;
	color: #6c757d;
	font-size: 12px;
	height: 60px;
	margin: 0 0 0px 0px;
	min-width: 80px;
	padding: 0px 5px;
	position: relative;
	text-align: center;
}

#modal {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	width: 300px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		//댓글 목록 항상 호출
		//getReplyList();

		var formObj = $("form[name='readForm']");
		var formReply = $("form[name='replyForm']");

		//북마크 체크 변수
		var checkbook = 0

		//북마크 체크 확인
		bookcheck();

		//console.log("22222222222" + checkbook);

		//댓글 입력 버튼 클릭 시 이벤트

		//북마크 추가 상태 확인 메소드
		function bookcheck() {
			$.ajax({
				url : "/bookmark/bookmarkCheck",
				type : 'get',
				data : {
					v_Num : $("#v_Num").val(),
				},
				success : function(data) {
					if (data == 1) {
						$("#bookmarkinsert").css('color', '#f8f9fa');
						$("#bookmarkinsert").css('background-color', '#dc3545');
						console.log(checkbook);
						checkbook = 1;
						console.log(checkbook);
					}

				}
			})
		}

		$("#modal_opne_btn").click(function() {
			$("#modal").attr("style", "display:block");
		});

		$("#modal_close_btn").click(function() {
			$("#modal").attr("style", "display:none");
		});

	})
</script>



<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<div class="col-sm-6"></div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->

	<section class="content">

		<div class="row" id="row">
			<div class="col-md-6">

				<!-- Box Comment -->
				<!-- 본문 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

				<form name="insertVoterForm" action="/project/vote/insertVoter" method="get" encType="UTF-8">

					<div class="card card-widget">


						<div class="card-header">
							<td style="width: 10%; vertical-align: top"><span style="
							<c:if test="${voteRead.vs_Num == 1}">background-color:#28a745;</c:if>
							<c:if test="${voteRead.vs_Num == 2}">background-color:#6c757d;</c:if>
							" id="ig_Name" name="ig_Name" class="badge badge-success"><c:out
										value="${voteRead.vs_Name}" /></span></td>&nbsp;&nbsp; <span id="v_Name"><b><c:out value="${voteRead.v_Name}" /></b></span>


							<div class="btn-group float-right">
								<button type="button" class="btn btn-default" data-toggle="dropdown" aria-expanded="false" style="border: white; background-color: white; height: 20px; padding-top: 0px; color: gray">
									<i class="fas fa-ellipsis-h"></i>
								</button>
								<ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; right: 0px; transform: translate3d(0px, 38px, 0px);">

									<li><a class="dropdown-item" href="#"><small>다른 협업공간으로 복사</small></a></li>
									<li><a class="dropdown-item" href="#"><small>URL 복사</small></a></li>
								</ul>
							</div>
							<!-- 본인만 글 수정, 삭제 가능-->
							<c:if test="${member.mem_Id == voteRead.mem_Id}">
								<span class="text-muted float-right"><small><a href="/project/vote/update?c_Id=${voteRead.c_Id}&v_Num=${voteRead.v_Num}">수정</a>｜</small> <small><a onclick="if(confirm('삭제하시겠습니까?')){alert('삭제되었습니다.');}else{return false;};"
										href='/project/vote/delete?c_Id=${voteRead.c_Id}&v_Num=${voteRead.v_Num}'>삭제</a></small></span>
							</c:if>
						</div>



						<!-- /.card-header -->
						<div class="card-body">
							<span class="text-muted float-right" id="v_Date" style="font-size: small"> <c:out value="${voteRead.v_Date}" /></span>
							<div class="user-block">




								<!-- 멤버이미지 넣기 -->

								<c:if test="${voteRead.mem_File != null }">
									<img alt="프로필사진" width="50" height="50" src="/member/getByteImage?mem_Id=${voteRead.mem_Id}" class="img-circle elevation-2" />
								</c:if>
								<c:if test="${voteRead.mem_File == null }">
									<img src="${contextPath}/resources/dist/img/profile.jpg" width="50" height="50" class="img-circle elevation-2" alt="프로필사진">
								</c:if>
								<!-- 이름가죠오기 -->
								<span class="username" id="mem_Name"> <c:out value="${voteRead.mem_Name}" />
								</span> <span class="description" id="mem_Id"> <c:out value="${voteRead.mem_Id}" /></span>


							</div>
							<br> <br> <br> <br>


							<p id="v_Content">
								<c:out value="${voteRead.v_Content}" escapeXml="false" />
							</p>



							<br> <br> <br> <input type="hidden" id="v_Num" name="v_Num" value="${voteRead.v_Num}" /> <br> <br>

							<!-- 투표 view~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<div class="card card-primary collapsed-card">
								<div class="card-header" style="height: 30px; padding-left: 13px; padding-right: 16px; padding-top: 4px; background-color: #e87c87;">
									<label><small><b>${voteRead.v_Subject}</b></small></label>
									<div class="card-tools">
										<button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
								<input type="hidden" id="c_Id" name="c_Id" value="${voteRead.c_Id}" />
								<div class="card-body p-0" style="display: block;">
									<table class="table">
										<tbody>
											<!-- 투표 내용 -->
											<!--  상태 index -->
											<!-- for each -->
											<tr>
												<td style="padding-left: 0px; padding-right: 0px; width: 190px;"><c:forEach var="votedReadItem" items="${votedRead}" varStatus="status">
														<!-- 투표 리스트 -->
														<input type="hidden" name="getVsNum" value="${status.index+1 }">
														<input class="form-check-input" type="radio" name="vd_Num" value="${votedReadItem.vd_Num}" style="margin-left: 10px;">
														<label class="form-check-label" style="margin-left: 40px;">${votedReadItem.vd_Num}.&nbsp;&nbsp;&nbsp;${votedReadItem.vd_Content}</label>
														<i class="fas fa-users float-rignt" style="color: black;"></i>
														<span class="badge bg-gray">${votedReadItem.v_Count}</span>
														<br>
													</c:forEach></td>
												
											</tr>
											<tr>
											</tr>
											<tr>
												<td><ion-icon name="calendar-outline" style="font-size:24"></ion-icon>&nbsp; <span style="font-size: 0.8em;"><b>기간</b></span><br> <c:if test="${not empty voteRead.v_Start&& not empty voteRead.v_End}">
														<span id="v_Start" class="username "> <small><c:out value="${voteRead.v_Start}~" /></small>
														</span>
														<span id="v_End" class="username"> <small><c:out value="${voteRead.v_End}" /></small>
														</span>
													</c:if> <c:if test="${empty voteRead.v_Start&& empty voteRead.v_End}">
														<span class="username"> <small>기간 미설정</small></span>
													</c:if></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row float-right">
								<input type="submit" value="투표하기" class="btn btn-block btn-default btn-xs float-right" style="width: 80px; margin: 1px; padding-bottom: 1px; border-bottom-width: 1px; margin-bottom: 30px;">
							</div>



							<!-- 북마크 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
							<button type="button" class="btn btn-default btn-sm" id="bookmarkinsert" style="color: #444; margin: 3px;">
								<i class="fas fa-bookmark"></i> 북마크
							</button>
							<input type="hidden" name="mem_Id" value="${voteRead.mem_Id}"> <a id="list_btn" class="btn btn-default btn-sm" href='list?c_Id=${voteRead.c_Id}' style="color: #444; margin: 3px;"> <i class="fas fa-list"></i>&nbsp;목록
							</a> <br> <br>
							<div></div>
						</div>
						<!-- /.card-body -->
						<!-- /.card -->
					</div>
					<!-- /.col -->
					<div class="col-md-6">
						<!-- Box Comment -->

					</div>
					<!-- /.card -->
				</form>
			</div>

			<!-- /.card -->




			<!-- 댓글 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

			<div class="col-md-6">
				<div class="card">


					<div class="card-body">

						<c:forEach var="voteTotalItem" items="${voteTotal}">
							<p>${voteTotalItem.vd_Num}번&nbsp;&nbsp;${voteTotalItem.v_Count}명</p>
							<div>
								<progress value="${voteTotalItem.v_Count}" max="${voteRead.CO_MEM_TOTAL }"></progress>
								<label>${voteTotalItem.v_Count}/${voteRead.CO_MEM_TOTAL }*100%</label>
								<c:out value="${voteTotalItem.v_Count}x${voteRead.CO_MEM_TOTAL }"></c:out>

								<i class="fas fa-users" style="color: black;"></i> <span class="badge bg-gray">${voteTotalItem.v_Count}</span> <br>

							</div>

						</c:forEach>
						<!-- 차트 넣을곳-->
				
						<c:forEach var="voterItem" items="${voterList}">
							<p>${voterItem.vd_Num}번투표자${voterItem.mem_Name}(${voterItem.mem_Id})</p>
							<i class="fas fa-users" style="color: black;"></i>
							<span class="badge bg-gray">${voterItem.v_Count}</span>
							<br>

						</c:forEach>

					</div>

					<p>
						<a href="/#" data-needpopup-show="#voterList-popup" class="nav-link" id="voterlist"> <i class="fas fa-vote-yea"></i> 투표자 현황 <span class="badge badge-info right" id="bookmarkcount" style="background-color: #FFC108"></span>
						</a>
					</p>


					<!-- /댓글 입력 -->
				</div>
			</div>
			<div class="row">
				<div class="col-12"></div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<div id='voterList-popup' class="needpopup">
	<div class="col-md-6" style="max-width: 100%;">
		<table class="table table-striped projects" style="white-space: nowrap; overflow: hidden;">
			<div style="margin-bottom: 10px;">
				<h4 class="m-0 text-dark" style="font-family: Recipekorea; max-width: 80%; display: contents;">투표자 현황</h4>
			</div>
			<tr style="background-color: #dc3545; color: white;">
				<td style="width: 30%; vertical-align: top"><font size="3em"><b>보기</b></font></td>
				<td style="width: 50%"><font size="3em"><b>투표자</b></font></a>
				<td style="width: 50%"><font size="3em"><b></b></font></a>
			</tr>
			<tr>
				<td><c:forEach var="votedRead" items="${votedRead}" varStatus="status">
						<c:out value="${votedRead.vd_Num} ."></c:out>
						<label class="form-check-label">&nbsp;${votedRead.vd_Content}</label>
						<br>

					</c:forEach></td>
				<td><c:forEach var="voterItem" items="${voterList}">
						<label class="form-check-label">&nbsp;${voterItem.vd_Num}번투표자${voterItem.mem_Name}(${voterItem.mem_Id})</label>
						<br>
					</c:forEach></td>
				<td>
			</tr>
			<tbody id='bookmarkitem'>
			</tbody>
		</table>
	</div>
</div>
