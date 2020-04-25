<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="/SRC2/modal/dist/needpopup.min.css">

<script type="text/javascript">
	var result = '${msg}';
	if (result == 'success') {
		if(confirm("복사가 완료되었습니다. 복사한 글로 이동하시겠습니까?")){
		
		}else{
			window.history.back();
		}
	
	
<%
		//msg 세션 지우기.
		session.removeAttribute("msg");
%>
}
</script>


<script type="text/javascript">



$(document).ready(function() {
	
	
	
	//댓글 목록 항상 호출
	getReplyList();
	
	var formObj = $("form[name='readForm']");
	var formReply = $("form[name='replyForm']");

	
	
	//북마크 체크 변수
	var checkbook = 0
	
	//북마크 체크 확인
	bookcheck();
	
	
	//console.log("22222222222"+checkbook);



	
	
		//댓글 입력 버튼 클릭 시 이벤트
	$("#replyInsert_btn").on("click", function() {
		var r_Content = $("#r_Content").val();
		//댓글 입력 비어있으면 아무 이벤트도 일어나지 않게 하기
		if(r_Content==''){
			return false;
		
	//
		 }else{
			$.ajax({
				url:"/reply/insert",
				type:'post',
				data:{
					r_Content: $("#r_Content").val(),
					i_Num : $("#i_Num").val(),
					c_Id : $("#c_Id").val()
				},
				success:function(data){
					
                        $("#r_Content").val("");
                        getReplyList();
					
				}
			})
		}
	})
	
	
	//북마크 버튼 이벤트
	$("#bookmarkinsert").on("click", function() {
		console.log("1121212"+checkbook);
		if(checkbook == 0){
		$.ajax({
			url:"/bookmark/insert",
			type:'post',
			data:{
				i_Num : $("#i_Num").val(),
			},
			success:function(data){
				var bookcount = $("#bookmarkcount").html();
				console.log(bookcount);
				if(data == 1){
                    alert("북마크에 등록하셨습니다.");
				$("#bookmarkinsert").css('color','#f8f9fa');
				$("#bookmarkinsert").css('background-color', '#dc3545');
				checkbook = 1;
				bookcount++;
				console.log(bookcount);
				$("#bookmarkcount").html(bookcount);
				}
			}
		})
		}else if(checkbook == 1){
			$.ajax({
				url:"/bookmark/delete",
				type:'post',
				data:{
					i_Num : $("#i_Num").val(),
				},
				success:function(data){
					var bookcount = $("#bookmarkcount").html();
					if(data == 1){
	                    alert("북마크를 해제하셨습니다.");
					$("#bookmarkinsert").css('color','#444');
					$("#bookmarkinsert").css('background-color', '#f8f9fa');
					checkbook = 0;
					bookcount--;
					console.log(bookcount);
					$("#bookmarkcount").html(bookcount);
				}
					}
				})
			}
		})
	
		
		//북마크 추가 상태 확인 메소드
	function bookcheck() {
		$.ajax({
			url:"/bookmark/bookmarkCheck",
			type:'get',
			data:{
				i_Num : $("#i_Num").val(),
			},
			success:function(data){
				if(data == 1){
				$("#bookmarkinsert").css('color','#f8f9fa');
				$("#bookmarkinsert").css('background-color', '#dc3545');
				console.log(checkbook);
				checkbook = 1;
				console.log(checkbook);
				}
				
			}
		})
	}
	
})

	//댓글 목록
	function getReplyList(){
		$.ajax({
			type:"get",
			url : "${path}/reply/list?i_Num=${issueRead.i_Num}",
			
			success:function(result){
				
				var str="";
				if(result!=0){
					for(var i in result){
						str+='<div class="card-footer card-comments">';
						str+='<div class="card-comment">';
						

						str+='<c:if test="${'+result[i].mem_File +' != NULL}">';
						str+='<img alt="Not null" width="50" height="50"src="/member/getByteImage?mem_Id='+result[i].mem_Id+'" class="img-circle elevation-1"/>';
						str+='</c:if>';
						
						str+='<c:if test="${'+result[i].mem_File +'== NULL}">';
						str+='<img src="${contextPath}/resources/dist/img/profile.jpg" width="50" height="50" class="img-circle elevation-1" alt="Null">';
						str+='</c:if>';
						




						
						str+='<div class="comment-text">';
						str+='<span class="username">'+result[i].mem_Name;
						str+='<span class="text-muted float-right">'+result[i].r_Date+'</span>';
						str+='<small>'+('${member.mem_Id}'==result[i].mem_Id ? "&nbsp;&nbsp;&nbsp;<a href='javascript:replyModifyForm("+result[i].r_Num+",\""+result[i].r_Content+"\")'>수정</a>" : "")+'</small>';
						str+='<small>'+('${member.mem_Id}'==result[i].mem_Id ? "&nbsp;&nbsp;&nbsp;<a href='javascript:replyDelete("+result[i].r_Num+")'>삭제</a>" : "")+'</small></span>';
						
						str+='<p id="replyContent'+result[i].r_Num+'" name="replyContent">'+result[i].r_Content+'</p>';
						str+='</div></div></div>';
						str+='<input type="hidden" id="r_Num" name="r_Num" value="'+result[i].r_Num+'" />';
					}
					
				}else{
					str+='<div class="card-footer card-comments">';
					
					str+='<div class="card-comment">';
					str+='<div class="comment-text">';
					str+='<p style="text-align:center;"><small><br><br>작성된 댓글이 없습니다.<br>이 글의 첫 번째 댓글을 작성해주세요 :D</small></p>'
					str+='</div></div></div>';
				}
				$("#replyList").html(str);
			}
				
		})
		
	}


	//댓글 삭제
  	function replyDelete(r_Num){
	
		if(confirm("삭제하시겠습니까?")){
			
			$.ajax({
				url : "/reply/delete",
				data : {"r_Num" : r_Num},
				type : 'post',
				success:function(){
					alert("삭제되었습니다.");
					getReplyList();
					
				}
			})
			
		}
			
	}
	
	
	
	//댓글 수정창 열기
  	function replyModifyForm(r_Num, r_Content){
		
		var str="";
		
		str+='<div><textarea id="r_Content'+r_Num+'" name="r_Content'+r_Num+'" class="form-control">'+r_Content+'</textarea></div>';
		str+='<small><a href="javascript:replyUpdate('+r_Num+')" id="replyInsert_btn" name="replyInsert_btn">입력</span></small>&nbsp;&nbsp;';
		str+='<small><a href="javascript:replyCancle('+r_Num+',\''+r_Content+'\')" id="replyCancel_btn" name="replyCancel_btn">취소</span></small>';
	
		
		$('#replyContent'+r_Num).html(str);	
			
	} 

  
	
	//댓글 수정 db
	function replyUpdate(r_Num){
		var updateContent = $('[name=r_Content'+r_Num+']').val();
	    
	    $.ajax({
	        url : '/reply/update',
	        type : 'post',
	        data : {'r_Content' : updateContent, 'r_Num' : r_Num},
	        success : function(data){
	           
	        	getReplyList();
	        }
	    });
	}
	
	//댓글 입력 취소 버튼 클릭시
	function replyCancle(r_Num, r_Content){
		var str="";
		str+='<p id="replyContent'+r_Num+'" name="replyContent">'+r_Content+'</p>';
			
		$('#replyContent'+r_Num).html(str);	
	}
	
	//클립보드로 url 복사


	function urlClipCopy() {
		var tempElem = document.createElement('textarea');
		  tempElem.value = window.document.location.href; 
		  document.body.appendChild(tempElem);

		  tempElem.select();
		  document.execCommand("copy");
		  document.body.removeChild(tempElem);
		  alert("URL이 클립보드에 복사되었습니다. CTRL+V하시면 URL이 입력됩니다");

	}

	<style>
	.accent-teal .btn-link, .accent-teal a:not(.dropdown-item):not(.btn-app):not(.nav-link):not(.brand-link) {
	    color: #343a40;
	}
	@font-face {
		font-family: 'Recipekorea';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	.nav-pills .nav-link.active{
			    background-color: #dc3545;
	 
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


	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${contextPath}/resources/modal/dist/needpopup.min.css">

	<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="${contextPath}/resources/modal/dist/needpopup.min.js"></script>
	<script>
		needPopup.config.custom = {
			'removerPlace' : 'outside',
			'closeOnOutside' : false,
			onShow : function() {
				console.log('needPopup is shown');
			},
			onHide : function() {
				console.log('needPopup is hidden');
			}
		};
		needPopup.init();
		$('#update-popup').ready(function (){
					$('#insertsubmit').click(function() {
						var listnum = $('#applyList').children().length;
						if (listnum == 0) {
						alert("초대 리스트가 비어있습니다");
							return false;
						}
					})
			
			
				    $('#mem_Id').keydown(function(event) {
				    	if(event.keyCode == '13'){
				    		var mem_Id = $('#mem_Id').val();
				    		if(mem_Id == '${member.mem_Id}'){
				    			$("#id_check").text("자신을 초대할수 없습니다 :p");
								$("#id_check").css("color", "red");
				    		}else{
				    		$.ajax({
								url : '${contextPath}/news/memberCheck?mem_Id=' + mem_Id,
								type : 'get',
								success : function(data) {
									console.log("1 = 중복o / 0 = 중복x : " + data);
									if (data == 1) {
										$('#applyList').append("<span id= 'applyspan'>"+mem_Id+"<a id ='applydelete' href='#'>x</a></span>");
										$('#applyform').append("<input type='hidden' name='mem_Id' value='"+mem_Id+"'>");
										$('#mem_Id').val("");
										
										
										
									} else {
										$("#id_check").text("잘못된 아이디 입니다 다시 확인해주세요 :p");
										$("#id_check").css("color", "red");
									}
								}
							})}
				    	}else{
				    		$("#id_check").text("이메일 주소를 입력하고 Enter키를 눌러 파트너들을 초대해 보세요.");
							$("#id_check").css("color", "#a1a1a1");
				    	}
				    	
				    });
				});
				
				
	</script>
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
		<a href="#"></a>
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
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header" style="height: 100px">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<div>
							<h1 class="m-0 text-dark"
								style="font-family: Recipekorea; max-width: 80%; display: contents;">${pjt.c_Name}</h1>
							<c:choose>
								<c:when test="${member.mem_Id == pjt.mem_Id}">
									<a style="font-size: 20px; margin: 3px;" href="/#"
										data-needpopup-show="#update-popup"><i
										class="nav-icon fas fa-cogs"> </i>
										</a>
								</c:when>
								<c:otherwise>
								<a style="font-size: 20px; margin: 3px;" href="/pjtmember/delete?c_Id=${pjt.c_Id}&mem_Id=${member.mem_Id}"
										onclick="return withdrawal()"><i
										class="nav-icon fas fa-door-open"> </i>
										</a>
								</c:otherwise>
							</c:choose>

						</div>
						<div>
							<p class="breadcrumb float-sm-left"
								style="position: absolute; margin-top: 10px">${pjt.c_Comment}</p>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">

							<li class="breadcrumb-item"><a style="font-size: 30px;"
								href="/#" data-needpopup-show="#add-popup"> <i
									style="width: 25px; height: 25px;" class="ion ion-person-add"></i></a></li>
							<li class="breadcrumb-item active">파트너 추가</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->
	<div class="col-md-9" style="max-width: 100%;">
			<div class="card">
				<div class="card-header p-2">
				
					<ol class="nav nav-pills" style="font-family: Spoqa Han Sans; font-size:15px; margin:0px; border:none; padding-inline-start: 0px;  width:400px; float:left;">
						<li class="nav-item" ><a class="nav-link"
							href="/project/main?c_Id=${pjt.c_Id}"  id="activityMenu">홈</a></li>
							
						<li class="nav-item" id = "activityMenu"><a class="nav-link active" href="/project/issue/list?c_Id=${pjt.c_Id}"
							 id= "issueMenu"><b>이슈</b></a></li>
						<li class="nav-item" id = "activityMenu"><a class="nav-link" href="#"
							 id= "issueMenu">칸반</a></li>
						<li class="nav-item" id = "activityMenu"><a class="nav-link" href="#"
							 id= "issueMenu">캘린더</a></li>
						<li class="nav-item" id = "activityMenu"><a class="nav-link" href="/project/vote/list?c_Id=${pjt.c_Id}"
							 id= "issueMenu">투표</a></li>
							
					</ol>
					
					 <button type="button" class="btn btn-success float-right" onclick="location.href='/project/issue/insert?c_Id=${pjt.c_Id}'"style="text-align:center; float:right; background-color:#DC3545; border-color:#DC3545; font-family: Spoqa Han Sans; font-size:13px;">
									<i class="fas fa-edit"></i> <b>이슈 작성</b></button>
					
				</div>
				

	
	
</script>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					
				</div>
				<div class="col-sm-6">
			
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->

	<section class="content">

		<div class="row" id="row">
			<div class="col-md-6">

				<!-- Box Comment -->
<!-- 본문 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				
			
				<form name="readForm" role="form">

					<div class="card card-widget">
						<div class="card-header">
						
						<span style= "vertical-align:text-top;
							<c:if test="${issueRead.ig_Num == 1}">background-color:#6c757d;</c:if>
							<c:if test="${issueRead.ig_Num == 2}">background-color:#007bff;</c:if>
							<c:if test="${issueRead.ig_Num == 3}">background-color:#ffc107;</c:if>
							<c:if test="${issueRead.ig_Num == 4}">background-color:#28a745;</c:if>
							"
							id="ig_Name" name="ig_Name" class="badge badge-success"><c:out  value="${issueRead.ig_Name}" /></span>&nbsp;&nbsp;
							<span id="i_Name" name="i_Name"><b><c:out	value="${issueRead.i_Name}" /></b></span>
							
							
							<div class="btn-group float-right">
                          <button type="button" class="btn btn-default" data-toggle="dropdown" aria-expanded="false" style="border:white;background-color:white;height:20px;padding-top: 0px;color:gray"><i class="fas fa-cog"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; right: 0px; transform: translate3d(0px, 38px, 0px);">
                            
                        
                            <li><a class="dropdown-item" data-needpopup-show="#add-popup"><small>다른 협업공간으로 글 복사</small></a></li>
                            <li><a class="dropdown-item" href="javascript:urlClipCopy()"><small>URL 복사</small></a></li>
                          </ul>
                        </div>
                        <!-- 본인만 글 수정, 삭제 가능-->
                        <c:if test="${member.mem_Id == issueRead.mem_Id}">
                        <span class="text-muted float-right"><small><a href="/project/issue/update?c_Id=${issueRead.c_Id}&i_Num=${issueRead.i_Num}">수정</a>｜</small>
						<small><a onclick="if(confirm('삭제하시겠습니까?')){alert('삭제되었습니다.');}else{return false;};" href='/project/issue/delete?c_Id=${issueRead.c_Id}&i_Num=${issueRead.i_Num}'>삭제</a></small></span>
						</c:if>
						</div>
						

						
						<!-- /.card-header -->
						<div class="card-body">
						<span class="text-muted float-right"id="i_Date" name="i_Date" style="font-size:small">
								<c:out	value="${issueRead.i_Date}" /></span>
							<div class="user-block">
							
							


								<!-- 멤버이미지 넣기 -->
								
								<c:if test="${member.mem_File != null }">
								<img alt="프로필사진" width="50" height="50"
								src="/member/getByteImage?mem_Id=${issueRead.mem_Id}" class="img-circle elevation-2"/>
								</c:if>
								<c:if test="${member.mem_File == null }">
								<img src="${contextPath}/resources/dist/img/profile.jpg" width="50" height="50"
								class="img-circle elevation-2" alt="프로필사진">
								</c:if>
								<span class="username" id="mem_Name" name="mem_Name">
								<c:out value="${issueRead.mem_Name}" /></span>
								<span class="description"id="mem_Id" name="mem_Id">
								<c:out	value="${issueRead.mem_Id}" /></span>  
								
								
							</div>
							<br><br><br>
							
							
				
								<br>
							
							<!-- 내용 -->
								<p id="i_Content" name="i_Content"><c:out value="${issueRead.i_Content}" escapeXml="false"/></p>
						
							
							
							<br>
							<br>
							<br>
							 <input type="hidden" id="i_Num" name="i_Num"
								value="${issueRead.i_Num}" /> <br>
							<br>

<!-- 이슈정보~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<div class="card card-primary collapsed-card">
            <div class="card-header" style="height:30px; padding-left:13px; padding-right:16px; padding-top:4px; background-color:#e87c87;">
             <label><small><b>이슈 정보 더 보기</b></small></label>
                <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-plus"></i></button>
              </div>
            </div>
            <div class="card-body p-0">
            
             <table class="table">
              <tbody>
		           <tr>
		           <td>
		           <div class="row">
		           <ion-icon name="calendar-outline" style="font-size:24"></ion-icon>&nbsp;
					<span style="font-size: 0.8em;"><b>기간</b></span>
					</div>
		           		<!-- 시작일/종료일-->
		           		<div class="row" style="margin-left:9px">
							<c:if test="${not empty issueRead.i_Start&& not empty issueRead.i_End}">
							
								<span id="i_Start" name="i_Start" class="username ">
								<small><c:out value="${issueRead.i_Start}~"/></small></span>
								<span id="i_End" name="i_End" class="username">
								<small><c:out value="${issueRead.i_End}"/></small></span>
							</c:if>
							<c:if test="${empty issueRead.i_Start&& empty issueRead.i_End}">
							
								<span class="username"><small>기간 미설정</small></span>
							</c:if>
							</div>
		           </td>
		           </tr>
		        
		           <tr>
					<td>
					<div class="row">
					<i class="fas fa-user-friends"></i>&nbsp;
					<span style="font-size: 0.8em;"><b>이슈 담당자</b></span>
					</div>
					<div id="chargerListCheck">
							<c:forEach var="chargerList" items="${chargerList}" >
							
								<div class="row" style="margin:9px">
								<div class="user-block-sm">	
								
								
								<%-- <img alt="프로필사진" width="30" height="30"
								src="/member/getByteImage?mem_Id=${chargerList.MEM_ID}" class="img-circle"/> --%>
								
								
								<c:if test="${member.mem_File != null }">
								<img alt="프로필사진" width="30" height="30"
								src="/member/getByteImage?mem_Id=${chargerList.MEM_ID}" class="img-circle"/>
								</c:if>
								<c:if test="${member.mem_File == null }">
								<img src="${contextPath}/resources/dist/img/profile.jpg" style="width:30px; height:30px"
								class="img-circle" alt="User Image">
								</c:if>
								
								
								<span class="username" id="ch_mem_Name" name="mem_Name">
								<small><c:out value=" ${chargerList.MEM_NAME}"/></small></span>
								<span class="description"id="mem_Id" name="mem_Id">
								<small><c:out	value="(${chargerList.MEM_ID})"/></small></span>
								</div>
								</div>
								
								</c:forEach>
					</div>
				
							</td>
							
							</tr>
							</tbody>
              </table>
            </div></div>				
<!-- 첨부파일 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				


<!-- 첨부된 파일 없으면 창 아예 안보이게  -->		
<c:if test="${not empty file}">
					<div class="card card-info">
                        <div class="card-header" style="height:30px; padding-left:13px; padding-right:16px; padding-top:4px; background-color:#e87c87;">
             <label><small><b>첨부파일</b></small></label>
                <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-minus"></i></button>
              </div>
            </div>
            <div class="card-body p-0">
              <table class="table">

                <tbody>

				  <c:forEach var="file" items="${file}" >
                  <tr>
                    <td><small><span id="a_RealName" name="a_RealName">${file.a_RealName}</span></small></td>
                    <td><span id="a_Size" name="a_Size"><small>${file.a_Size/1000}kb</small></span></td>
                    <td class="text-right py-0 align-middle">
                      <a href="/appendix/download?a_Num=${file.a_Num}"><i class="fas fa-download"></i></a>
                    </td>
                 </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
           <!--  /.card-body -->
          </div>
          <br>
          </c:if>
          <!-- /.card -->
          
          <!-- 이거 나중에 기능 넣기 -->
							
							<!-- 숫자 카운트 넣기 -->
							<button type="button" class="btn btn-default btn-sm" id = "bookmarkinsert"style="color:#444; margin:3px;">
								<i class="fas fa-bookmark"></i> 북마크
							</button>
							

						
						<a id="list_btn" class="btn btn-default btn-sm" href='list?c_Id=${issueRead.c_Id}' style="color:#444; margin:3px;"> <i class="fas fa-list"></i>&nbsp;목록</a>

								
								<br><br>
						</div>

						<!-- /.card-body -->

						<!-- /.card -->
					</div>

					<!-- /.col -->
					<div class="col-md-6">
						<!-- Box Comment -->

					</div>

					<!-- /.card -->
					
			</div>
			</form>

<!-- /.card -->




<!-- 댓글 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				

			<div class="col-md-6">
				<div class="card">

					
					<div id="replyList"></div>
					
					<!-- 댓글  입력-->
					<div class="card-footer" id="replyInput" name="replyInput">

						
							<%-- <img class="img-fluid img-circle img-sm"
								src="/member/getByteImage?mem_Id=${member.mem_Id}" alt="Alt Text" width="50" height="50" > --%>
							
								<c:if test="${member.mem_File != null }">
								<img class="img-fluid img-circle img-sm"
								src="/member/getByteImage?mem_Id=${member.mem_Id}" alt="Alt Text" width="50" height="50" >
								</c:if>
								<c:if test="${member.mem_File == null }">
								<img class="img-fluid img-circle img-sm"
								src="${contextPath}/resources/dist/img/profile.jpg" alt="Alt Text" width="50" height="50">
								</c:if>
						
							<div class="img-push">
								<textarea id="r_Content" name="r_Content" class="form-control"	placeholder="댓글을 입력하세요"></textarea>
									
									
									<small><a href="#" id="replyInsert_btn" name="replyInsert_btn">입력</a></small>
																		
									<input type="hidden" id="i_Num" name="i_Num" value="${issueRead.i_Num}" />
									<input type="hidden" id="c_Id" name="c_Id" value="${issueRead.c_Id}" />
									
								
							</div>
					
					</div>
					<!-- /댓글 입력 -->
				</div>
			</div>
			<div class="row">
				<div class="col-12"></div>
			</div>
			</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<!-- 다른협업공간으로 글 복제 모달 팝업 내용 -->
<div id='add-popup' class="needpopup">
	<p>
	<div style="padding-bottom: 25px;">
		<h6 class="m-0 text-dark"
			style="font-family: Spoqa Han Sans; padding-bottom: 5px;">협업공간 선택</h6>
		<span style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1;">
			복사한 글을 게시할 협업공간을 선택하세요.</span>
	</div>
	
	<form action="/project/issue/copy" method="post" id="applyform">
      <select class="form-control custom-select" id="coworkSelect" name="coworkSelect">
      	<option selected disabled>협업공간을 선택하세요</option>
         <c:forEach var="coworkList" items="${coworkList}" >
         
         <c:if test="${coworkList.C_ID != issueRead.c_Id}">
         <option id="copyc_Id" name="copyc_Id" value="${coworkList.C_ID}">${coworkList.C_NAME}</option>
       </c:if>
        </c:forEach>
       </select>	
		
		<input type="hidden" value="${issueRead.i_Name}" id="i_Name" name="i_Name">
		<input type="hidden" value="${issueRead.i_Content}" id="i_Content" name="i_Content">
		<input type="hidden" value="${issueRead.ig_Num}" id="ig_Num" name="ig_Num">
		<input type="hidden" value="${issueRead.i_Start}" id="i_Start" name="i_Start">
		<input type="hidden" value="${issueRead.i_End}" id="i_End" name="i_End">
		<input type="hidden" value="${issueRead.i_Num}" id="i_Num" name="i_Num">
 		<input type="hidden" value="" id="changedc_Id" name="c_Id">
		
	
		<br><br>
		<span style="float: left; padding-right: 50px;">
			
		<button type="submit" id="insertsubmit"
					class="btn btn-block btn-success" style="width: 220px;">복사</button>
			
		</span> <span>
			<button type="reset" class="btn btn-block btn-success"
				onclick="history.go(0);" style="width: 220px">취소</button>
		</span>
		</form>
	</div>
	<script>
 	$("#coworkSelect").change(function(event) {
 		var copyc_Id = $("#coworkSelect option:selected").val();
		$("#changedc_Id").val(copyc_Id);
	
	})
	
	

	</script>

