<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
.form-group {
	margin-top: 20px;
}
</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script> -->
<script type="text/javascript">
	//캘린더 기능
	$(document).ready(function() {
		$('#reservationtime').daterangepicker({
			timePicker : true,
			timePickerIncrement : 30,
			locale : {
				format : 'MM/DD/YYYY hh:mm A'
			}
		})
	});
</script>

<script type="text/javascript">
	var arrInput = new Array(0);
	var arrInputValue = new Array(0);

	function addInput() {
		arrInput.push(arrInput.length);
		arrInputValue.push("");
		display();
	}
	function display() {
		document.getElementById('parah').innerHTML = "";
		for (intI = 0; intI < arrInput.length; intI++) {
			document.getElementById('parah').innerHTML += createInput(
					arrInput[intI], arrInputValue[intI]);
		}
	}

	function saveValue(intId, strValue) {
		arrInputValue[intId] = strValue;
	}

	function createInput(id, value) {
		var num = 3;
		return "<div class='row'>" + "<div class='col-sm-6'>"
				+ "<div class='form-group'>" + "<label>보기" + id + "</label>"
				+ "</div>" + "</div>" + "<div class='col-sm-6'>"
				+ "<div class='form-group'>" + "<input type='vd_Content'"
				+ "class='form-group' onChange='javascript:saveValue(" + id
				+ ",this.value)' value='" + "입력" + "'>" 
				+ "<input type='hidden'	name='vd_Num' value="+ num +">"
				+ "</div>" + "</div>"
				+ "</div>";
	}
	/*									<div class="row">
	 <div class="col-sm-6">
	 <!-- text input -->
	 <div class="form-group">
	 <label>보기2</label>
	 </div>
	 </div>
	 <div class="col-sm-6">
	 <div class="form-group">
	 <input type="text" name="vd_Content" class="form-control" placeholder="보기 vd_Content">
	 <input type ="hidden" name="vd_Num" value="2">	
	 </div>
	 </div>
	 </div>
	 */

	function deleteInput() {
		if (arrInput.length > 0) {
			arrInput.pop();
			arrInputValue.pop();
		}
		display();
	}
</script>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>투표</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">투표</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- left column -->
						<div class="col-md-6">
							<!-- general form elements -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">투표 리스트</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form role="form">
									<div class="card-body">
										<div class="row">
										<c:forEach var="voteList" items="${voteList}">
											<div class="col-sm-6">
												<!-- textarea -->
												<div class="form-group" style=" margin-top: 0px;">
													<label style="font-size: small">투표명: ${voteList.v_Content }</label>
													<p style="font-size: small;margin-bottom: 0px;">  ${member.mem_Name }</p>
													<p style="font-size: small;margin-bottom: 0px;">  ${voteList.mem_Id }</p>
													<p style="font-size: xx-small;margin-bottom: 0px;">${voteList.v_Start }</p>
													<p style="font-size: xx-small;margin-bottom: 0px;">${voteList.vd_Content }</p>
													<c:forEach var="votedList" items="${votedList}">
													<p> ${votedList.vd_Content }</p>
													</c:forEach>
												</div>
											</div>
										</c:forEach>
										</div>
									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Submit</button>

									</div>
								</form>
							</div>
							<!-- /.card -->


						</div>
						<!--/.col (left) -->
						<!-- right column -->
						<div class="col-md-6">
							<!-- general form elements disabled -->
							<div class="card card-warning">
								<div class="card-header">
									<h3 class="card-title">투표 만들기</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<form action="/vote/voteInsert" role="form">
										<div class="row">
											<div class="col-sm-6">
												<!-- text input -->
												<div class="form-group">
													<label>투표 번호</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" name="v_Num" class="form-control"
														placeholder="투표번호v_Num">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<!-- textarea -->
												<div class="form-group">
													<label>투표 설명</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<textarea name="v_Content" class="form-control" rows="3"
														maxlength="150" placeholder="설명을 입력해주세요 v_Content"></textarea>
												</div>
											</div>
										</div>
										<!-- input states -->
										<div class="form-group" style="border-top: 1px solid #ebebeb;">
											<div class="row">
												<div class="col-sm-6">
													<!-- text input -->
													<div class="form-group">
														<label>보기1</label>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<input type="text" name="vd_Content" class="form-control"
															placeholder="보기 vd_Content"> <input type="hidden"
															name="vd_Num" value="1">

													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-6">
													<!-- text input -->
													<div class="form-group">
														<label>보기2</label>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<input type="text" name="vd_Content" class="form-control"
															placeholder="보기 vd_Content"> <input type="hidden"
															name="vd_Num" value="2">
													</div>
												</div>
											</div>
											<div id="parah"></div>
											<div class="row">
												<div class="col-sm-6">
													<!-- text input -->
													<div class="form-group">
														<label>추가</label>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<input type="button" class="form-control" value="추가"
															onclick="addInput();">
													</div>
												</div>

											</div>
										</div>
										<!-- 투표옵션 -->
										<div class="form-group" style="border-top: 1px solid #ebebeb;">
											<div class="row">
												<div class="col-sm-6">
													<div class="form-group">
														<label style="margin-top: 20px;">투표 옵션</label>
													</div>
												</div>
												<div class="col-sm-6" style="margin-top: 20px;">
													<div class="form-group">
														<div class="custom-control custom-switch"
															style="float: left;">
															<input type="checkbox" class="custom-control-input"
																id="customSwitch1"> <label
																class="custom-control-label" for="customSwitch1">익명</label>
														</div>
													</div>
													<div class="form-group">
														<div class="custom-control custom-switch"
															style="float: left;">
															<input type="checkbox" class="custom-control-input"
																id="customSwitch3"> <label
																class="custom-control-label" for="customSwitch3">복수선택</label>
														</div>
													</div>
												</div>
											</div>
											<!-- Date and time range -->
											<div class="form-group">
												<label>마감 시각</label>

												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="far fa-clock"></i></span>
													</div>
													<input type="text" class="form-control float-right"
														id="reservationtime">
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
											<button type="submit" id="joinBtn"
												class="btn btn-primary btn-block" style="float: right">투표
												만들기</button>
											<!-- 투표옵션 끝 -->
									</form>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
							<!-- general form elements disabled -->
						</div>
						<!--/.col (right) -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="../../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<script
		src="../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>