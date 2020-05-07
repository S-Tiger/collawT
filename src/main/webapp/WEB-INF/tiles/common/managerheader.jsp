<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
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

#applyList span {
	background-clip: padding-box;
    border: 1px solid #17a2b8;
    padding: 2px;
    margin: 2px;
    display: inline-block;
}
#applyList a {

	margin: 2px;
}


</style>

<script type="text/javascript">


	document.ready = function() {
		//검색
		$("#search").click(function(){
			if($("#keyword").val()!=''){
				var url = "${contextPath}/search/wholeresult";
				url = url + "?keyword="+$('#keyword').val();
				location.href=url;
			}

		})
		
		//엔터키 검색
		$("#keyword").keydown(function(){
			if($("#keyword").val()!=''){
			if (event.keyCode == '13') {
				var url = "${contextPath}/search/wholeresult";
				url = url + "?keyword="+$('#keyword').val();
				location.href=url;
			}
			}
		})
		
		//검색시 검색어 유지
	var keyword_1 = $("#keyword_1").val();
	 $("#keyword").val(keyword_1);
	
		
		//알림개수 가져오기
		var total = 0;		
		$.ajax({
			url : '${contextPath}/notify/viewReply',
			type : 'get',
			success : function(data){
				var itemcount = data.length;
				var count =parseInt(itemcount);
				total += count;
				$("#test01").html(itemcount);				
				
			}
		})
		$.ajax({
			url : '${contextPath}/notify/viewVote',
			type : 'get',
			success : function(data){
				var itemcount = data.length;
				var count =parseInt(itemcount);
				total += count;
				$("#test66").html(itemcount);
			}
		})
		$.ajax({
			url : '${contextPath}/notify/view',
			type : 'get',
			success : function(data){
				var itemcount = data.length;
				var count =parseInt(itemcount);
				total += count;
				$("#test03").html(itemcount);				
				
			}
		})
		
		$.ajax({
			url : '${contextPath}/news/view',
			type : 'get',
			success : function(data){
				var itemString =[];
				if(data != 0){
					for(var i in data){
						if(data[i].ap_Yn === 'waiting'){
							itemString.push(data[i].ap_Yn)
						}
					}
				}
				var itemcount1 = itemString.length;
				var count1 =parseInt(itemcount1);
				total += count1;
				$("#test33").html(itemcount1);
				$("#test00").html(total);
				$("#test22").html(total);
			}
		})
		//북마크 리스트 가져오기 ajax 
		$.ajax({
			url : '${contextPath}/bookmark/list',
			type : 'get',
			success : function(data) {
				var itemString = "";
				var itemcount = data.length;
				if (data != 0) {
					for ( var i in data) {
				itemString += '<tr><td style="width:30%;"><font size="3em" color="#6c757d"><b>'
				itemString +=  data[i].c_Name+'</b></font></td>'
				itemString += '<td style="width:50%"><a style="color: #20c997" href="/project/issue/read?i_Num='+data[i].i_Num+'">';
				itemString += '<font size="3em"><b>'+data[i].i_Name+'</b></font></a>'
				itemString += '<a href="#" onclick="bookdelete('+data[i].i_Num+')" style="padding: 0px; margin-top: 3; float:right;">'
				itemString += '<i class="fas fa-trash-alt"></i></a></td>'
				itemString += '<td style="width:20%;"><font size="3em" color="#6c757d"><b>'
				itemString +=  data[i].mem_Name+'</b></font></td></tr>'
					}
				$("#bookmarkcount").html(itemcount);
				}else{
				itemString += '<tr><td colspan="3" align="center"><font size="3em"><b>등록된 북마크가 없습니다.</b></font></td></tr>'  
				}
				$("#bookmarkitem").html(itemString);
			}})
		
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
		
		
		
		//북마크 버튼클릭시 다시 ajax실행
		$('#bookmarkA').click(function() {
			$.ajax({
				url : '${contextPath}/bookmark/list',
				type : 'get',
				success : function(data) {
					var itemString = "";
					var itemcount = data.length;
					if (data != 0) {
						for ( var i in data) {
							itemString += '<tr><td style="width:30%;"><font size="3em" color="#6c757d"><b>'
								itemString +=  data[i].c_Name+'</b></font></td>'
								itemString += '<td style="width:50%"><a style="color: #20c997" href="/project/issue/read?i_Num='+data[i].i_Num+'">';
								itemString += '<font size="3em"><b>'+data[i].i_Name+'</b></font></a>'
								itemString += '<a href="#" onclick="bookdelete('+data[i].i_Num+')" style="padding: 0px; margin-top: 3; float:right;">'
								itemString += '<i class="fas fa-trash-alt"></i></a></td>'
								itemString += '<td style="width:20%;"><font size="3em" color="#6c757d"><b>'
								itemString +=  data[i].mem_Name+'</b></font></td></tr>'
						}
					$("#bookmarkcount").html(itemcount);
					}else{
					itemString += '<tr><td colspan="3" align="center"><font size="3em"><b>등록된 북마크가 없습니다.</b></font></td></tr>'  
					}
					$("#bookmarkitem").html(itemString);
				}})
	})
	
	};
	function menuclick() {
		deleteCookie('menu');
		var stat = document.getElementById('menustat').className;
		if (stat == 'nav-item has-treeview menu-open') {
			setCookie('menu', 'nav-item has-treeview', 1);
		} else if (stat == 'nav-item has-treeview') {
			setCookie('menu', 'nav-item has-treeview menu-open', 1);
		}
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
	
	function bookdelete(itemdata) {
		var i_Num = itemdata;
		$.ajax({
			url : '${contextPath}/bookmark/deletelist?i_Num='+i_Num,
			type : 'get',
			success : function(data) {
				var itemString = "";
				var bookcount = $("#bookmarkcount").html();
				if (data != 0) {
					for ( var i in data) {
						itemString += '<tr><td style="width:30%;"><font size="3em" color="#6c757d"><b>'
							itemString +=  data[i].c_Name+'</b></font></td>'
							itemString += '<td style="width:50%"><a style="color: #20c997" href="/project/issue/read?i_Num='+data[i].i_Num+'">';
							itemString += '<font size="3em"><b>'+data[i].i_Name+'</b></font></a>'
							itemString += '<a href="#" onclick="bookdelete('+data[i].i_Num+')" style="padding: 0px; margin-top: 3; float:right;">'
							itemString += '<i class="fas fa-trash-alt"></i></a></td>'
							itemString += '<td style="width:20%;"><font size="3em" color="#6c757d"><b>'
							itemString +=  data[i].mem_Name+'</b></font></td></tr>'
					}
				$("#bookmarkcount").html(bookcount);
				}else{
				itemString += '<tr><td colspan="3" align="center"><font size="3em"><b>등록된 북마크가 없습니다.</b></font></td></tr>'  
				$("#bookmarkcount").html('');
				}
				$("#bookmarkitem").html(itemString);
			}})
	}
	
</script>

<script>

 function move(url){

    $('#content').children().remove();

    $('#content').load(url);

 }

</script>




<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<link rel="stylesheet" href="${contextPath}/resources/modal/dist/needpopup.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${contextPath}/resources/modal/dist/needpopup.min.js"></script>


<title>협업툴 Collaw T - 관리자 페이지</title>
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
        <a href="/manager/member/main" class="nav-link">Home</a>
      </li>
    </ul>
	<!-- Main Sidebar Container -->
	<aside class="main-sidebar elevation-4 sidebar-dark-info">
		<!-- Brand Logo -->
		<a  href="/main" class="brand-link navbar-info"> <img
			src="${contextPath}/resources/dist/img/logocollawT.png" alt="AdminLTE Logo"
			class="brand-image img-circle elevation-3" style="opacity: .8">
			<span class="brand-text font-weight-light" style="font-family:Tahoma;">&nbsp;Collaw T</span>
		</a>

		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex"style="padding-bottom: 0px !important;margin-bottom: 0px !important;margin-top: 10px !important;height: 65px;">
				<span class="image" style="padding-left: .6rem;">
					<c:if test="${member.mem_File != null }">
						<div class="profile">
							<img alt="User Image" style="width:40px; height:40px" class="img-circle elevation-2"
								src="/member/getByteImage?mem_Id=${member.mem_Id}" />&nbsp;&nbsp;
						</div>
					</c:if>
					
					<c:if test="${member.mem_File == null }">
							<img src="${contextPath}/resources/dist/img/profile.jpg" style="width:40px; height:40px"
								class="img-circle elevation-2" alt="User Image">
					</c:if>
				</span>
				
					<span class="info" style="width: 170px;">
						<a href="#"  style="padding: 0px; margin-right: 0px;">${member.mem_Name} </a>
						<a href="/logout"  style="padding: 0px; margin-top: 3; float:right;"><i class="fas fa-sign-out-alt"></i></a><br>
						<p style="padding: 0px; margin-right: 0px; color:#C2C7D1"><font size="2">(${member.mem_Id})</font></p>
					</span>
		
			</div>
			
			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">

												
					<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item"><a href="/manager/member/main" class="nav-link">
									<i class="nav-icon fas fa-user-secret"></i>
									<p>회원관리</p>
							</a></li>

					<li class="nav-item"><a href="/#" data-needpopup-show="#bookmark-popup"
						class="nav-link" id="bookmarkA"> <i class="nav-icon fas fa-bookmark"></i>
							<p>
								북마크 <span class="badge badge-info right" id="bookmarkcount" style="background-color: #FFC108"></span>
								<!--  <span class="right badge badge-danger">New</span>-->
							</p>
					</a></li>
					
					
					
					<li class="nav-item" ><a href="/calendar/main"
						class="nav-link"> <i class="nav-icon fas fa-calendar-check"></i>
							<p>
								전체 캘린더 <span class="badge badge-info right"></span>
								<!--  <span class="right badge badge-danger">New</span>-->
							</p>
					</a></li>
					
					<li class="nav-item" ><a href="/personal/search/myFile"
						class="nav-link"> <i class="nav-icon fas fa-archive"></i>
							<p>
								전체 파일함 <span class="badge badge-info right"></span>
								<!--  <span class="right badge badge-danger">New</span>-->
							</p>
					</a></li>
					
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>



