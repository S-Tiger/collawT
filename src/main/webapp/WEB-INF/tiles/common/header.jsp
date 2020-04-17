<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<style type="text/css">
.user-panel img {
     height: 40px;
     width: 40px;
}


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

#applyspan {
	background-clip: padding-box;
    border: 1px solid #17a2b8;
    padding: 2px;
    margin: 2px;
    display: inline-block;
}
#applydelete {
	margin: 2px;
}


</style>

<script type="text/javascript">


	window.onload = function() {
		var getmenu = getCookie('menu');
		var menuId = document.getElementById('menustat');
		if (getmenu != null) {
			menuId.className = getmenu;
		}
		//쿠키생성
		var getmenu = getCookie('apply');
		var menuId1 = document.getElementById('activity');
		var menuId2 = document.getElementById('timeline');
		var menuId3 = document.getElementById('activityMenu');
		var menuId4 = document.getElementById('timelineMenu');
		//var applysub = applymenus.siblings();
		if (getmenu != null) {
			menuId1.className = 'tab-pane';
			menuId2.className = 'tab-pane active';
			menuId3.className = 'nav-link';
			menuId4.className = 'nav-link active';
			deleteCookie('apply');
		}
	};
	function menuclick() {
		deleteCookie('menu');
		var stat = document.getElementById('menustat').className;
		if (stat == 'nav-item has-treeview menu-open') {
			setCookie('menu', 'nav-item has-treeview', 1);
		} else if (stat == 'nav-item has-treeview') {
			setCookie('menu', 'nav-item has-treeview menu-open', 1);
		}
		console.log(getCookie('menu'));
	}
	function setCookie(name, value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
		document.cookie = name + '=' + value + ';expires=' + date.toUTCString()
				+ ';path=/';
	}
	//쿠키가져오기
	function getCookie(name) {
		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value ? value[2] : null;
	}
	//쿠키삭제
	var deleteCookie = function(name) {
		var date = new Date();
		document.cookie = name + "= " + "; expires=" + date.toUTCString()
				+ "; path=/";
	}
</script>



<script type="text/javascript">

/*  $(function(){
	

	$('#test00').click(function(){
		console.log("ddd");
		$.ajax({
			url:'/notify/update',
			dataType : 'Json'
			type:'get',
			success: function() {
		console.log(ee)
		},
			error: function(){
				console.log()
					alert("erorr");
				}
		});
		})
	}); */   
  $(function(){
		
	/*   $('#test00').click(function(){
			console.log("ddd");
			$.ajax({
				url:'${contextPath}/notify/update',
				dataType : 'Json',
				type:'get',
				success: function() {
			console.log(ee)
			},
				error: function(){
					console.log()
						alert("erorr");
					}
			});
			}) */
		$('#test00').ready(function(){
			console.log("ddd");
			$.ajax({
				url:'${contextPath}/notify/view',
				
				type:'get',
				success: function(data) {
			
			$('#test01').text(data);
			console.log(data)
			$('#test00').text(data);
			},
				error: function(){
					console.log()
						alert("erorr");
					}
			});
			})
		}); 
</script>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<link rel="stylesheet" href="${contextPath}/resources/modal/dist/needpopup.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${contextPath}/resources/modal/dist/needpopup.min.js"></script>


<title>협업툴 Collaw T - 간단하고 쉬운협업</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="${contextPath}/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>

