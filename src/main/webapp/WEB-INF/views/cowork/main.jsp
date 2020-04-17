<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
 
.needpopup {
	border-radius: 6px;
	box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 1);
}

.needpopup p {
	font-size: 1.2em;
	line-height: 1.4;
	color: #343638;
	margin: 15px 0;
	margin: 0;
}

.needpopup p+p {
	margin-top: 10px;
}

#applyspan {
	background-clip: padding-box;
    border: 1px solid #17a2b8;
    padding: 2px;
    margin: 2px;
    display: inline-block;
}
#applydelete {
	margin: 2px;
}

</style>


<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/modal/dist/needpopup.min.css">

<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="../resources/modal/dist/needpopup.min.js"></script>
<script>

	needPopup.config.custom = {
		'removerPlace' : 'outside',
		'closeOnOutside' : false,
		onShow : function() {
			console.log('needPopup is shown');
		},
		onHide : function() {
			console.log('needPopup is hidden');
		}
	};
	needPopup.init();


	$('#update-popup').ready(function (){
				$('#insertsubmit').click(function() {
					var listnum = $('#applyList').children().length;
					if (listnum == 0) {
					alert("초대 리스트가 비어있습니다");
						return false;
					}
				})
		
		
			    $('#mem_Id').keydown(function(event) {
			    	if(event.keyCode == '13'){
			    		var mem_Id = $('#mem_Id').val();
			    		if(mem_Id == '${member.mem_Id}'){
			    			$("#id_check").text("자신을 초대할수 없습니다 :p");
							$("#id_check").css("color", "red");
			    		}else{
			    		$.ajax({
							url : '${contextPath}/news/memberCheck?mem_Id=' + mem_Id,
							type : 'get',
							success : function(data) {
								console.log("1 = 중복o / 0 = 중복x : " + data);
								if (data == 1) {
									$('#applyList').append("<span id= 'applyspan'>"+mem_Id+"<a id ='applydelete' href='#'>x</a></span>");
									$('#applyform').append("<input type='hidden' name='mem_Id' value='"+mem_Id+"'>");
									$('#mem_Id').val("");
									
									
									
								} else {
									$("#id_check").text("잘못된 아이디 입니다 다시 확인해주세요 :p");
									$("#id_check").css("color", "red");
								}
							}
						})}
			    	}else{
			    		$("#id_check").text("이메일 주소를 입력하고 Enter키를 눌러 파트너들을 초대해 보세요.");
						$("#id_check").css("color", "#a1a1a1");
			    	}
			    	
			    });
			});


			
			
</script>
<!-- 정보변경 모달 팝업 내용 -->
<div id='update-popup' class="needpopup">
	<a href="#"></a>
	<p>
	<form id="projectupdate" action="/project/update" method="post">
		<p class="login-box-msg" style="padding-bottom: 10px">
			<input type="hidden" id="c_Id" name="c_Id" value="${pjt.c_Id}">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">이름</label> <input class="form-control" type="text" id="c_Name"
				name="c_Name" required value="${pjt.c_Name}">
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">설명</label>
			<textarea class="form-control" rows="3" id="c_Comment"
				name="c_Comment" required>${pjt.c_Comment}</textarea>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">관리자 변경</label><br><select name="mem_Id">
				<option value="${member.mem_Id}">${member.mem_Name}(${member.mem_Id})</option>
			<c:forEach var="memberList" items="${memberList}" >	
				<c:if test="${memberList.mem_Id != pjt.mem_Id}">
				<option value="${memberList.mem_Id}">${memberList.mem_Name}(${memberList.mem_Id})</option>
				</c:if>
				</c:forEach>
			</select>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">카테고리</label><br> <select name="c_Category">
			
				<option value="${pjt.c_Category}">${pjt.c_Category}</option>
				<option value="0">협업업무관련</option>
				<option value="1">개인업무관련</option>
				<option value="2">학업과제관련</option>
			</select>
		</p>
			<button type="submit" class="btn btn-block btn-success">정보변경</button>
			</form>
	<span>
		<form id="projectdelete" action="/project/delete" method="post">
		<input type="hidden" id="c_Id" name="c_Id" value="${pjt.c_Id}">
		<button style="background-color: #dc3545;" type="submit" class="btn btn-block btn-success">협업공간삭제</button>
	</form>
	</span>
