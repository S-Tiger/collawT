<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="../includes/header.jsp"%>
<style>
@font-face {
	font-family: 'Recipekorea';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

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

	//버튼으로 삭제하기 위한 j쿼리
	/*    $(document).ready(function () {
	     $("button[name=delete]").click(function() {
	   	  var c_Id = $(this).attr('value');
	   	  var $form = $('<form></form>');
	   	  $form.attr({ action: "/project/delete" method: "post" });
	   	  $form.appendTo('body');
	   	  var info=<'input type="hidden" value='+ c_Id + 'name="c_Id">'; 
		$form.append(info);
	       $form.submit();

	     }) });  
	 */
</script>
<!-- 모달 팝업 내용 -->
<div id='small-popup' class="needpopup">
	<a href="#"></a>
	<p>
	<form id="projectupdate" action="/project/update" method="post">
		<p class="login-box-msg" style="padding-bottom: 10px">
			<input type="hidden" id="c_Id" name="c_Id" value="${pjt.c_Id}">
			<label>이름</label> <input class="form-control" type="text" id="c_Name"
				name="c_Name" required value="${pjt.c_Name}">
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label>설명</label>
			<textarea class="form-control" rows="3" id="c_Comment"
				name="c_Comment" required>${pjt.c_Comment}</textarea>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label>관리자</label><br> <select name="mem_Id">
				<option value="${pjt.mem_Id}">${pjt.mem_Id}</option>
				<option value="학생">학생</option>
				<option value="회사원">회사원</option>
				<option value="기타">기타</option>
			</select>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label>카테고리</label><br> <select name="c_Category">
				<option value="${pjt.c_Category}">${pjt.c_Category}</option>
				<option value="0">협업업무관련</option>
				<option value="1">개인업무관련</option>
				<option value="2">학업과제관련</option>
			</select>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<button type="submit" class="btn btn-block btn-success" >정보변경</button>
		</p>
		<br>
	</form>
	<p>
	<form id="projectdelete" action="/project/delete" method="post">
	<input type="hidden" id="c_Id" name="c_Id" value="${pjt.c_Id}">
		<button type="submit" class="btn btn-block btn-success" >협업공간삭제</button></form>
	</p>
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
							style="font-family: Recipekorea; max-width: 80%; float: left;">
							&nbsp;${pjt.c_Name}</h1>
						<a href="#" data-needpopup-show="#small-popup" class="nav-link"
							style="width: 31px; color: black;"><i
							class="nav-icon fas fa-cogs" style="padding-left: 10px;"> </i></a>
					</div>
					<p class="breadcrumb float-sm-left">&nbsp; ${pjt.c_Comment}</p>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/main">Home</a></li>
						<li class="breadcrumb-item active">Dashboard v1</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

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
<!-- /.content-wrapper -->

<%@include file="../includes/footer.jsp"%>

