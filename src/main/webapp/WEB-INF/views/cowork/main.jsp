<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/SRC2/modal/dist/needpopup.min.css">
<style>


.accent-teal a:not(.dropdown-item):not(.btn-app):not(.nav-link):not(.brand-link) {
    color: #343a40;
}
.nav-pills .nav-link.active {
	background-color: #dc3545;
}
</style>
<script type="text/javascript">
function withdrawal() {
	var a = confirm("정말 협업공간을 나가시겠습니까?")
	if (a == true) {
		alert("협업공간을 나왔습니다.")
	}else {
		return false;
	}
	
}

	

	$('#applyform').ready(function() {
		$('#insertsubmit').click(function() {
			var listnum = $('#applyList').children().length;
				if (listnum == 0) { alert("초대 리스트가 비어있습니다");
					return false;}
					})
					
			var applyCount = 0;
			var check_Id = new Array();
					
		$('#item_mem_Id').keydown(function(event) {
			
			
			if (event.keyCode == '13') {
				var mem_Id = $('#item_mem_Id').val();
				var check_stat = true;
					if (mem_Id == '${member.mem_Id}') {
						$("#id_check").text("자신을 초대할수 없습니다 :p");
						$("#id_check").css("color","red");} 
					else {
						$.ajax({
							url : '${contextPath}/news/memberCheck?mem_Id='+ mem_Id,
							type : 'get',
							success : function(data) {console.log("1 = 중복o / 0 = 중복x : " + data);
								if (data == 1) {
									for (var i = 0; i < check_Id.length; i++) {
									if (mem_Id == check_Id[i]) {
										$("#id_check").text("동일한 아이디를 여러번 초대할수 없습니다. :p");
										$("#id_check").css("color","red");
										check_stat = false;
										} 
									}
									if (check_stat){
										$('#applyList').append("<span id= 'applyspan"+applyCount+"'>"+ mem_Id+ "<a id ='applydelete' onclick = 'delbtn("+applyCount+")' href='#'>X</a></span>");
										$('#applyform').append("<input type='hidden' id='hidden_Id"+applyCount+"' name='mem_Id' value='"+mem_Id+"'>");
										$('#item_mem_Id').val("");
										applyCount++;
										check_Id.push(mem_Id);
										}
								} else {
									$("#id_check").text("잘못된 아이디 입니다 다시 확인해주세요 :p");
									$("#id_check").css("color","red");}
								}
							})
						}
					} else {$("#id_check").text("이메일 주소를 입력하고 Enter키를 눌러 파트너들을 초대해 보세요.");
							$("#id_check").css("color","#a1a1a1");}
				});
			});
	
	function delbtn(applyCount){
		$('#applyspan'+applyCount).remove();
		$('#hidden_Id'+applyCount).remove();
		
	}
	
	
