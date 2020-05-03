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
#userImage1 {
width:70px !important; height:70px !important;
}

#userImage2 {
width:70px !important; height:70px !important;
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
    var ig_Num_1 = $('#ig_Num_1').val();
    var ig_Num_2 = $('#ig_Num_2').val();
    var ig_Num_3 = $('#ig_Num_3').val();
    var ig_Num_4 = $('#ig_Num_4').val();
    var ig_Name_1 = $('#ig_Name_1').val();
    var ig_Name_2 = $('#ig_Name_2').val();
    var ig_Name_3 = $('#ig_Name_3').val();
    var ig_Name_4 = $('#ig_Name_4').val();
    var centerText = '총 '+(parseInt(ig_Num_1)+parseInt(ig_Num_2)+parseInt(ig_Num_3)+parseInt(ig_Num_4))+'건';
    
    var donutChartCanvas1 = $('#donutChart1').get(0).getContext('2d')
    var donutData1        = {
      labels: [
    	  ig_Name_1, ig_Name_2, ig_Name_3, ig_Name_4           
      ],
      datasets: [
        {
          data: [ig_Num_1,ig_Num_2,ig_Num_3,ig_Num_4],
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
  				text: centerText,
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

				
			</div>
						<!-- Main content -->
						<section class="content" >
							<div class="container-fluid">
							<br>
								
<!--  진행상황 및 멤버 뷰 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div class="row">

			<div class="col-md-4">
			
			<div class="card">
              <div class="card-header">
                <h3 class="card-title" ><b>이슈 진행 현황</b></h3>
				
				
				<c:forEach var="igCountitem" items="${igCount}" >
                <input type="hidden" value="${igCountitem.IGCOUNT}" id="ig_Num_${igCountitem.IG_NUM}">
                </c:forEach>
                <c:forEach var="igNameitem" items="${igCount}" >
                <input type="hidden" value="${igNameitem.IG_NAME}" id="ig_Name_${igNameitem.IG_NUM}">
                </c:forEach>
                
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
                <h3 class="card-title"><b>투표 참여율</b></h3>
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
                    <h3 class="card-title"><b>협업공간 멤버</b></h3>
                    	 <h3 class="card-title float-right" style="text-align:right">총 ${memberList.size()}명</h3>


                  </div>
                  <!-- /.card-header -->
                  <div class="card-body p-0" style="min-height: 292px; overflow:auto;">
                  
                    <ul class="users-list clearfix">
                    <c:forEach var="member" items="${memberList}" >
                      <li>
                        <c:if test="${member.mem_File != null }">
						<img alt="프로필사진"
						src="/member/getByteImage?mem_Id=${member.mem_Id}" class="img-circle elevation-2" id="userImage1"/>
						</c:if>
						<c:if test="${member.mem_File == null }">
						<img src="${contextPath}/resources/dist/img/profile.jpg" 
						class="img-circle elevation-2" id="userImage2" alt="프로필사진">
						</c:if>
						<br>
                        <a class="users-list-name" href="#">${member.mem_Name}</a>
                        
                      </li>
                    </c:forEach>
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
                <h3 class="card-title"><i class="ion ion-clipboard mr-1"></i><b>최근 등록된 글</b></h3>

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
                <h3 class="card-title"><i class="ion ion-clipboard mr-1"></i><b>현재 진행중인 투표</b></h3>

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



