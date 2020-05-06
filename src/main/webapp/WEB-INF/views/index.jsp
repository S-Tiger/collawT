<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>협업툴 Collaw T - 간단하고 쉬운협업</title>

<!-- Bootstrap core CSS -->
<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="${contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="${contextPath}/resources/css/agency.min.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/modal/dist/needpopup.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${contextPath}/resources/modal/dist/needpopup.min.js"></script>


<title>협업툴 Collaw T - 간단하고 쉬운협업</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<style>
.header {
	position: relative;
	height: 200px;
} /* contents */
.section-01, .section-02, .section-03 {
	position: relative;
	height: 600px;
}

.section-01 {
	background-color: white;
}

.section-02 {
	background-color: white;
}

.section-03 {
	background-color: white;
} /* floating menu */
.floating-menu {
	position: fixed;
	right: 50px;
	top: 50%;
	z-index: 100;
	width: 128px;
	margin: -220px 0 0 0;
	background-color: #d4cecf;; /*background: url("") 0 0 no-repeat;*/
}

.floating-menu li {
	margin: 0;
	*float: left;
}

.floating-menu a {
	display: block;
	width: 123px;
	padding: 10px 0;
	color: #fff;
	text-align: center;
	border: 1px solid #464646;
	text-decoration: none;
}

.floating-menu a.menu-04 {
	height: 20px;
	background: none;
}

.floating-menu li.on a {
	background-color: #333;
	color: #fff; /*background: url("") 0 0 no-repeat;*/
}

.floating-menu li.on a.menu-01 { /* background-position: -131px 0;*/
	
}

.floating-menu li.on a.menu-02 {
	/* background-position: -131px -104px;*/
	
}

.floating-menu li.on a.menu-03 { /*background-position: -131px -219px;*/
	
}

.footer {
	height: 100px;
	background-color: #707070;
}

header.masthead {
	text-align: center;
	color: black;
	background-color: white;
	background-image: url(../img/header-bg.jpg);
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-position: center center;
	background-size: cover;
	text-shadow: 0 0 black;
	background-repeat: no-repeat;
}

.card-body {
	/* 		overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 300px;
            height: 300px; */
	
}

.header.masthead {
	text-align: center;
	color: #fff;
	background-color: white;
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-position: center center;
	background-size: cover;
	background-color: white;
}

header.masthead .intro-text {
	padding-top: 150px;
	padding-bottom: 100px
}

header.masthead .intro-text .intro-lead-in {
	font-size: 22px;
	font-style: italic;
	line-height: 22px;
	margin-bottom: 25px;
	font-family: 'Droid Serif', -apple-system, BlinkMacSystemFont,
		'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif,
		'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol',
		'Noto Color Emoji'
}

header.masthead .intro-text .intro-heading {
	font-size: 50px;
	font-weight: 700;
	line-height: 50px;
	margin-bottom: 25px;
	font-family: Montserrat, -apple-system, BlinkMacSystemFont, 'Segoe UI',
		Roboto, 'Helvetica Neue', Arial, sans-serif, 'Apple Color Emoji',
		'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'
}

img {
	max-width: 100%;
	height: auto !important;
}

ul, li {
	list-style: none;
}

.slide {
	height: 300px;
	overflow: hidden;
	position: relative;
}

.slide ul {
	width: calc(100% * 4);
	display: flex;
	transition: 1s;
}

.slide li {
	width: calc(100%/ 4);
	height: 300px;
}

.slide li:nth-child(1) {
	background: #ffa;
}

.slide li:nth-child(2) {
	background: #faa;
}

.slide li:nth-child(3) {
	background: #afa;
}

.slide li:nth-child(4) {
	background: #aaf;
}

.slide input {
	display: none;
}

.slide .bullet {
	position: absolute;
	bottom: 20px;
	left: 0;
	right: 0;
	text-align: center;
	z-index: 10;
}

.slide .bullet label {
	width: 10px;
	height: 10px;
	border-radius: 10px;
	border: 2px solid #666;
	display: inline-block;
	background: #fff;
	font-size: 0;
	transition: 0.5s;
	cursor: pointer;
}
/* 슬라이드 조작 */
#pos1:checked ~ ul {
	margin-left: 0;
}

#pos2:checked ~ ul {
	margin-left: -100%;
}

#pos3:checked ~ ul {
	margin-left: -200%;
}