$(function () {
    //-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas1 = $('#donutChart1').get(0).getContext('2d')
    var donutData1        = {
      labels: [
          '발의됨', 
          '진행중',
          '일시정지', 
          '완료', 
           
      ],
      datasets: [
        {
          data: [1,2,3,4],
          backgroundColor : ['#6c757d', '#007bff', '#ffc107', '#28a745'],
        }
      ],

    }
    var donutOptions1     = {
      maintainAspectRatio : false,
      responsive : true,
      cutoutPercentage: 65,
      legend: {
          display: true,
          position : 'left',
          align : 'start',
        labels: {pointStyle:'circle', usePointStyle:true}
      },
  	elements: {
  			center: {
  				text: '총 100건',
		        color: '#FF6384', // Default is #000000
		        fontStyle: 'Arial', // Default is Arial
		        sidePadding: 20 // Defualt is 20 (as a percentage)
  			}
  		}
  	}     
    
    
    

    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    var donutChart1 = new Chart(donutChartCanvas1, {
      type: 'doughnut',
      data: donutData1,
      options: donutOptions1      
    })
	
	
	
	
	Chart.pluginService.register({
		beforeDraw: function (chart) {
			if (chart.config.options.elements.center) {
        //Get ctx from string
        var ctx = chart.chart.ctx;
        
				//Get options from the center object in options
        var centerConfig = chart.config.options.elements.center;
      	var fontStyle = centerConfig.fontStyle || 'Arial';
				var txt = centerConfig.text;
        var color = centerConfig.color || '#000';
        var sidePadding = centerConfig.sidePadding || 20;
        var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
        //Start with a base font of 30px
        ctx.font = "30px " + fontStyle;
        
				//Get the width of the string and also the width of the element minus 10 to give it 5px side padding
        var stringWidth = ctx.measureText(txt).width;
        var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

        // Find out how much the font can grow in width.
        var widthRatio = elementWidth / stringWidth;
        var newFontSize = 30;
        var elementHeight = (chart.innerRadius * 2);

        // Pick a new font size so it will not be larger than the height of label.
        var fontSizeToUse = Math.min(newFontSize, elementHeight);

				//Set font settings to draw it correctly.
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
        var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
        ctx.font = fontSizeToUse+"px " + fontStyle;
        ctx.fillStyle = color;
        
        //Draw text in center
        ctx.fillText(txt, centerX, centerY);
			}
		}
	});
	
    
    
    //-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas2 = $('#donutChart2').get(0).getContext('2d')
    var donutData2        = {
      labels: [
          '투표 참여율', 
          '투표 미참여율'
           
      ],
      datasets: [
        {
          data: [1,2],
          backgroundColor : ['#FF6384', '#6c757d'],
        }
      ],

    }
    var donutOptions2     = {
      maintainAspectRatio : false,
      responsive : true,
      cutoutPercentage: 65,
      legend: {
          display: false,
          position : 'left',
          align : 'start',
        labels: {pointStyle:'circle', usePointStyle:true}
      },
  	elements: {
  			center: {
  				text: '90%',
        color: '#FF6384', // Default is #000000
        fontStyle: 'Arial', // Default is Arial
        sidePadding: 20 // Defualt is 20 (as a percentage)
  			}
  		}
      
  	}     
    
    
    

    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    var donutChart2 = new Chart(donutChartCanvas2, {
      type: 'doughnut',
      data: donutData2,
      options: donutOptions2      
    })
	
	
    
    
})




</script>

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
					<li class="nav-item" ><a
						href="/project/main?c_Id=${pjt.c_Id}"  id="activityMenu" class="nav-link active" ><b>홈</b></a></li>
						
					<li class="nav-item" id = "activityMenu"><a class="nav-link " href="/project/issue/list?c_Id=${pjt.c_Id}"
						 id= "issueMenu">이슈</a></li>
					<li class="nav-item" id = "activityMenu"><a class="nav-link" href="#"
						 id= "issueMenu">칸반</a></li>
					<li class="nav-item" id = "activityMenu"><a class="nav-link" href="/project/calendar?c_Id=${pjt.c_Id}"
						 id= "issueMenu">캘린더</a></li>
					<li class="nav-item" id = "activityMenu"><a class="nav-link" href="/project/vote/list?c_Id=${pjt.c_Id}"
						 id= "issueMenu">투표</a></li>
						
				</ol>
				
				 <button type="button" class="btn btn-success float-right" onclick="location.href='/project/issue/insert?c_Id=${pjt.c_Id}'"style="text-align:center; float:right; background-color:#DC3545; border-color:#DC3545; font-family: Spoqa Han Sans; font-size:13px;">
								<i class="fas fa-edit"></i> <b>이슈 작성</b></button>
				
			</div>
						<!-- Main content -->
						<section class="content">
							<div class="container-fluid">
							<br>
								