<body class="sidebar-mini layout-fixed accent-teal">
	<div class="wrapper" id="start">

		<!-- Navbar -->
		 <nav class="main-header navbar navbar-expand navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="/main" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${contextPath}/resources/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${contextPath}/resources/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${contextPath}/resources/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider">
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge" id ="test00"></span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header" >15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="/notify/update" class="dropdown-item"> <i
							class="fas fa-envelope mr-2" id = "test01"></i> <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
	<!-- /.navbar -->

	<!-- Main Sidebar Container -->
	<aside class="main-sidebar elevation-4 sidebar-dark-danger">
		<!-- Brand Logo -->
		<a href="/main" class="brand-link navbar-danger"> <img
			src="${contextPath}/resources/dist/img/logocollawT.png" alt="AdminLTE Logo"
			class="brand-image img-circle elevation-3" style="opacity: .8">
			<span class="brand-text font-weight-light">Collaw T</span>
		</a>

		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex" >
				<span class="image" style="padding-left: .6rem;">
					<c:if test="${member.mem_File != null }">
						<div class="profile">
							<img alt="User Image" style="width:40px; height:40px" class="img-circle elevation-2"
								src="/member/getByteImage?mem_Id=${member.mem_Id}" />&nbsp;&nbsp;
						</div>
					</c:if>
					
					<c:if test="${member.mem_File == null }">
							<img src="${contextPath}/resources/dist/img/user2-160x160.jpg" style="width:40px; height:40px"
								class="img-circle elevation-2" alt="User Image">
					</c:if>
				</span>
				
					<span class="info" style="width: 170px;">
						<a href="/member/mypage"  style="padding: 0px; margin-right: 0px;">${member.mem_Name} </a>
						<a href="/logout"  style="padding: 0px; margin-top: 3; float:right;"><i class="fas fa-sign-out-alt"></i></a>
					</span>	
			</div>

			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
					<li class="nav-item has-treeview" id="menustat"
						style="border-bottom: 1px solid #4f5962;"><a href="#"
						class="nav-link active" onclick="menuclick()"> <i
							class="nav-icon far fa-handshake"></i>
							<p>
								등록된 협업공간 <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="/issue/list" class="nav-link">
									<i class="nav-icon fas fa-user-secret"></i>
									<p>프라이빗 공간</p>
							</a></li>
							<c:forEach var="coworklist" items="${coworklist}">
								<li class="nav-item"><a
									href="/project/main?c_Id=${coworklist.c_Id}" class="nav-link">
										<i class="nav-icon fas fa-sitemap"></i>
										<p>${coworklist.c_Name}</p>
								</a></li>
							</c:forEach>
							<li class="nav-item"><a href="/#" data-needpopup-show="#createpjt-popup"
								class="nav-link"> <i class="nav-icon fas fa-folder-plus"></i>
									<p>협업공간 생성</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="/news/list"
						class="nav-link"> <i class="nav-icon fas fa-book-open"></i>
							<p>
								새로운 소식 <span class="badge badge-info right">3</span>
								<!--  <span class="right badge badge-danger">New</span>-->
							</p>
					</a></li>
					<li class="nav-item"><a href="/news/list"
						class="nav-link"> <i class="nav-icon fas fa-bookmark"></i>
							<p>
								북마크 <span class="badge badge-info right"></span>
								<!--  <span class="right badge badge-danger">New</span>-->
							</p>
					</a></li>
					
					<li class="nav-item"><a href="/calendar/list"
						class="nav-link"> <i class="nav-icon fas fa-calendar-check"></i>
							<p>
								전체 캘린더 <span class="badge badge-info right"></span>
								<!--  <span class="right badge badge-danger">New</span>-->
							</p>
					</a></li>
					
					
						
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
<!-- 정보변경 모달 팝업 내용 -->
<div id='update-popup' class="needpopup">
	<a href="#"></a>
	<p>
	<form id="projectupdate" action="/project/update" method="post">
		<p class="login-box-msg" style="padding-bottom: 10px">
			<input type="hidden" id="c_Id" name="c_Id" value="${pjt.c_Id}">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">이름</label> <input class="form-control" type="text" id="c_Name"
				name="c_Name" required value="${pjt.c_Name}">
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">설명</label>
			<textarea class="form-control" rows="3" id="c_Comment"
				name="c_Comment" required>${pjt.c_Comment}</textarea>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">관리자 변경</label><br><select name="mem_Id">
				<option value="${member.mem_Id}">${member.mem_Name}(${member.mem_Id})</option>
			<c:forEach var="memberList" items="${memberList}" >	
				<c:if test="${memberList.mem_Id != pjt.mem_Id}">
				<option value="${memberList.mem_Id}">${memberList.mem_Name}(${memberList.mem_Id})</option>
				</c:if>
				</c:forEach>
			</select>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">카테고리</label><br> <select name="c_Category">
			
				<option value="${pjt.c_Category}">${pjt.c_Category}</option>
				<option value="0">협업업무관련</option>
				<option value="1">개인업무관련</option>
				<option value="2">학업과제관련</option>
			</select>
		</p>
			<button type="submit" class="btn btn-block btn-success">정보변경</button>
			</form>
	<span>
		<form id="projectdelete" action="/project/delete" method="post">
		<input type="hidden" id="c_Id" name="c_Id" value="${pjt.c_Id}">
		<button style="background-color: #dc3545;" type="submit" class="btn btn-block btn-success">협업공간삭제</button>
	</form>
	</span>