</div>
<!-- 맴버초대 모달 팝업 내용 -->
<div id='add-popup' class="needpopup">
	<a href="#"></a>
	<p>
		<div style="padding-bottom: 25px;">
			<h4 class="m-0 text-dark"
				style="font-family: Recipekorea; padding-bottom: 5px;" >파트너 초대</h4>
			<span style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1;">
				많은 사람을 초대하여 원활한 의사소통으로 업무를 효율적으로 처리해보세요. 회사 동료뿐만 아니라 외부 협업자도 파트너로
				초대할 수 있습니다.</span>
		</div>

		<div style="padding-bottom: 25px;">
			<h4 class="m-0 text-dark"
				style="font-family: Recipekorea; padding-bottom: 5px;">파트너 아이디</h4>
			<input style="margin-bottom: 5px;" class="form-control" type="text" id="mem_Id" name="mem_Id"
				required> <span id= "id_check"
				style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1;">
				이메일 주소를 입력하고 Enter키를 눌러 파트너들을 초대해 보세요.</span>
		</div>


		<div style= "padding-bottom: 25px">
			<h4 class="m-0 text-dark"
				style="font-family: Recipekorea; padding-bottom: 5px;">초대 리스트</h4>
			<div id = "applyList" class = "form-control" style="height: 152px; width: 490px; white-space: pre-line; margin-bottom: 5px;"></div> <span
				style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1; ">
			
				 초대 메세지를 보낼 파트너 아이디를 여기서 확인할 수 있습니다.</span>
		</div>
		<div><span style="float: left; padding-right: 50px;">
		<form action="/news/insert" method="post" id = "applyform">
			<input type="hidden" name="c_Id" value="${pjt.c_Id}">
			<button type="submit" id= "insertsubmit" class="btn btn-block btn-success" 
			style="width: 220px;">초대하기</button></form></span>
		<span>
		<button type="reset" class="btn btn-block btn-success" onclick="history.go(0);" style="width: 220px">취소</button>
		</span>
		</div>
		
</div>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header" style="height: 100px">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<div>
						<h1 class="m-0 text-dark"
							style="font-family: Recipekorea; max-width: 80%; display: contents;">${pjt.c_Name}</h1>
							<c:if test="${member.mem_Id == pjt.mem_Id}">
						<a style="font-size: 20px;  margin: 3px;" href="/#"
							data-needpopup-show="#update-popup"><i
							class="nav-icon fas fa-cogs"> </i></a>
							</c:if>
					</div>
					<div>
					<p class="breadcrumb float-sm-left" style="position: absolute; margin-top: 10px">${pjt.c_Comment}</p>
					</div>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">

						<li class="breadcrumb-item"><a style="font-size: 30px; "
							href="/#" data-needpopup-show="#add-popup"> <i
								style="width: 25px; height: 25px;" class="ion ion-person-add"></i></a></li>
						<li class="breadcrumb-item active">파트너 추가</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->
