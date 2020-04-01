<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp"%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>협업공간명</h1>
            <small>협업공간 설명</small>
          </div>
<!--           <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">project</li>
            </ol>
          </div> -->
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
        <ol class="breadcrumb float-sm-left">
          <li class="breadcrumb-item"><a href="#">협업공간 이슈</a></li>
          <li class="breadcrumb-item"><a href="#">칸반</a></li>
          <li class="breadcrumb-item"><a href="#">내가 작성한 이슈</a></li>
          <li class="breadcrumb-item"><a href="#">캘린더</a></li>
         </ol>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body p-0">
          <table class="table table-striped projects">
              
              <tbody>
                 <c:forEach var="issueList" items="${issueList}" >	
                  <tr>
                      <td>  ${issueList.mem_Id}    </td>
                      <td>  ${issueList.i_Name}    </td>
                      <td>  ${issueList.i_DATE}    </td>
                   </tr>
                   </c:forEach>
              </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<%@include file="../includes/footer.jsp"%>