<!--  진행상황 및 멤버 뷰 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div class="row">

			<div class="col-md-4">
			
			<div class="card">
              <div class="card-header">
                <h3 class="card-title">이슈 진행 현황</h3>

                <div class="card-tools">

                </div>
              </div>
              <div class="card-body">
				<div class="chart-responsive">
                <canvas id="donutChart1" style="min-height: 252px; height: 252px; max-height: 252px; max-width: 100%; display: block; width: 406px;" width="812" height="502" class="chartjs-render-monitor"></canvas>
             	 </div>

              </div>
              <!-- /.card-body -->
            </div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
              <div class="card-header">
                <h3 class="card-title">투표 참여율</h3>
              </div>
              <div class="card-body">
				<div class="chart-responsive">
                <canvas id="donutChart2" style="min-height: 252px; height: 252px; max-height: 252px; max-width: 100%; display: block; width: 406px;" width="812" height="502" class="chartjs-render-monitor"></canvas>
             	 </div>


              </div>
              <!-- /.card-body -->
            </div>
			</div>


			<div class="col-md-4">
			                <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">협업공간 멤버</h3>


                  </div>
                  <!-- /.card-header -->
                  <div class="card-body p-0">
                    <ul class="users-list clearfix">
                      <li>
                        <img src="${contextPath}/resources/dist/img/user1-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">Alexander Pierce</a>
                        <span class="users-list-date">Today</span>
                      </li>
                      <li>
                        <img src="${contextPath}/resources/dist/img/user8-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">Norman</a>
                        <span class="users-list-date">Yesterday</span>
                      </li>
                      <li>
                        <img src="${contextPath}/resources/dist/img/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">Jane</a>
                        <span class="users-list-date">12 Jan</span>
                      </li>
                      <li>
                        <img src="${contextPath}/resources/dist/img/user6-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John</a>
                        <span class="users-list-date">12 Jan</span>
                      </li>
                      <li>
                        <img src="${contextPath}/resources/dist/img/user2-160x160.jpg" alt="User Image">
                        <a class="users-list-name" href="#">Alexander</a>
                        <span class="users-list-date">13 Jan</span>
                      </li>
                      <li>
                        <img src="${contextPath}/resources/dist/img/user5-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">Sarah</a>
                        <span class="users-list-date">14 Jan</span>
                      </li>
                      <li>
                        <img src="${contextPath}/resources/dist/img/user4-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">Nora</a>
                        <span class="users-list-date">15 Jan</span>
                      </li>
                      <li>
                        <img src="${contextPath}/resources/dist/img/user3-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">Nadia</a>
                        <span class="users-list-date">15 Jan</span>
                      </li>
                    </ul>
                    <!-- /.users-list -->
                  </div>
                  <!-- /.card-body -->

                  <!-- /.card-footer -->
                </div>
			
			</div>
			

			
			</div>
								
