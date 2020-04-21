<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="register-box">
	<div class="register-logo">
		<a href="/"><b>Collaw</b>T</a>
	</div>
	<div class="card">
		<div class="card-body register-card-body">
			<p class="login-box-msg">회원가입</p>

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
			<!-- Main content -->
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
									<form role="form">
										<div class="row">
											<div class="col-sm-6">
												<!-- text input -->
												<div class="form-group">
													<label>투표 제목</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Enter ...">
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
													<textarea class="form-control" rows="3"
														placeholder="Enter ..."></textarea>
												</div>
											</div>
										</div>
										<!-- input states -->
										<div class="form-group" style="border-top: 1px solid #ebebeb;">
											<div class="row">
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
											</div>
											<div class="row">
												<div class="col-sm-6">
													<!-- text input -->
													<div class="form-group">
														<label>보기 2</label>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<input type="text" class="form-control"
															placeholder="Enter ...">
													</div>
												</div>
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
														<input type="text" class="form-control" placeholder="+">
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

		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.card -->
</div>
<!-- /.register-box -->
<!-- jQuery -->
<script src="../resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
