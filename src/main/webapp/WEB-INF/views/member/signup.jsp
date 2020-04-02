<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>콜라우티 회원가입</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="../resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript">
  $(function(){
	  
 		$("#joinForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}
		});
 		
 /* function fn_idCheck(){
		var mem_id = $("#mem_id").val();
		alert(mem_id);
			$.ajax({
				url : "http://localhost:9090/member/check_id",
				type : "POST",
				data : {
					mem_id : mem_id
				},
				success : function(data) {
					if (data == 1) {
						$("#id_check").text("중복된 아이디가 있습니다.");
						$("#joinBtn").prop("disabled", "disabled");
					} else {
						$("#id_check").text("");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		}); */
 
	});
</script>
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="../resources/index2.html"><b>Collaw</b>T</a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">회원가입</p>

      <form action="/member/join" method="post" id="joinForm">
        <div class="input-group mb-3">
          <input type="text" name="mem_Name" class="form-control" placeholder="이름">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" name="mem_Id" id="mem_Id" class="form-control" placeholder="아이디 입력 이메일 형식">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
             </div>
          </div>
        </div>
        <input type="button" id="checkBtn" onClick="fn_idCheck()" value="중복체크하기">
        <!-- 아이디 중복값  -->
          <span class="check_font" id="id_check"></span>
        <div class="input-group mb-3">
          <input type="password" id="pw" name="mem_Pwd" class="form-control" placeholder="비밀번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" id="pw2" class="form-control" placeholder="비밀번호 확인">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
              회원가입 <a href="#">동의</a>
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" id="joinBtn" class="btn btn-primary btn-block" >회원가입</button>
            <button onclick="history.go(-1);" class="btn btn-primary btn-block" >취소</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <div class="social-auth-links text-center">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i>
      	페이스북 로그인
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i>
          구글로그인
        </a>
      </div>

      <a href="../login.html" class="text-center">이미 회원가입을 하셨나요?</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="../resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../resources/dist/js/adminlte.min.js"></script>
</body>
</html>