<!-- 최근 등록된 이슈 및 투표 글 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
								<div class="row">
									<div class="col-md-6">
										<div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title"><i class="ion ion-clipboard mr-1"></i>최근 등록된 글</h3>

              </div>
              <!-- /.card-header -->
              
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table m-0">

                    <tbody>
                    <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
                                        <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
                                        <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
                                        <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
                                        <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
               
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->

            </div>
									</div>
									
									<div class="col-md-6">
										<div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title"><i class="ion ion-clipboard mr-1"></i>현재 진행중인 투표</h3>

              </div>
              <!-- /.card-header -->
              
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table m-0">

                    <tbody>
                    <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
                                        <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
                                        <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
                                        <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
                                        <tr>
                      <td>투표/이슈</td>
                      <td>글 제목</td>
                      <td>작성자</td>
                    </tr>
               
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->

            </div>
									</div>

								</div>
								
								
								
								
								
								
								
								
								
								
								
								
								<!-- Small boxes (Stat box) -->
								<div class="row">
									<div class="col-lg-3 col-6">
										<!-- small box -->
										<div class="small-box bg-info">
											<div class="inner">
												<h3>150</h3>

												<p>New Orders</p>
											</div>
											<div class="icon">
												<i class="ion ion-bag"></i>
											</div>
											<a href="#" class="small-box-footer">More info <i
												class="fas fa-arrow-circle-right"></i></a>
										</div>
									</div>
									<!-- ./col -->
									<div class="col-lg-3 col-6">
										<!-- small box -->
										<div class="small-box bg-success">
											<div class="inner">
												<h3>
													53<sup style="font-size: 20px">%</sup>
												</h3>

												<p>Bounce Rate</p>
											</div>
											<div class="icon">
												<i class="ion ion-stats-bars"></i>
											</div>
											<a href="#" class="small-box-footer">More info <i
												class="fas fa-arrow-circle-right"></i></a>
										</div>
									</div>
									<!-- ./col -->
									<!-- ./col -->
									<div class="col-lg-3 col-6">
										<!-- small box -->
										<div class="small-box bg-danger">
											<div class="inner">
												<h3>65</h3>
												<p>Unique Visitors</p>
											</div>
											<div class="icon">
												<i class="ion ion-pie-graph"></i>
											</div>
											<a href="#" class="small-box-footer">More info <i
												class="fas fa-arrow-circle-right"></i></a>
										</div>
									</div>
									<!-- ./col -->
									<div class="col-lg-3 col-6">
										<!-- small box -->
										<div class="small-box bg-teal">
											<div class="inner">
												<h3>${memberList.size()}</h3>
												<p>등록된 공간맴버</p>
											</div>
											<div class="icon">
												<i class="ion ion-person"></i>
											</div>
											<a href="#" class="small-box-footer" data-needpopup-show="#memberlist-popup">자세히 보기<i
												class="fas fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
								<!-- /.row -->
								<!-- Main row -->
								<div class="row">
									<!-- Left col -->
									<section class="col-lg-7 connectedSortable">


										<!-- TO DO List -->
										<div class="card">
											<div class="card-header">
												<h3 class="card-title">
													<i class="ion ion-clipboard mr-1"></i> 최근 등록한 이슈
												</h3>
											</div>
											<!-- /.card-header -->
											<div class="card-body">
												<ul class="todo-list" data-widget="todo-list">
													<li>
														 <span class="text">Design a
															nice theme</span> <!-- Emphasis label --> <small
														class="badge badge-danger"><i class="far fa-clock"></i>
															2 mins</small> <!-- General tools such as edit or delete-->
														<div class="tools">
															<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
														</div>
													</li>
													
												</ul>
											</div>
										</div>
										<!-- /.card -->
									</section>
									<!-- /.Left col -->
									<!-- right col (We are only adding the ID to make the widgets sortable)-->
									<section class="col-lg-5 connectedSortable">

										<!-- Map card -->
										<div class="card bg-gradient-primary">
											<!-- /.card-body-->
											<div class="card-footer bg-transparent">
												<div class="row">
													<div class="col-4 text-center">
														<div id="sparkline-1"></div>
														<div class="text-white">Visitors</div>
													</div>
													<!-- ./col -->
													<div class="col-4 text-center">
														<div id="sparkline-2"></div>
														<div class="text-white">Online</div>
													</div>
													<!-- ./col -->
													<div class="col-4 text-center">
														<div id="sparkline-3"></div>
														<div class="text-white">Sales</div>
													</div>
													<!-- ./col -->
												</div>
												<!-- /.row -->
											</div>
										</div>
										<!-- /.card -->


										<!-- Calendar -->
										<div class="card bg-gradient-success">
											<div class="card-header border-0">

												<h3 class="card-title">
													<i class="far fa-calendar-alt"></i> Calendar
												</h3>
												<!-- tools card -->
												<div class="card-tools">
													<!-- button with a dropdown -->
													<button type="button" class="btn btn-success btn-sm"
														data-card-widget="collapse">
														<i class="fas fa-minus"></i>
													</button>
													<button type="button" class="btn btn-success btn-sm"
														data-card-widget="remove">
														<i class="fas fa-times"></i>
													</button>
												</div>
												<!-- /. tools -->
											</div>
											<!-- /.card-header -->
											<div class="card-body pt-0">
												<!--The calendar -->
												<div id="calendar" style="width: 100%"></div>
											</div>
											<!-- /.card-body -->
										</div>
										<!-- /.card -->
									</section>
									<!-- right col -->
								</div>
								<!-- /.row (main row) -->
							</div>
							<!-- /.container-fluid -->
						</section>
						<!-- /.content -->
					</div>
					<!-- /.tab-pane -->
					
						</div>
					</div>
		<!-- /.nav-tabs-custom -->