</div>
<!-- 맴버초대 모달 팝업 내용 -->
<div id='add-popup' class="needpopup">
	<p>
		<div style="padding-bottom: 25px;">
			<h4 class="m-0 text-dark"
				style="font-family: Recipekorea; padding-bottom: 5px;" >파트너 초대</h4>
			<span style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1;">
				많은 사람을 초대하여 원활한 의사소통으로 업무를 효율적으로 처리해보세요. 회사 동료뿐만 아니라 외부 협업자도 파트너로
				초대할 수 있습니다.</span>
		</div>

		<div style="padding-bottom: 25px;">
			<h4 class="m-0 text-dark"
				style="font-family: Recipekorea; padding-bottom: 5px;">파트너 아이디</h4>
			<input style="margin-bottom: 5px;" class="form-control" type="text" id="mem_Id" name="mem_Id"
				required> <span id= "id_check"
				style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1;">
				이메일 주소를 입력하고 Enter키를 눌러 파트너들을 초대해 보세요.</span>
		</div>


		<div style= "padding-bottom: 25px">
			<h4 class="m-0 text-dark"
				style="font-family: Recipekorea; padding-bottom: 5px;">초대 리스트</h4>
			<div id = "applyList" class = "form-control" style="height: 152px; width: 490px; white-space: pre-line; margin-bottom: 5px;"></div> <span
				style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1; ">
			
				 초대 메세지를 보낼 파트너 아이디를 여기서 확인할 수 있습니다.</span>
		</div>
		<div><span style="float: left; padding-right: 50px;">
		<form action="/news/insert" method="post" id = "applyform">
			<input type="hidden" name="c_Id" value="${pjt.c_Id}">
			<button type="submit" id= "insertsubmit" class="btn btn-block btn-success" 
			style="width: 220px;">초대하기</button></form></span>
		<span>
		<button type="reset" class="btn btn-block btn-success" onclick="history.go(0);" style="width: 220px">취소</button>
		</span>
		</div>
</div>
<!-- 공간생성 모달 팝업 내용 -->
<div id='createpjt-popup' class="needpopup">

<form action="/project/insert" method="post" id="createpjtform">
        <div class="card-body">
              <div class="form-group">
              <div class="col-md-6" style="max-width: 100%;" >
                <label for="inputName">협업공간명</label>
                <input type="text" name="c_Name" id="create_Name" class="form-control">
              </div>
              </div>
              <div class="form-group">
              <div class="col-md-6" style="max-width: 100%;">
                <label for="inputDescription">협업공간 설명</label>
                <textarea name="c_Comment" id="create_Comment" class="form-control" rows="4"></textarea>
              </div>
              </div>
              <div class="form-group">
              <div class="col-md-6" style="max-width: 100%;">
                <label for="inputStatus">카테고리</label>
               <select class="form-control custom-select" name= "c_Category" id="create_Category">
                  <option value="00" hidden>선택해주세요</option>
                  <option value="01">협업관련 업무관리</option>
                  <option value="02">개인 업무관리</option>
                  <option value="03">학업관련 과제관리<option>
                </select>
              </div>
              </div>
              <input type="hidden"  name = mem_Id value= ${member.mem_Id }>
              <div class="col-md-6" style="max-width: 100%;">
          <input type="submit" value="생성" class="btn btn-success float-right" id="projectInsert"  style="width: 100px;">
          <input type="reset" class="btn btn-block btn-success" onclick="history.go(0);" value = "취소" style="background-color: #dc3545; width: 100px;">
          </div>
      </form>
</div>
