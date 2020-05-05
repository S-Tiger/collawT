<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>협업툴 Collaw T - 간단하고 쉬운협업</title>

<!-- Bootstrap core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="../resources/css/agency.min.css" rel="stylesheet">

</head>
<style>
.header {
	position: relative;
	height: 200px;
	background-color: #ffccec;
} /* contents */
.section-01, .section-02, .section-03 {
	position: relative;
	height: 600px;
}

.section-01 {
	background-color: blue;
}

.section-02 {
	background-color: green;
}

.section-03 {
	background-color: red;
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
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Collaw T</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">제품 설명</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="/question">문의하기</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="/member/signup">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-lead-in">콜라우티에 오신것을 환영합니다!</div>
				<div class="intro-heading text-uppercase">온라인으로 함께 만드는 협업</div>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="member/loginPage">로그인</a>
			</div>
		</div>
	</header>


	

	<!-- Portfolio Modals -->
	
	<div id="contents">
		<div class="floating-menu">
		
		</div>
		<div class="section-01 scroll">
			<h2>제품 설명</h2>
		</div>
		<div class="section-02 scroll">
			<h2> 문의하기</h2>
		</div>
		<div class="section-03 scroll">
			<h2> ㅇ</h2>
		</div>
	</div>

<!-- Footer -->
	<footer class="footer">
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
	<script src="../resources/vendor/jquery/jquery.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact form JavaScript -->
	<script src="../resources/js/jqBootstrapValidation.js"></script>
	<script src="../resources/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="../resources/js/agency.min.js"></script>

</body>

</html>
