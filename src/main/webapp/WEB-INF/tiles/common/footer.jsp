<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
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
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
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
			});</script>

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