<!-- /.content-wrapper -->
<!-- 정보변경 모달 팝업 내용 -->
<div id='update-popup' class="needpopup">
	<a href="#"></a>
	<p>
	<form id="projectupdate" action="/project/update" method="post">
		<p class="login-box-msg" style="padding-bottom: 10px">
			<input type="hidden" id="c_Id" name="c_Id" value="${pjt.c_Id}">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">이름</label>
			<input class="form-control" type="text" id="c_Name" name="c_Name"
				required value="${pjt.c_Name}">
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">설명</label>
			<textarea class="form-control" rows="3" id="c_Comment"
				name="c_Comment" required>${pjt.c_Comment}</textarea>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">관리자
				변경</label><br> <select name="mem_Id">
				<option value="${member.mem_Id}">${member.mem_Name}(${member.mem_Id})</option>
				<c:forEach var="itemList" items="${memberList}">
					<c:if test="${itemList.mem_Id != pjt.mem_Id}">
						<option value="${itemList.mem_Id}">${itemList.mem_Name}(${itemList.mem_Id})</option>
					</c:if>
				</c:forEach>
			</select>
		</p>
		<p class="login-box-msg" style="padding-bottom: 10px">
			<label style="font-family: Recipekorea; padding-bottom: 5px;">카테고리</label><br>
			<select name="c_Category">

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
			<button style="background-color: #dc3545;" type="submit"
				class="btn btn-block btn-success">협업공간삭제</button>
		</form>
	</span>
</div>
<!-- 맴버초대 모달 팝업 내용 -->
<div id='add-popup' class="needpopup">
	<div style="padding-bottom: 25px;">
		<h4 class="m-0 text-dark"
			style="font-family: Recipekorea; padding-bottom: 5px;">파트너 초대</h4>
		<span style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1;">
			많은 사람을 초대하여 원활한 의사소통으로 업무를 효율적으로 처리해보세요. 회사 동료뿐만 아니라 외부 협업자도 파트너로 초대할
			수 있습니다.</span>
	</div>

	<div style="padding-bottom: 25px;">
		<h4 class="m-0 text-dark"
			style="font-family: Recipekorea; padding-bottom: 5px;">파트너 아이디</h4>
		<input style="margin-bottom: 5px;" class="form-control" type="text"
			id="item_mem_Id" name="mem_Id" required> <span id="id_check"
			style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1;">
			이메일 주소를 입력하고 Enter키를 눌러 파트너들을 초대해 보세요.</span>
	</div>


	<div style="padding-bottom: 25px">
		<h4 class="m-0 text-dark"
			style="font-family: Recipekorea; padding-bottom: 5px;">초대 리스트</h4>
		<div id="applyList" class="form-control"
			style="height: 152px; width: 490px; white-space: pre-line; margin-bottom: 5px;"></div>
		<span style="font-size: 0.9em; line-height: 1.0; color: #a1a1a1;">

			초대 메세지를 보낼 파트너 아이디를 여기서 확인할 수 있습니다.</span>
	</div>
	<div>
		<span style="float: left; padding-right: 50px;">
			<form action="/news/insert" method="post" id="applyform">
				<input type="hidden" name="c_Id" value="${pjt.c_Id}">
				<button type="submit" id="insertsubmit"
					class="btn btn-block btn-success" style="width: 220px;">초대하기</button>
			</form>
		</span> <span>
			<button type="reset" class="btn btn-block btn-success"
				onclick="history.go(0);" style="width: 220px">취소</button>
		</span>
	</div>
</div>

<!-- 공간맴버 리스트 모달 팝업 내용 -->
<div id='memberlist-popup' class="needpopup">
	<div class="col-md-6" style="max-width: 100%;">
<table class="table table-striped projects" style="white-space: nowrap; overflow: hidden;"><div style="margin-bottom: 10px;">
<h4 class="m-0 text-dark" style="font-family: Recipekorea; max-width: 80%; display: contents;">공간맴버 리스트</h4></div>
		<tr style="background-color: #dc3545; color: white;">
			<td style="width:70%; vertical-align:top"><font size="3em"><b>회원정보</b></font></td>
			<td style="width:20%"><font size="3em"><b>등급</b></font></a>
			<td style="width:10%; vertical-align:top"><font size="3em"><b>추가</b></font></td></tr>
	<c:forEach var="memberItem" items="${memberList}" >
			<tr>
			<td style="width:70%; vertical-align:top"><font size="3em">
			<span>${memberItem.mem_Name}(${memberItem.mem_Id})</span></font></td>
			<td style="width:20%"><font size="3em"><b>${memberItem.grade}</b></font></td>
			<td style="width:10%; vertical-align:top"><font size="3em"><b>추가</b></font></td>
			</tr>
			</c:forEach>
</table>
</div>
</div>



