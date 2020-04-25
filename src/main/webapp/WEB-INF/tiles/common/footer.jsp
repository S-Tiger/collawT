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

<!-- 채팅 여기에~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
  <!-- Control Sidebar -->
   <aside class="control-sidebar control-sidebar-light control-sidebar-open">
   여기 채팅하면 되어여 footer.jsp입니다!!!!!!!!!!!!!
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active">
      	<i class="fa fa-wrench"></i></a></li>
      	<li class=""><a href="#control-sidebar-home-tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-home"></i></a></li>
      <li class=""><a href="#control-sidebar-settings-tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    
    <div class="tab-content">
    
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
			      <!-- Construct the card with style you want. Here we are using card-danger -->
			<!-- Then add the class direct-chat and choose the direct-chat-* contexual class -->
			<!-- The contextual class should match the card, so we are using direct-chat-danger -->
			<div class="card direct-chat direct-chat-primary">
			
			  <div class="card-header">
			    <h3 class="card-title">채팅 상대</h3>
			
			  </div>
			  <!-- /.card-header -->
			  <div class="card-body">
			    <!-- Conversations are loaded here -->
			    <div class="direct-chat-messages">
			      <!-- Message. Default to the left -->
			      <div class="direct-chat-msg">
			        <div class="direct-chat-infos clearfix">
			          <span class="direct-chat-name float-left">Alexander Pierce</span>
			          <span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span>
			        </div>
			        <!-- /.direct-chat-infos -->
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">
			        <!-- /.direct-chat-img -->
			        <div class="direct-chat-text">
			          Is this template really for free? That's unbelievable!
			        </div>
			        <!-- /.direct-chat-text -->
			      </div>
			      <!-- /.direct-chat-msg -->
			      <!-- Message to the right -->
			      <div class="direct-chat-msg right">
			        <div class="direct-chat-infos clearfix">
			          <span class="direct-chat-name float-right">Sarah Bullock</span>
			          <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
			        </div>
			        <!-- /.direct-chat-infos -->
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">        <!-- /.direct-chat-img -->
			        <div class="direct-chat-text">
			          You better believe it!
			        </div>
			        <!-- /.direct-chat-text -->
			      </div>
			      <!-- /.direct-chat-msg -->
			      <!-- Message. Default to the left -->
			      <div class="direct-chat-msg">
			        <div class="direct-chat-infos clearfix">
			          <span class="direct-chat-name float-left">Alexander Pierce</span>
			          <span class="direct-chat-timestamp float-right">23 Jan 5:37 pm</span>
			        </div>
			        <!-- /.direct-chat-infos -->
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">        <!-- /.direct-chat-img -->
			        <div class="direct-chat-text">
			          Working with AdminLTE on a great new app! Wanna join?
			        </div>
			        <!-- /.direct-chat-text -->
			      </div>
			      <!-- /.direct-chat-msg -->
			      <!-- Message to the right -->
			      <div class="direct-chat-msg right">
			        <div class="direct-chat-infos clearfix">
			          <span class="direct-chat-name float-right">Sarah Bullock</span>
			          <span class="direct-chat-timestamp float-left">23 Jan 6:10 pm</span>
			        </div>
			        <!-- /.direct-chat-infos -->
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">        <!-- /.direct-chat-img -->
			        <div class="direct-chat-text">
			          I would love to.
			        </div>
			        <!-- /.direct-chat-text -->
			      </div>
			      <!-- /.direct-chat-msg -->
			    </div>
			    <!--/.direct-chat-messages-->
			    <!-- Contacts are loaded here -->
			    <div class="direct-chat-contacts">
			      <ul class="contacts-list">
			        <li>
			          <a href="#">
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">            <div class="contacts-list-info">
			              <span class="contacts-list-name">
			                Count Dracula
			                <small class="contacts-list-date float-right">2/28/2015</small>
			              </span>
			              <span class="contacts-list-msg">How have you been? I was...</span>
			            </div>
			            <!-- /.contacts-list-info -->
			          </a>
			        </li>
			        <!-- End Contact Item -->
			        <li>
			          <a href="#">
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">            <div class="contacts-list-info">
			              <span class="contacts-list-name">
			                Sarah Doe
			                <small class="contacts-list-date float-right">2/23/2015</small>
			              </span>
			              <span class="contacts-list-msg">I will be waiting for...</span>
			            </div>
			            <!-- /.contacts-list-info -->
			          </a>
			        </li>
			        <!-- End Contact Item -->
			        <li>
			          <a href="#">
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">            <div class="contacts-list-info">
			              <span class="contacts-list-name">
			                Nadia Jolie
			                <small class="contacts-list-date float-right">2/20/2015</small>
			              </span>
			              <span class="contacts-list-msg">I'll call you back at...</span>
			            </div>
			            <!-- /.contacts-list-info -->
			          </a>
			        </li>
			        <!-- End Contact Item -->
			        <li>
			          <a href="#">
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">            <div class="contacts-list-info">
			              <span class="contacts-list-name">
			                Nora S. Vans
			                <small class="contacts-list-date float-right">2/10/2015</small>
			              </span>
			              <span class="contacts-list-msg">Where is your new...</span>
			            </div>
			            <!-- /.contacts-list-info -->
			          </a>
			        </li>
			        <!-- End Contact Item -->
			        <li>
			          <a href="#">
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">            <div class="contacts-list-info">
			              <span class="contacts-list-name">
			                John K.
			                <small class="contacts-list-date float-right">1/27/2015</small>
			              </span>
			              <span class="contacts-list-msg">Can I take a look at...</span>
			            </div>
			            <!-- /.contacts-list-info -->
			          </a>
			        </li>
			        <!-- End Contact Item -->
			        <li>
			          <a href="#">
			       <img class="direct-chat-img" src="${contextPath}/resources/dist/img/profile.jpg" width="30" height="30"
											class="img-circle elevation-2" alt="프로필사진">            <div class="contacts-list-info">
			              <span class="contacts-list-name">
			                Kenneth M.
			                <small class="contacts-list-date float-right">1/4/2015</small>
			              </span>
			              <span class="contacts-list-msg">Never mind I found...</span>
			            </div>
			            <!-- /.contacts-list-info -->
			          </a>
			        </li>
			        <!-- End Contact Item -->
			      </ul>
			      <!-- /.contacts-list -->
			    </div>
			    <!-- /.direct-chat-pane -->
			  </div>
			  <!-- /.card-body -->
			  <div class="card-footer">
			    <form action="#" method="post">
			      <div class="input-group">
			        <input type="text" name="message" placeholder="Type Message ..." class="form-control">
			        <span class="input-group-append">
			          <button type="button" class="btn btn-primary">Send</button>
			        </span>
			      </div>
			    </form>
			  </div>
			  <!-- /.card-footer-->
</div>
</div>
<!--/.direct-chat -->


      </div>
      <!-- /.tab-pane -->

      <!-- /.tab-pane -->
    
  </aside>
  <!-- /.control-sidebar -->
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
	</script>
	<script type="text/javascript">
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