<div class="col-md-9" style="max-width: 100%;">
		<div class="card">
			<div class="card-header p-2">
				<ul class="nav nav-pills">
					<li class="nav-item" ><a class="nav-link active"
						href="#activity" data-toggle="tab" id="activityMenu">홈</a></li>
					<li class="nav-item" id = "applymenu"><a class="nav-link" href="/project/issue/list?c_Id=${pjt.c_Id}"
						 id= "issueMenu">이슈</a></li>
					<li class="nav-item"><a class="nav-link" href="#settings"
						data-toggle="tab">Settings</a></li>
				</ul>
			</div>
			
			<div class="card-body">
				<div class="tab-content">
					<div class="active tab-pane" id="activity">
						<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-info">
						<div class="inner">
							<h3>150</h3>

							<p>New Orders</p>
						</div>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-success">
						<div class="inner">
							<h3>
								53<sup style="font-size: 20px">%</sup>
							</h3>

							<p>Bounce Rate</p>
						</div>
						<div class="icon">
							<i class="ion ion-stats-bars"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-warning">
						<div class="inner">
							<h3>44</h3>

							<p>User Registrations</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-danger">
						<div class="inner">
							<h3>65</h3>

							<p>Unique Visitors</p>
						</div>
						<div class="icon">
							<i class="ion ion-pie-graph"></i>
						</div>
						<a href="#" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
			</div>
			<!-- /.row -->
			<!-- Main row -->
			<div class="row">
				<!-- Left col -->
				<section class="col-lg-7 connectedSortable">


					<!-- TO DO List -->
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">
								<i class="ion ion-clipboard mr-1"></i> To Do List
							</h3>

							<div class="card-tools">
								<ul class="pagination pagination-sm">
									<li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
									<li class="page-item"><a href="#" class="page-link">1</a></li>
									<li class="page-item"><a href="#" class="page-link">2</a></li>
									<li class="page-item"><a href="#" class="page-link">3</a></li>
									<li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
								</ul>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<ul class="todo-list" data-widget="todo-list">
								<li>
									<!-- drag handle --> <span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span> <!-- checkbox -->
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo1" id="todoCheck1">
										<label for="todoCheck1"></label>
									</div> <!-- todo text --> <span class="text">Design a nice
										theme</span> <!-- Emphasis label --> <small
									class="badge badge-danger"><i class="far fa-clock"></i>
										2 mins</small> <!-- General tools such as edit or delete-->
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div>
								</li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo2" id="todoCheck2"
											checked> <label for="todoCheck2"></label>
									</div> <span class="text">Make the theme responsive</span> <small
									class="badge badge-info"><i class="far fa-clock"></i> 4
										hours</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo3" id="todoCheck3">
										<label for="todoCheck3"></label>
									</div> <span class="text">Let theme shine like a star</span> <small
									class="badge badge-warning"><i class="far fa-clock"></i>
										1 day</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo4" id="todoCheck4">
										<label for="todoCheck4"></label>
									</div> <span class="text">Let theme shine like a star</span> <small
									class="badge badge-success"><i class="far fa-clock"></i>
										3 days</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo5" id="todoCheck5">
										<label for="todoCheck5"></label>
									</div> <span class="text">Check your messages and
										notifications</span> <small class="badge badge-primary"><i
										class="far fa-clock"></i> 1 week</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
								<li><span class="handle"> <i
										class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
								</span>
									<div class="icheck-primary d-inline ml-2">
										<input type="checkbox" value="" name="todo6" id="todoCheck6">
										<label for="todoCheck6"></label>
									</div> <span class="text">Let theme shine like a star</span> <small
									class="badge badge-secondary"><i class="far fa-clock"></i>
										1 month</small>
									<div class="tools">
										<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
									</div></li>
							</ul>
						</div>
						<!-- /.card-body -->
						<div class="card-footer clearfix">
							<button type="button" class="btn btn-info float-right">
								<i class="fas fa-plus"></i> Add item
							</button>
						</div>
					</div>
					<!-- /.card -->
				</section>
				<!-- /.Left col -->
				<!-- right col (We are only adding the ID to make the widgets sortable)-->
				<section class="col-lg-5 connectedSortable">

					<!-- Map card -->
					<div class="card bg-gradient-primary">
						<!-- /.card-body-->
						<div class="card-footer bg-transparent">
							<div class="row">
								<div class="col-4 text-center">
									<div id="sparkline-1"></div>
									<div class="text-white">Visitors</div>
								</div>
								<!-- ./col -->
								<div class="col-4 text-center">
									<div id="sparkline-2"></div>
									<div class="text-white">Online</div>
								</div>
								<!-- ./col -->
								<div class="col-4 text-center">
									<div id="sparkline-3"></div>
									<div class="text-white">Sales</div>
								</div>
								<!-- ./col -->
							</div>
							<!-- /.row -->
						</div>
					</div>
					<!-- /.card -->


					<!-- Calendar -->
					<div class="card bg-gradient-success">
						<div class="card-header border-0">

							<h3 class="card-title">
								<i class="far fa-calendar-alt"></i> Calendar
							</h3>
							<!-- tools card -->
							<div class="card-tools">
								<!-- button with a dropdown -->
								<div class="btn-group">
									<button type="button"
										class="btn btn-success btn-sm dropdown-toggle"
										data-toggle="dropdown">
										<i class="fas fa-bars"></i>
									</button>
									<div class="dropdown-menu float-right" role="menu">
										<a href="#" class="dropdown-item">Add new event</a> <a
											href="#" class="dropdown-item">Clear events</a>
										<div class="dropdown-divider"></div>
										<a href="#" class="dropdown-item">View calendar</a>
									</div>
								</div>
								<button type="button" class="btn btn-success btn-sm"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-success btn-sm"
									data-card-widget="remove">
									<i class="fas fa-times"></i>
								</button>
							</div>
							<!-- /. tools -->
						</div>
						<!-- /.card-header -->
						<div class="card-body pt-0">
							<!--The calendar -->
							<div id="calendar" style="width: 100%"></div>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</section>
				<!-- right col -->
			</div>
			<!-- /.row (main row) -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="timeline">
						<!-- The timeline -->
						<div class="timeline timeline-inverse">
							<!-- timeline time label -->
							<div class="time-label">
								<span class="bg-danger"> 10 Feb. 2014 </span>
							</div>
							<!-- /.timeline-label -->
							<!-- timeline item -->
							 <c:forEach var="applylist" items="${applylist}">
							 <c:choose>
							 <c:when  test= "${applylist.ap_Yn eq 'waiting'}">
							<div>
								<i class="fas fa-envelope bg-primary"></i>

								<div class="timeline-item">
									<span class="time"><i class="far fa-clock"></i> ${applylist.ap_Date}</span>

									<h3 class="timeline-header">
										<a href="#">${applylist.c_Name}</a>에서 가입요청이 왔습니다
									</h3>
									<div class="timeline-body">${applylist.mem_Name}님께서 회원님을  ${applylist.c_Name}에 초대하셨습니다. </div>
									<div class="timeline-footer" id="timeline-footer">
									<form action="/news/accept" method="post" style="display: inline;  margin: 5;">
									<input type="hidden" name="c_Id" id="c_Id" value="${applylist.c_Id}">
									<input type="hidden" name="mem_Id" id="mem_Id" value="${applylist.mem_Id}">
										<a id = "acceptsubmit" href="#" class="btn btn-primary btn-sm" style="color: white;">수락</a>
										<a id = "rejectsubmit" href="#" class="btn btn-danger btn-sm" style="color: white;">거절</a>
										</form>
									</div>
								</div>
							</div>
							</c:when>
							</c:choose>
							  </c:forEach>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas fa-user bg-info"></i>

								<div class="timeline-item">
									<span class="time"><i class="far fa-clock"></i> 5 mins
										ago</span>

									<h3 class="timeline-header border-0">
										<a href="#">Sarah Young</a> accepted your friend request
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas fa-comments bg-warning"></i>

								<div class="timeline-item">
									<span class="time"><i class="far fa-clock"></i> 27 mins
										ago</span>

									<h3 class="timeline-header">
										<a href="#">Jay White</a> commented on your post
									</h3>

									<div class="timeline-body">Take me to your leader!
										Switzerland is small and neutral! We are more like Germany,
										ambitious and misunderstood!</div>
									<div class="timeline-footer">
										<a href="#" class="btn btn-warning btn-flat btn-sm">View
											comment</a>
									</div>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline time label -->
							<div class="time-label">
								<span class="bg-success"> 3 Jan. 2014 </span>
							</div>
							<!-- /.timeline-label -->
							<!-- timeline item -->
							<div>
								<i class="fas fa-camera bg-purple"></i>

								<div class="timeline-item">
									<span class="time"><i class="far fa-clock"></i> 2 days
										ago</span>

									<h3 class="timeline-header">
										<a href="#">Mina Lee</a> uploaded new photos
									</h3>

									<div class="timeline-body">
										<img src="http://placehold.it/150x100" alt="..."> <img
											src="http://placehold.it/150x100" alt="..."> <img
											src="http://placehold.it/150x100" alt="..."> <img
											src="http://placehold.it/150x100" alt="...">
									</div>
								</div>
							</div>
							<!-- END timeline item -->
							<div>
								<i class="far fa-clock bg-gray"></i>
							</div>
						</div>
					</div>
					<!-- /.tab-pane -->

					<div class="tab-pane" id="settings">
						<form class="form-horizontal">
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label">Name</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputName"
										placeholder="Name">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputEmail"
										placeholder="Email">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputName2" class="col-sm-2 col-form-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName2"
										placeholder="Name">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputExperience" class="col-sm-2 col-form-label">Experience</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="inputExperience"
										placeholder="Experience"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputSkills" class="col-sm-2 col-form-label">Skills</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputSkills"
										placeholder="Skills">
								</div>
							</div>
							<div class="form-group row">
								<div class="offset-sm-2 col-sm-10">
									<div class="checkbox">
										<label> <input type="checkbox"> I agree to the
											<a href="#">terms and conditions</a>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="offset-sm-2 col-sm-10">
									<button type="submit" class="btn btn-danger">Submit</button>
								</div>
							</div>
						</form>
					</div>
					<!-- /.tab-pane -->
				</div>
				<!-- /.tab-content -->
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.nav-tabs-custom -->
	</div>
	
</div>
<!-- /.content-wrapper -->


