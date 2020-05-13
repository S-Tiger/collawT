<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 

<style>
.ib_product{
width: 100%;
	}
#content{

    margin-left: 0px;
}

</style>

<script>
  $(function () {
  //bar차트데이터
    
    var areaChartData = {
      labels  : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [
        {
          label               : '주간별 이슈 등록수',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : [28, 48, 40, 19, 86, 27, 90]
        }
        
      ]
    }
  //bar차트 
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = jQuery.extend(true, {}, areaChartData)
    var temp0 = areaChartData.datasets[0]
    barChartData.datasets[0] = temp0

    var barChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    var barChart = new Chart(barChartCanvas, {
      type: 'bar', 
      data: barChartData,
      options: barChartOptions
    })

  })
    </script>
    
    <div class="content-wrapper" >
    <div class="page_title">
    <span class="title"><b>주간 차트</b></span>
  </div>
  <div class="main_content">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
    
       <!-- BAR CHART -->
            <div class="card card">
              <div class="card-header">
                <h3 class="card-title">Bar Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            </div>
            
            <div class="col-md-6">
            <div class="card card">
              <div class="card-header">
                <h3 class="card-title">최근 문의내역</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
              <div class="card-body" style="min-height:290px">
                <div class="table-responsive">
                  <table class="table m-0">

                    <tbody>
              <c:choose>
			<c:when test="${fn:length(recentBoard)!=0}">
       <c:forEach var="recentBoarditem" items="${recentBoard}" >
                    <tr>
                      <td name="boarditem">
							<a style="color:black" href="/project/vote/read?c_Id=${recentBoarditem.C_ID}&v_Num=${recentBoarditem.I_NUM}">${recentBoarditem.q_Subject}</a>                      
                      </td>
                    </tr>
         </c:forEach>
            </c:when>
                 <c:otherwise>
                 <p style="text-align:center;"><small><br><br><br><br>최근 등록된 문의가 없습니다.</small></p>
                 </c:otherwise>
                 </c:choose>
                                      
               
                    </tbody>
                  </table>
                </div>


              </div>
              <!-- /.card-body -->
            </div>
            </div>
            
            
            </div>
            </div>
            </section>
            </div>
            </div>