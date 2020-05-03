<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />





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
}


</style>

<script type="text/javascript">
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
	
    
	$('#myform').click(function(event) {
		
		var button_Id = event.target.getAttribute('id');
		var mem_Id = $('#mem_Id').val();
		var c_Id = $('#c_Id').val();
		console.log(button_Id)
		//초대 수락을 위한 ajax
		if (button_Id == 'acceptsubmit') {
			$.ajax({
			url : '${contextPath}/news/accept?mem_Id='+mem_Id+'&c_Id='+c_Id,
			type : 'get',
			success : function(data) {
				if (data == 1) {
				alert('수락하셨습니다.');
				setCookie('apply', 'active', 1)
				location.reload();
						}
					}
				})
		
		}else if(button_Id == 'rejectsubmit'){//초대 거절을 위한 ajax
			$.ajax({
				url : '${contextPath}/news/reject?mem_Id='+mem_Id+'&c_Id='+c_Id,
				type : 'get',
				success : function(data) {
					if (data == 1) {
					alert('거절하셨습니다.');
					setCookie('apply', 'active', 1)
					location.reload();
						}
					}
				}) 
		}
	
	})
    
    
})
  

		
</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="content-header" style="height: 100px">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<div>
						<h1 class="m-0 text-dark"
							style="font-family: Recipekorea; max-width: 80%; display: contents;">내 공간</h1>
					</div>
					<div>
					<p class="breadcrumb float-sm-left" style="position: absolute; margin-top: 10px">나만의 이슈와 내가 쓴 글을 한번에 관리하세요 :D</p>
					</div>
					</div>
			</div>
		</div>
	</div>
	<div class="col-md-9" style="max-width: 100%;">
		<div class="card">
			<div class="card-header p-2">
				<ol class="nav nav-pills" style="font-family: Spoqa Han Sans; font-size:15px; margin:0px; border:none; padding-inline-start: 0px;  width:400px; float:left;  ">
					<li class="nav-item" ><a class="nav-link active" style="background-color:#DC3545;"
						href="/personal/main?mem_Id=${member.mem_Id}"  id="activityMenu" ><b>홈</b></a></li>

					<li class="nav-item" ><a class="nav-link"
						href="/personal/list?mem_Id=${member.mem_Id}" >내 이슈</a></li>
					<li class="nav-item" ><a class="nav-link " 
						href="/personal/search/myBoardlist?mem_Id=${member.mem_Id}" id="activityMenu">내가 쓴 글</a></li>
					<li class="nav-item" ><a class="nav-link"
						href="#" data-toggle="tab" id="activityMenu">내가 쓴 댓글</a></li>
					
				</ol>
				
								
			</div>

			
						<!-- Main content -->
						<section class="content" >
							<div class="container-fluid">
							<br>
								
<!--  새로운 소식 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div class="row">
			<div class="col-md-7">
				<div class="card">
              <div class="card-header">
                <h3 class="card-title"><b>새로운 소식</b></h3>

              </div>
              <!-- /.card-header -->
              
              <div class="card-body">
                <div class="timeline timeline-inverse">
                	<c:forEach var="newspeeditem" items="${newspeed}">
							 <c:choose>
							 <c:when  test= "${newspeeditem.type eq '1'}">
							<div>
								<i class="fas fa-envelope bg-primary"></i>

								<div class="timeline-item">
									<span class="time"><i class="far fa-clock"></i> ${newspeeditem.ap_Date}</span>

									<h3 class="timeline-header">
										<a href="#">${newspeeditem.c_Name}</a>에서 가입 요청이 전달되었습니다.
									</h3>
									<div class="timeline-body">
									<div class="row" style="padding : 7px">
										<c:if test="${newspeeditem.mem_File != null }">
										<img alt="프로필사진" width="25" height="25"
										src="/member/getByteImage?mem_Id=${newspeeditem.mem_Id}" class="img-circle elevation-1"/>
										</c:if>
										<c:if test="${newspeeditem.mem_File == null }">
										<img src="${contextPath}/resources/dist/img/profile.jpg" width="25" height="25"
										class="img-circle elevation-1" alt="프로필사진">
										</c:if>
									&nbsp;${newspeeditem.mem_Name}(${newspeeditem.mem_Id})님께서 회원님을&nbsp;<a href="#"><b>${newspeeditem.c_Name}</b></a>에 초대하셨습니다. </div></div>
									<div class="timeline-footer" id="timeline-footer">
									<form  id = "myform" action="/news/accept" method="post" style="display: inline;  margin: 5;">
									<input type="hidden" name="c_Id" id="c_Id" value="${newspeeditem.c_Id}">
									<input type="hidden" name="mem_Id" id="mem_Id" value="${newspeeditem.mem_Id}">
										<a id = "acceptsubmit" href="#" class="btn btn-primary btn-sm" style="color: white;">수락</a>
										<a id = "rejectsubmit" href="#" class="btn btn-danger btn-sm" style="color: white;">거절</a>
										</form>
									</div>
								</div>
							</div>
							</c:when>
							
							 <c:when  test= "${newspeeditem.type eq '2'}">
							<div>
								<i class="fas fa-envelope bg-primary"></i>

								<div class="timeline-item">
									<span class="time"><i class="far fa-clock"></i> ${newspeeditem.ap_Date}</span>

									<h3 class="timeline-header">
										<a href="#">${newspeeditem.c_Name}</a>에 새 이슈가 등록되었습니다.
									</h3>
									<div class="timeline-body">${newspeeditem.i_Name}</div>
									<div class="timeline-footer" id="timeline-footer">
									</div>
								</div>
							</div>
							</c:when>
							
							<c:when  test= "${newspeeditem.type eq '3'}">
							<c:if test="${newspeeditem.mem_Id != member.mem_Id}">
							<div>
								<i class="fas fa-comments bg-warning"></i>

								<div class="timeline-item">
									<span class="time"><i class="far fa-clock"></i> ${newspeeditem.ap_Date}</span>

									<h3 class="timeline-header">
										<a href="#">${newspeeditem.mem_Name}</a>님이 댓글을 남기셨습니다.
									</h3>
									<div class="timeline-body">${newspeeditem.i_Content}</div>
									<div class="timeline-footer" id="timeline-footer">
									</div>
								</div>
							</div>
							</c:if>
							</c:when>
							</c:choose>
							  </c:forEach>
							  
							  
							  
							  
