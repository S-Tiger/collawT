<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../includes/header.jsp"%>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>마이페이지</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	if(${msg != null}){
		alert('${msg}');
	};
	
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
}); 
	
	
	function fn_deleteMem(){
		if(!confirm("정말탈퇴 하시겠습니까?")){
			return false;
		}
	};
</script>
  
</head>
<body class="hold-transition sidebar-mini">

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">User Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                <!-- 아이디 있으면.. -->
                <c:if test="${member.mem_File != null }">
					<img alt="User Image" class="profile-user-img img-fluid img-circle"
						src="/member/getByteImage?mem_Id=${member.mem_Id}" />
				</c:if>
				<c:if test="${member.mem_File == null }">
					<img src="../resources/dist/img/user2-160x160.jpg"
						class="profile-user-img img-fluid img-circle" alt="User Image">
				</c:if>
                </div>
                <h3 class="profile-username text-center">${member.mem_Name}</h3>
                <p class="text-muted text-center">${member.mem_Id}</p>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>협업맴버</b> <a class="float-right">2</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <!-- About Me Box -->
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#settings" data-toggle="tab">개인정보변경</a></li>
                  <li class="nav-item"><a class="nav-link" href="#outMember" data-toggle="tab">회원탈퇴</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane" id="activity">
                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="/resources/dist/img/user1-128x128.jpg" alt="user image">
                        <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Shared publicly - 7:30 PM today</span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <p>
                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input class="form-control form-control-sm" type="text" placeholder="Type a comment">
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                    <div class="post clearfix">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="/resources/dist/img/user7-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Sarah Ross</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Sent you a message - 3 days ago</span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <form class="form-horizontal">
                        <div class="input-group input-group-sm mb-0">
                          <input class="form-control form-control-sm" placeholder="Response">
                          <div class="input-group-append">
                            <button type="submit" class="btn btn-danger">Send</button>
                          </div>
                        </div>
                      </form>
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="/resources/dist/img/user6-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Adam Jones</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Posted 5 photos - 5 days ago</span>
                      </div>
                      <!-- /.user-block -->
                      <div class="row mb-3">
                        <div class="col-sm-6">
                          <img class="img-fluid" src="/resources/dist/img/photo1.png" alt="Photo">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                          <div class="row">
                            <div class="col-sm-6">
                              <img class="img-fluid mb-3" src="/resources/dist/img/photo2.png" alt="Photo">
                              <img class="img-fluid" src="/resources/dist/img/photo3.jpg" alt="Photo">
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                              <img class="img-fluid mb-3" src="/resources/dist/img/photo4.jpg" alt="Photo">
                              <img class="img-fluid" src="/resources/dist/img/photo1.png" alt="Photo">
                            </div>
                            <!-- /.col -->
                          </div>
                          <!-- /.row -->
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <p>
                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input class="form-control form-control-sm" type="text" placeholder="Type a comment">
                    </div>
                    <!-- /.post -->
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="timeline">
                    <!-- The timeline -->
                    <div class="timeline timeline-inverse">
                      <!-- timeline time label -->
                      <div class="time-label">
                        <span class="bg-danger">
                          10 Feb. 2014
                        </span>
                      </div>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-envelope bg-primary"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 12:05</span>

                          <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                          <div class="timeline-body">
                            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                            weebly ning heekya handango imeem plugg dopplr jibjab, movity
                            jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                            quora plaxo ideeli hulu weebly balihoo...
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-primary btn-sm">Read more</a>
                            <a href="#" class="btn btn-danger btn-sm">Delete</a>
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-user bg-info"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 5 mins ago</span>

                          <h3 class="timeline-header border-0"><a href="#">Sarah Young</a> accepted your friend request
                          </h3>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-comments bg-warning"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 27 mins ago</span>

                          <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                          <div class="timeline-body">
                            Take me to your leader!
                            Switzerland is small and neutral!
                            We are more like Germany, ambitious and misunderstood!
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-warning btn-flat btn-sm">View comment</a>
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline time label -->
                      <div class="time-label">
                        <span class="bg-success">
                          3 Jan. 2014
                        </span>
                      </div>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-camera bg-purple"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 2 days ago</span>

                          <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                          <div class="timeline-body">
                            <img src="http://placehold.it/150x100" alt="...">
                            <img src="http://placehold.it/150x100" alt="...">
                            <img src="http://placehold.it/150x100" alt="...">
                            <img src="http://placehold.it/150x100" alt="...">
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <div>
                        <i class="far fa-clock bg-gray"></i>
                      </div>
                    </div>
                  </div>
                  <!-- /.tab-pane -->
					<!-- 세팅------------------------------- -->
                  <div class="active tab-pane" id="settings">
                    <form class="form-horizontal" action="/member/update_mypage" method="post">
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">ID</label>
                        <div class="col-sm-10">
                         <input class="form-control" type="email" id="mem_Id" name="mem_Id" readonly value="${member.mem_Id}">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">이름</label>
                        <div class="col-sm-10">
                          <input class="form-control" type="text" id="mem_Name" name="mem_Name" value="${member.mem_Name}" required>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-success float-right">회원정보변경</button>
                      </form> 
                      <!-- 이름바꾸기 폼 -->
                      <br><br>
                      
                      
                      
                      <!-- 프로필사진 변경 -->
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">프로필사진</label>
                        <div class="card-body box-profile">
                			<div class="text-center">
                			<!-- 아이디 있으면.. -->
                				<section class="card-footer">
					<div class="card">
						<!-- 프로필사진 -->
						<p class="login-box-msg">
							<label>프로필사진</label>
						<div id="left">
									<div id="holder">
										
									</div>
								</div>
														<!-- 이미지 저장 blob -->
								<form action="/member/saveImage" enctype="multipart/form-data"
									method="post" class="form-horizontal">
									<input type="hidden" name="mem_Id" value="${member.mem_Id}">
									<input type="file" class="form-control" name="mem_File" id="imageFile"
										accept="image/gif, image/jpeg, image/png" /><br> <br>
									<input type="submit" class="btn btn-success float-right"
										value="프로필 사진 변경" />
								</form>
								
				</section>
                		</div>
              		</div>
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">비밀번호변경</label>
                        <div class="col-sm-10">
                        <form id="pwForm" action="/member/update_pw" method="post">
							<input type="hidden" name="mem_Id" value="${member.mem_Id}">
							<p class="login-box-msg">
								<label>기존비밀번호</label> <input class="form-control" id="old_pw"
									name="old_pw" type="password" required>
							</p>
							<p class="login-box-msg">
								<label>새로운 비밀번호</label> <input class="form-control" id="pw"
									name="mem_Pwd" type="password" required>
							</p>
							<p class="login-box-msg">
								<label>새로운 비밀번호 확인</label> <input class="form-control" id="pw2"
									type="password" type="password" required>
							</p>
							<div class="check_font" id="pw_check"></div>
							<p class="login-box-msg">
								<button type="submit" id="joinBtn"
									class="btn btn-success float-right">비밀번호 변경</button>
								<br> <br>
								<button type="button" class="btn btn-success float-right"
									onclick="location.href='/main'">뒤로가기</button>
								<br></p>
								</form>
                        </div>
                      </div>
                    <!-- 세팅끝 -->
                  </div>
                  <div class="tab-pane" id="outMember">
                  <div class="card">
				<div class="card-body login-card-body">
					<b class="login-box-msg" ><center>회원탈퇴</center></b>
						<p class="login-box-msg">
					<form id="outMemberForm" action="/member/delete_Member" method="post">
						<p class="login-box-msg">이용해주셔서 감사합니다.</p>
						<input type="hidden" name="mem_Id" value="${member.mem_Id}">
						<p class="login-box-msg">
							<label>기존비밀번호</label> <input class="form-control" id="pwd"
								name="pwd" type="password" required>
						</p>
							<button type="submit" id="outBtn"
								class="btn btn-success float-right" onclick="fn_deleteMem()">회원탈퇴</button>
							<button type="button" class="btn btn-success float-right"
								onclick="history.back(-1);">뒤로가기</button>
					</form>
				</div>
			</div>
                  
                  
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 

  <!-- Control Sidebar -->
 
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>
<script type="text/javascript">
	var upload = document.getElementsByTagName('input')[7];
	var holder = document.getElementById('holder');
	var state = document.getElementById('status');
	upload.onchange = function(e) {
		e.preventDefault();

		var file = upload.files[0], reader = new FileReader();

		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;

			img.width = 100;
			img.height = 100;
			
			holder.innerHTML = '';
			holder.appendChild(img);
			holder.width = 100;
			holder.height = 100;

		};
		reader.readAsDataURL(file);
		return false;

	};
	</script>
<%@include file="../includes/footer.jsp"%>