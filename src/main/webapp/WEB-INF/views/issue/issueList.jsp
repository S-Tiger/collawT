<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp"%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 협업공간명 불러오기로 수정할 것!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>협업공간명</h1>
            <small>협업공간 설명</small>
          </div>
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">

    <!-- card -->
      <div class="card">
      
        <!-- 표 윗부분 -->
        <div class="card-header">
        <ol class="breadcrumb float-sm-left">
          <li class="breadcrumb-item"><a href="#">협업공간 이슈</a></li>
          <li class="breadcrumb-item"><a href="#">칸반</a></li>
          <li class="breadcrumb-item"><a href="#">내가 작성한 이슈</a></li>
          <li class="breadcrumb-item"><a href="#">캘린더</a></li>
         </ol>
         <input type="button" value="이슈 작성" class="btn btn-success float-right" onclick="location.href='insert'">
        </div>
        <!-- /표 윗부분 -->
        
        <!-- 리스트 부분 -->
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <tbody>
                 <c:forEach var="issueList" items="${issueList}" >	
                  <tr>
                      <td>  ${issueList.mem_Name}    </td>
                      <td> <a href="/issue/read?i_Num=${issueList.i_Num}"> ${issueList.i_Name}</a>    </td>
                      <td>  ${issueList.i_Date}    </td>
                   </tr>
                   </c:forEach>
              </tbody>
          </table>
        </div>
        <!-- /리스트 부분 -->
        
        
      </div>
      <!-- /.card -->

    </section>
    <!-- /Main content -->
  </div>
  <!-- /.content-wrapper -->


<%@include file="../includes/footer.jsp"%>