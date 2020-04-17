<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>
<style type="text/css">
#holder {
	overflow: hidden;
	height: auto;
}
.filebox label {
  display: inline-block;
  padding: .375rem .75rem;
  color: #fff;
  line-height: normal;
  vertical-align: middle;
  background-color: #28a745;
  cursor: pointer;
  border: 1px solid #4cae4c;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
 
}

.filebox label:hover {
  background-color: #6ed36e;
}

.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"] {
  position: absolute;
  padding: 0;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
.user-img {
	margin: 0 auto;
	width: 100px;
	height: 95px;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
if ('${msg}' == 'success') {
	alert(" 회원정보 변경 되었습니다.");
	console.log("after:" + '${msg}');
}else if(result != null){
	console.log("dd");
}
$(function(){
/* 	if(${msg != null}){
		alert('${msg}');
	}; */
	
	//비밀번호같지 확인하는 자바스크립트 (서브밋할때 작동됨)
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
	
	//파일 비어잇는거 못들어가게함 서브밋 탈때 작동됨
	if($("#fileupload").submit(function(){
		console.log("fileUpload");
		 var fileCheck = $("#imageFile").val();
		 if(!fileCheck){
		        alert("프로필 사진을 첨부해 주세요");
		   return false;
		 }else{
			 alert("프로필사진이 변경 되었습니다.");
		 }
	}));

}); 
	
	
	function fn_deleteMem(){
		if(!confirm("정말탈퇴 하시겠습니까?")){
			return false;
		}
	};
</script>
<!-- Site wrapper -->
<div class="wrapper">
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>개인정보 수정</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="/main">Home</a></li>
							<li class="breadcrumb-item active">개인정보 수정</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-6">
					<div class="card card-secondary">
						<div class="card-header">
							<h3 class="card-title">이름</h3>
							<!-- 이름바꾸는 폼  -->
							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse" data-toggle="tooltip"
									title="Collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="card-body">
							<div class="form-group">
								<form class="form-horizontal" action="/member/update_mypage"
									method="post">
									<label for="inputEstimatedBudget">ID</label> <input
										class="form-control" type="email" id="mem_Id" name="mem_Id"
										readonly value="${member.mem_Id}">
							</div>
							<div class="form-group">

								<label for="inputSpentBudget">이름</label> <input
									class="form-control" type="text" id="mem_Name" name="mem_Name"
									value="${member.mem_Name}" required>
							</div>
							<div class="form-group">
								<label for="inputEstimatedDuration"></label> <input
									type="hidden" id="inputEstimatedDuration" class="form-control">
							</div>
							<div class="row">
								<div class="col-12">
									<input type="submit" value="이름변경"
										class="btn btn-success float-right">
									</form>
									<!--이름바꾸는 폼 끝  -->
									<%-- <p>result: ${result }</p>
									<p>member: ${member}</p>
									<img src="${member.mem_File }"
										class="user-img img-fluid img-circle"> --%>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!--프로필사진 변경 -->
				<div class="col-md-6">
					<div class="card card-secondary">
						<div class="card-header">
							<h3 class="card-title">프로필사진</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse" data-toggle="tooltip"
									title="Collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>

						</div>
						<div class="card-body">
							<div id="left" style="padding: 10px; margin-right: 10px;">
								<div class="card card-primary card-outline">
									<div class="card-body box-profile">
										<!-- 변경된이미지 -->
										<div id="holder" class="user-img img-fluid img-circle">
											<!-- 아이디 있으면.. -->
											
											<c:if test="${member.mem_File != null }">
												<img src="/member/getByteImage?mem_Id=${member.mem_Id}"
													class="user-img img-fluid img-circle" alt="User Image" />
											</c:if>

											<c:if test="${member.mem_File == null }">
												<img src="../resources/dist/img/profile.jpg"
													class="user-img img-fluid img-circle" alt="User Image">
											</c:if>
										</div>
										<h3 class="profile-username text-center">${member.mem_Name}</h3>
										<p class="text-muted text-center">${member.mem_Id}</p>
									</div>
									<!-- /.card-body -->
								</div>
							</div>
							<form action="/member/saveImage" id="fileupload"
								enctype="multipart/form-data" method="post"
								class="form-horizontal">
								<input type="hidden" name="mem_Id" value="${member.mem_Id}">
							<div class="row">
							<div class="col-12" style="padding: 5px;">	
								<div class="filebox">
									<label for="imageFile" style="font-weight:400; height:38px" class="btn btn-success float-right" >프로필 사진 선택</label>
									<input type="file"  name="mem_File"
										id="imageFile" accept="image/gif, image/jpeg, image/png" />
								</div>
							</div>	
							</div>
								<div class="row">
									<div class="col-12" style="padding: 5px;">
										<input type="submit" value="프로필 사진 변경"
											class="btn btn-success float-right">
									</div>
								</div>
							</form>
						</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->
	</div>
	<div class="col-md-6">
		<div class="card card-secondary">
			<div class="card-header">
				<h3 class="card-title">비밀번호 변경</h3>

				<div class="card-tools">
					<button type="button" class="btn btn-tool"
						data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
						<i class="fas fa-minus"></i>
					</button>
				</div>
			</div>
			<!-- 비밀번호 변경 -->
			<div class="card-body">
				<div class="form-group">
					<form id="pwForm" action="/member/update_pw" method="post">
						<input type="hidden" name="mem_Id" value="${member.mem_Id}">
						<label for="inputEstimatedBudget">현재 비밀번호</label> <input
							class="form-control" id="old_pw" name="old_pw" type="password"
							required>
				</div>
				<div class="form-group">
					<label for="inputSpentBudget">새로운 비밀번호</label> <input
						class="form-control" id="pw" name="mem_Pwd" type="password"
						required>
				</div>
				<div class="form-group">
					<label for="inputEstimatedDuration">새로운 비밀번호 확인</label> <input
						class="form-control" id="pw2" type="password" type="password"
						required>
				</div>
				<div class="row">
					<div class="col-12">
						<input type="submit" value="비밀번호 변경"
							class="btn btn-success float-right">
					</div>
				</div>
				</form>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
	<!--  회원탈퇴 변경 -->
	<div class="col-md-6">
		<div class="card card card-secondary collapsed-card">
			<div class="card-header">
				<h3 class="card-title">회원탈퇴</h3>

				<div class="card-tools">
					<button type="button" class="btn btn-tool"
						data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
						<i class="fas fa-plus"></i>
					</button>
				</div>
			</div>
			<div class="card-body">
				<div class="form-group">
					<form id="outMemberForm" action="/member/delete_Member"
						method="post">
						<input type="hidden" name="mem_Id" value="${member.mem_Id}" />
						<p class="login-box-msg">이용해주셔서 감사합니다.</p>
						<label for="inputEstimatedBudget">현재 비밀번호</label> 
						<input class="form-control" id="pwd" name="mem_Pwd" type="password" required>
				</div>
				<div class="row">
					<div class="col-12">
						<input type="submit" value="회원탈퇴"
							class="btn btn-success float-right" onclick="fn_deleteMem()" />
					</div>
				</div>
				<!-- 변경폼 -->

				</form>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
</div>

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

<script type="text/javascript">
	var upload = document.getElementsByTagName('input')[6];
	var holder = document.getElementById('holder');
	var state = document.getElementById('status');
	upload.onchange = function(e) {
		e.preventDefault();

		var file = upload.files[0], reader = new FileReader();

		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;

			img.width = 100;
			img.height = 95;
			
			holder.innerHTML = '';
			holder.appendChild(img);
			holder.width = 100;
			holder.height = 95;

		};
		reader.readAsDataURL(file);
		return false;

	};

	</script>
<%@include file="../includes/footer.jsp"%>