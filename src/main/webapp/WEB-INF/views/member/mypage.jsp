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
	function ResizeImage() {
		console.log("dddd");
		var filesToUpload = document.getElementById('mem_File').files;
		var file = filesToUpload[3];

		// 문서내에 img 객체를 생성합니다
		var img = document.createElement("img");

		// 파일을 읽을 수 있는 File Reader 를 생성합니다
		var reader = new FileReader();

		// 파일이 읽혀지면 아래 함수가 실행됩니다
		reader.onload = function(e) {
			img.src = e.target.result;

			// HTML5 canvas 객체를 생성합니다
			var canvas = document.createElement("canvas");
			var ctx = canvas.getContext("2d");
			console.log(canvas);
			console.log(ctx);
			// 캔버스에 업로드된 이미지를 그려줍니다
			ctx.drawImage(img, 400, 500);
 			
			// 최대폭을 100 으로 정했다고 가정했을때
			// 최대폭을 넘어가는 경우 canvas 크기를 변경해 줍니다.
			var MAX_WIDTH = 100;
			var MAX_HEIGHT = 100;
			var width = img.width;
			var height = img.height;

			if (width > height) {
				if (width > MAX_WIDTH) {
					height *= MAX_WIDTH / width;
					width = MAX_WIDTH;
				}
			} else {
				if (height > MAX_HEIGHT) {
					width *= MAX_HEIGHT / height;
					height = MAX_HEIGHT;
				}
			}
			canvas.width = width;
			canvas.height = height;

			// canvas에 변경된 크기의 이미지를 다시 그려줍니다.
			var ctx = canvas.getContext("2d");
			ctx.drawImage(img, 0, 0, width, height);

			// canvas 에 있는 이미지를 img 태그로 넣어줍니다
			var dataurl = canvas.toDataURL("image/png");
			document.getElementById('output').src = dataurl;
		}
		
		reader.readAsDataURL(file);

	}	
	
	
	
	
</script>
</head>
<body class="sidebar-mini layout-fixed accent-teal sidebar-collapse"
	style="height: auto;">
	<!-- <div class="content-wrapper" style="min-height: 709px;"> -->
	<div style="margin-top: 50px">
		<input id="imageFile" type="file"
			accept="image/gif, image/jpeg, image/png">
	</div>
	<div style="margin-top: 50px">
		<input type="button" value="Resize Image" onclick="ResizeImage()" />
	</div>



	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<div class="col-sm-6"></div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<div class="row">
		<div class="col-md-6"></div>
		<div class="card">
			<div class="card-body login-card-body">
				<b class="login-box-msg">My Page</b>
				<div class="card-body">
					<div class="card">
						<form id="myForm" action="/member/update_mypage" method="post">
							<div class="card card-widget">
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
									<button type="submit" class="btn btn-success float-right">회원정보
										변경</button>
								</p>
							</div>
						</form>
					</div>
				</div>
				<!-- 프로필사진변경 -->
				<section class="card-footer">
					<div class="card">
						<!-- 프로필사진 -->
						<p class="login-box-msg">
							<label>프로필사진</label>
						</p>
						<div style="margin-top: 50px">
						<!-- 이미지 표시됨 -->
							<img src="" id="output">
						</div>
						<div class="user-panel mt-3 pb-3 mb-3 d-flex">
							<div class="image">
								<c:if test="${member.mem_File != null }">
									<div class="profile">
										<img alt="User Image" class="img-circle elevation-2"
											src="/member/getByteImage?mem_Id=${member.mem_Id}" />
									</div>
								</c:if>
								<c:if test="${member.mem_File == null }">
									<img src="../resources/dist/img/user2-160x160.jpg"
										class="img-circle elevation-2" alt="User Image">
								</c:if>
								<form action="/member/saveImage" enctype="multipart/form-data"
									method="post">
									<input type="hidden" name="mem_Id" value="${member.mem_Id}">
									<input type="file" name="mem_File" id="mem_File"
										class="btn btn-success float-right"
										accept="image/gif, image/jpeg, image/png" /><br> <br>
									<input type="submit" class="btn btn-success float-right"
										value="이미지저장" />
								</form>
							</div>
						</div>
					</div>
				</section>
				<section class="card-body">
					<div class="card">
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
							<div class="check_font" id="pw_check"></div>
							<p class="login-box-msg">
								<button type="submit" id="joinBtn"
									class="btn btn-success float-right">비밀번호 변경</button>
								<br>
								<br>
								<button type="button" class="btn btn-success float-right"
									onclick="location.href='/main'">뒤로가기</button>
								<br>
							</p>
							<br>
						</form>
					</div>
				</section>
				<section class="card-body">
					<div class="card">
						<br>
						<p class="login-box-msg">
							<input type="button" id="outBtn"
								class="btn btn-success float-right" value="회원탈퇴"
								onclick="location.href='/member/outMember'">
						</p>
					</div>
				</section>
				<!-- </div> -->
				<!-- card body -->
			</div>
		</div>
	</div>
</body>
</html>