#pos4:checked ~ ul {
	margin-left: -300%;
}
/* bullet 조작 */
#pos1:checked ~ .bullet label:nth-child(1), #pos2:checked ~ .bullet label:nth-child(2),
	#pos3:checked ~ .bullet label:nth-child(3), #pos4:checked ~ .bullet label:nth-child(4)
	{
	background: #666;
}
</style>
<script type="text/javascript">
	console.log('${question}');
	var result = '${question}';
	if (result == 'question') {
		alert('문의 주셔서 감사합니다.');
<%session.removeAttribute("question");%>
	}

</script>
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background: white">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Collaw T</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services" style="color: black">제품 설명</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#question" style="color: black">고객 지원</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="/member/signup" style="color: black">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="masthead">
		<div class="container">
		<br><br><br>
			<!-- <div class="intro-text">
				<div class="intro-lead-in">콜라우티에 오신것을 환영합니다!</div>
				<div class="intro-heading text-uppercase">온라인으로 함께 만드는 협업</div>
				
			</div> -->
		</div>
	</header>


	<!-- 제품문의 -->
	<header class="masthead">
		<div class="container">
			<div class="row" id="services">
				<div class="col-md-6">
					<div class="card-body" style="border-color: white !important;">
						<h1>:D</h1>
						<h1 style="text-align: left;">효과적인 팀워크 가벼워진 업무, 협업툴</h1>
						<h4 style="text-align: left;">이메일이 필요없는 간편한 소통과 파일 공유, 빠른 피드백 확인까지. 바라던 기능들을 모두 담았습니다.</h4>
						<p style="text-align: left;">여러분이 더 협력적으로 일하고 더 많은 일을 할 수 있도록 협업 게시판, 목록, 칸반, 검색기능을 통해 여러분의 재미있고 유연하며 보람 있는 방법으로 프로젝트를 정리하고 우선순위를 정할 수 있는 Collaw T</p>
						<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger float-right" style="background-color: #fed136;font-size: large ; border-color: #fed136; padding-top: 13px; padding-bottom: 13px; padding-left: 20px; padding-right: 20px;" href="member/loginPage">로그인</a>
					</div>
				</div>
				<!-- /.col (LEFT) -->
				<div class="col-md-6">
					<!-- LINE CHART -->
					<div class="card-body" style="border-color: white !important;">
						<img src="../resources/img/teamproject.png" style="width: 544px; height: 326px;">
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col (RIGHT) -->
			</div>
			<!-- /.row -->

		</div>
	</header>

	<header class="masthead">
		<div class="container">
			<div class="row" id="services">
				<div class="col-md-6">
					<div class="card-body" style="border-color: white !important; ">
						<h4 style="text-align: left;">안녕하세요. 콜라우티 고객지원입니다. 무엇을 도와드릴까요?</h4>
					</div>
				</div>
				<!-- /.col (LEFT) -->
				<div class="col-md-6">
					<!-- LINE CHART -->
					<div class="card-body" style="border-color: white !important;">
						<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" style=" font-size: large ;background-color: #fed136; border-color: #fed136; padding-top: 13px; padding-bottom: 13px; padding-left: 20px; padding-right: 20px;" href="/question">
						고객지원 바로가기
						</a>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col (RIGHT) -->
			</div>
			<!-- /.row -->

		</div>
	</header>

	<!-- Header -->
	<header class="masthead" id="question">
		<div class="container">
			<div class="row" id="services">
				<div class="col-md-12">

					<div class="slide">
						<input type="radio" name="pos" id="pos1" checked> <input type="radio" name="pos" id="pos2"> <input type="radio" name="pos" id="pos3"> <input type="radio" name="pos" id="pos4">
						<ul>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
						<p class="bullet">
							<label for="pos1">1</label> <label for="pos2">2</label> <label for="pos3">3</label> <label for="pos4">4</label>
						</p>
					</div>
				</div>
				<!-- /.col (LEFT) -->

			</div>
			<!-- /.row -->

		</div>
	</header>

	<!-- Footer -->
	<footer class="footer" style="background-color: white">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; Collaw T</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li class="list-inline-item"><a href="#"> <i class="fab fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i class="fab fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i class="fab fa-linkedin-in"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="list-inline quicklinks">
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>



	<!-- Bootstrap core JavaScript -->
	<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="${contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact form JavaScript -->
	<script src="${contextPath}/resources/js/jqBootstrapValidation.js"></script>
	<script src="${contextPath}/resources/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="${contextPath}/resources/js/agency.min.js"></script>

</body>

</html>
