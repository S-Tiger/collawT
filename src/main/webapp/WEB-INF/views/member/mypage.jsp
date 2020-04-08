<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="../resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
	href="../resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="../resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="../resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="../resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="../resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="../resources/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		if(${msg != null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			console.log("11");
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}else{
				alert("비밀번호가 수정되었습니다.");
			}
		}));
	});
</script>
</head>
<body class="login-page">
	<div class="login-box">
		<div class="card-body login-card-body">
			<div class="login-logo">
				<a href="javascript:window.history.back();"> <b>Collaw T</b></a>
			</div>
			<div class="card">
				<div class="card-body login-card-body">
					<b class="login-box-msg">My Page</b>
					<form id="myForm" action="/member/update_mypage" method="post">
						<p class="login-box-msg">
							<label>ID</label> <input class="form-control" type="email"
								id="mem_Id" name="mem_Id" readonly value="${member.mem_Id}">
						</p>
						<p class="login-box-msg">
							<label>이름</label> <input class="form-control" type="text"
								id="mem_Name" name="mem_Name" value="${member.mem_Name}"
								required>
						</p>
						<p class="login-box-msg">
							<button type="submit" class="btn btn-block btn-success">회원정보
								변경</button>
						</p>
					</form>
					<!-- 프로필사진변경 -->
					<form action="/member/saveImage" enctype="multipart/form-data"
						method="post">
						<input type="hidden" name="mem_Id" value="${member.mem_Id}">
						<input type="file" name="mem_File" /> <input type="submit"
							value="이미지저장" />
					</form>
					<!-- 프로필사진 -->
					<p>프로필 사진:</p>
					<div class="user-panel mt-3 pb-3 mb-3 d-flex">
						<div class="image">
							<c:if test="${member.mem_File != null }">
								<div class="profile">
									<img alt="프로필사진" width="50" height="50"
										src="/member/getByteImage?mem_Id=${member.mem_Id}" />
								</div>
							</c:if>
							<c:if test="${member.mem_File == null }">
								<img src="../resources/dist/img/user2-160x160.jpg"
									class="img-circle elevation-2" alt="User Image">
							</c:if>
						</div>
					</div>
						<form id="pwForm" action="/member/update_pw" method="post">
							<input type="hidden" name="mem_Id" value="${member.mem_Id}">
							<p class="login-box-msg">
								<label>기존비밀번호</label> <input class="form-control" id="old_pw"
									name="old_pw" type="password" required>
							</p>
							<p class="login-box-msg">
								<label>새로운 비밀번호</label> <input class="form-control" id="pw"
									name="mem_Pwd" type="password" required>
							</p>
							<p class="login-box-msg">
								<label>새로운 비밀번호 확인</label> <input class="form-control" id="pw2"
									type="password" type="password" required>
							</p>
							<div class="check_font" id="pw_check">hello</div>
							<p class="login-box-msg">
								<button type="submit" id="joinBtn"
									class="btn btn-block btn-success">비밀번호 변경</button>
								<button type="button" class="btn btn-block btn-success"
									onclick="location.href='/main'">뒤로가기</button>
							</p>
						</form>
						<p class="login-box-msg">
							<input type="button" id="outBtn"
								class="btn btn-block btn-success" value="회원탈퇴"
								onclick="location.href='/member/outMember'">

						</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>