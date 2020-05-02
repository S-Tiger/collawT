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
								
<!--  진행상황 및 리스트 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
			<div class="row">

			<div class="col-md-4">
			
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
			</div>
			
			<div class="col-md-4">
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
			</div>


			<div class="col-md-4">
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
								
<!-- 소식 및 초대 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
								<div class="row">
									<div class="col-md-6">
										<div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title"><i class="ion ion-clipboard mr-1"></i><b>새로운 소식</b></h3>

              </div>
              <!-- /.card-header -->
              
              <div class="card-body p-0">
                <div class="table-responsive">
                  
                  <c:forEach var="item" items = "${notifyList}">
						<div class="post">						
							<div class="user-block">
								<%-- <img class="img-circle img-bordered-sm"
									src="${contextPath}/resources/dist/img/user1-128x128.jpg" alt="user image"> --%>	
								
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
						
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->

            </div>
									</div>
									
									<div class="col-md-6">
										<div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title"><i class="ion ion-clipboard mr-1"></i><b>내가 받은 초대</b></h3>

              </div>
              <!-- /.card-header -->
              
              <div class="card-body p-0">
                
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
		
<!-- /.content-wrapper -->

  