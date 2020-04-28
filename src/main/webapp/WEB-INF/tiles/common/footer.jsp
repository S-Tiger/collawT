<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/SRC2/modal/dist/needpopup.min.css">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	var wsocket;
	
	function connect() {
		wsocket = new WebSocket("ws://localhost:8090/chat-ws");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") {
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	
	function send() {
		var nickname = '${member.mem_Name}';
		var msg = $("#message").val();
		wsocket.send("msg:"+name+":" + msg);
		$("#message").val("");
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
</script>

<style>
#chatArea {
	width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}
</style>
	
	<footer class="main-footer">
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">

      <b>Version</b> 3.0.3-pre
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
 <div class="sidebar"><nav class="mt-2">
					<c:forEach var="partnerList" items="${coworklist}">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item has-treeview" id="menustat" style="border-bottom: 1px solid #4f5962;">
					<a href="#" class="nav-link active"> <i class="nav-icon far fa-handshake"></i>
					<b>${partnerList.c_Name}</b><i class="right fas fa-angle-left"></i>
					</a>
						<ul class="nav nav-treeview" >
					
						<c:forEach var="partnermember" items="${partnerList.memberList}">
								<li class="nav-item"><a href="#" data-needpopup-show="#chatroom-popup" class="nav-link">
										<i class="nav-icon fas fa-sitemap"></i>
										<b>${partnermember.mem_Name}</b>
								</a></li>	
							</c:forEach>
							</ul>
				</li></ul>
							</c:forEach>
						
				</nav>
 </div>
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->



<div id='chatroom-popup' class="needpopup">

	<div class="col-md-6" style="max-width: 100%;">
	
	<input type="button" id="enterBtn" value="입장">
	<input type="button" id="exitBtn" value="나가기">
    
    <h1>대화 영역</h1>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">

	</div>
</div>

<script type="text/javascript">
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
	$('#applyform').ready(function (){
		
				$('#insertsubmit').click(function() {
					var listnum = $('#applyList').children().length;
					if (listnum == 0) {
					alert("초대 리스트가 비어있습니다");
						return false;
					}
				})
			    $('#mem_Id').keydown(function(event) {
			    	if(event.keyCode == '13'){
			    		var mem_Id = $('.form-control#mem_Id').val();
			    		var hidden_Id = $('#hidden_Id').val();
			    		console.log(hidden_Id);
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
									if (mem_Id == hidden_Id) {
										$("#id_check").text("동일한 아이디를 여러번 초대할수 없습니다. :p");
										$("#id_check").css("color", "red");
									}else {
									$('#applyList').append("<span id= 'applyspan'>"+mem_Id+"<a id ='applydelete' href='#'>x</a></span>");
									$('#applyform').append("<input type='hidden' id='hidden_Id' name='mem_Id' value='"+mem_Id+"'>");
									$('#mem_Id').val("");}
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
	
	$('#createpjtform').ready(function (){
 	$("#projectInsert").click(function(){
 			if ($('#create_Name').val() == ''){
				alert("협업공간명을 입력해주세요! :D");
				return false;
			}
 			
			if ($('#create_Category').val() == '00') {
				alert("카테고리를 선택해주세요! :D");
				return false;
			}
		})
	});
	</script>

<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${contextPath}/resources/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="${contextPath}/resources/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="${contextPath}/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${contextPath}/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="${contextPath}/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${contextPath}/resources/plugins/moment/moment.min.js"></script>
<script src="${contextPath}/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${contextPath}/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="${contextPath}/resources/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="${contextPath}/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${contextPath}/resources/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${contextPath}/resources/dist/js/demo.js"></script>
</body>
</html>