<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function (){
		
 	$("#projectInsert").click(function(){
 			if ($('#c_Name').val() == ''){
				alert("협업공간명을 입력해주세요! :D");
				return false;
			}

 			
 			
			if ($('#c_Category').val() == '00') {
				alert("카테고리를 선택해주세요! :D");
				return false;

			}
		})

	});
</script>

<!-- <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> -->

 
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
          <form action="/project/insert" method="post" encType="UTF-8">
        <div class="card-body p-0">
              <div class="form-group">
              <div class="col-md-6">
                <label for="inputName">협업공간명</label>
                <input type="text" name="c_Name" id="c_Name" class="form-control">
              </div>
              </div>
              <div class="form-group">
              <div class="col-md-6">
                <label for="inputDescription">협업공간 설명</label>
                <textarea name="c_Comment" id="c_Comment" class="form-control" rows="2"></textarea>
              </div>
              </div>
              <div class="form-group">
              <div class="col-md-6">
                <label for="inputStatus">카테고리</label>
               <select class="form-control custom-select" name= "c_Category" id="c_Category">
                  <option value="00" hidden>선택해주세요</option>
                  <option value="01">협업관련 업무관리</option>
                  <option value="02">개인 업무관리</option>
                  <option value="03">학업관련 과제관리<option>
                </select>
              </div>
              </div>
              <input type="hidden"  name = mem_Id value= ${member.mem_Id }>
              <div class="col-md-6">
          <input type="submit" value="협업공간 생성" class="btn btn-success float-right" id="projectInsert" >
          </div>
      </form>
        </div>
        <!-- /.card-body -->
	
      <!-- /.card -->
    <!-- /.content -->
    </section>
    </div>
  <!-- /.content-wrapper -->