<%-- 							  
							  <c:forEach var="item" items="${notifyList}">
							<div>
								<i class="fas fa-envelope bg-primary"></i>

								<div class="timeline-item">
									<span class="time"><i class="far fa-clock"></i> ${applylist1.ap_Date}</span>

									<h3 class="timeline-header">
										<a href="#">${applylist1.c_Name}</a>에서 가입 요청이 전달되었습니다.
									</h3>
									<div class="timeline-body">${applylist1.mem_Name}님께서 회원님을  ${applylist1.c_Name}에 초대하셨습니다. </div>
									<div class="timeline-footer" id="timeline-footer">
									<form  id = "myform" action="/news/accept" method="post" style="display: inline;  margin: 5;">
									<input type="hidden" name="c_Id" id="c_Id" value="${applylist1.c_Id}">
									<input type="hidden" name="mem_Id" id="mem_Id" value="${applylist1.mem_Id}">
										<a id = "acceptsubmit" href="#" class="btn btn-primary btn-sm" style="color: white;">수락</a>
										<a id = "rejectsubmit" href="#" class="btn btn-danger btn-sm" style="color: white;">거절</a>
										</form>
									</div>
								</div>
							</div>
							  </c:forEach>
							  
							  
                  
                  <c:forEach var="item" items = "${notifyList}">
						<div class="post">						
							<div class="user-block">
								
								<span class="username"  id = "test11" > <a href="/notify/update?c_Id=${item.c_Id}&i_Num=${item.i_Num}">${item.mem_Id}
										</a> <a href="#" class="float-right btn-tool"><i
										class="fas fa-times"></i></a>
								</span> <span class="description">${item.i_Date}
									</span>
							</div>
							<!-- /.user-block -->
							<p>${item.i_Content}</p>

							
						</div>
						</c:forEach>
						
											<c:forEach var="reply" items = "${replyList}">
						<div class="post">						
							<div class="user-block">
								<img class="img-circle img-bordered-sm"
									src="${contextPath}/resources/dist/img/user1-128x128.jpg" alt="user image">	
								
								<span class="username"  id = "test44" > <a href="/notify/replyupdate?c_Id=${reply.c_Id}&i_Num=${reply.i_Num}">${reply.mem_Id}
										</a> <a href="#" class="float-right btn-tool"><i
										class="fas fa-times"></i></a>
								</span> <span class="description">
									</span>
							</div>
							<!-- /.user-block -->
							<p>${reply.i_Content}</p>

							
						</div>
						</c:forEach>  --%>
					<div>
                        <i class="far fa-clock bg-gray"></i>
                      </div>	
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->

            </div>
            
            
            

            </div>
            
            		
    <!--  이슈/투표 등 정보 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->        

			<div class="col-md-5">
			
			<div class="card">
              <div class="card-header">
                <h3 class="card-title" ><b>내 담당 이슈 진행 현황</b></h3>

              </div>
              <div class="card-body">
				<div class="chart-responsive">
                <canvas id="donutChart1" style="min-height: 252px; height: 252px; max-height: 252px; max-width: 100%; display: block; width: 406px;" width="812" height="502" class="chartjs-render-monitor"></canvas>
             	 </div>

              </div>
              <!-- /.card-body -->
            </div>
			
				<div class="card">
              <div class="card-header">
                <h3 class="card-title"><b>내 담당 이슈 리스트</b></h3>
              </div>
              <div class="card-body">
				<div class="table-responsive">
                  <table class="table m-0">

                    <tbody>
                    <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
                                        <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
                                        <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
                                        <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
                                        <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
               
                    </tbody>
                  </table>
                </div>


              </div>
              <!-- /.card-body -->
            </div>


				<div class="card">
              <div class="card-header">
                <h3 class="card-title"><b>참여하지 않은 투표</b></h3>
              </div>
              <div class="card-body">
				<div class="table-responsive">
                  <table class="table m-0">

                    <tbody>
                    <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
                                        <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
                                        <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
                                        <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
                                        <tr>
                      <td>협업공간명</td>
                      <td>글 제목</td>
                    </tr>
               
                    </tbody>
                  </table>
                </div>


              </div>
              <!-- /.card-body -->
            </div>
			

			
			</div>

					</div>
							</div>
							<!-- /.container-fluid -->
						</section>
						<!-- /.content -->

		
<!-- /.content-wrapper -->

  