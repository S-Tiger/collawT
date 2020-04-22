<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
			document.getElementById('parah').innerHTML += createInput(arrInput[intI], arrInputValue[intI]);
		}
	}

	function saveValue(intId, strValue) {
		arrInputValue[intId] = strValue;
	}

	function createInput(id, value) {
		return  "<div class='row'>" +
					"<div class='col-sm-6'>" +
						"<div class='form-group'>" +
							"<label>보기"+ id +"</label>" +
						"</div>" + 
					"</div>" +
					"<div class='col-sm-6'>" +
						"<div class='form-group'>" +
							"<input type='vd_Content'" +
							"class='form-group' onChange='javascript:saveValue(" + id + ",this.value)' value='" + "입력" + "'>" +
						"</div>"+
					"</div>"+
				"</div>";
	}
/*<div class="row">
	<div class="col-sm-6">
		<!-- text input -->
		<div class="form-group">
			<label>보기 1</label>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="form-group">
			<input type="text" class="form-control"
				placeholder="Enter ...">
		</div>
	</div>
</div> */
	
	function deleteInput() {
		if (arrInput.length > 0) {
			arrInput.pop();
			arrInputValue.pop();
		}
		display();
	}
</script>

<body>
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
							<li class="breadcrumb-item active">투표 만들기</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid" align="center">
				<div class="row">
					<!-- left column -->
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
												<textarea name="v_Content" class="form-control" rows="3" maxlength="150"
													placeholder="설명을 입력해주세요 v_Content"></textarea>
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
													placeholder="보기 vd_Content">
												<input type="hidden" name="vd_Num" value="1">	
											
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
													placeholder="보기 vd_Content">
												<input type ="hidden" name="vd_Num" value="2">	
											</div>
										</div>
									</div>
										<div id="parah">
										</div>
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
</body>
</html>