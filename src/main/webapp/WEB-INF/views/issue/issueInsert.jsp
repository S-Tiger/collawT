<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp"%>

<script src = "${path}/ckeditor/ckeditor.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		
		//글쓰기 빈 값 안되게 검사
		$("#submit").click(function(){
			var i_Name = $("#i_Name").val();
			var c_Id = $("#c_Id").val();
			var i_Groupnum = $("#i_Groupnum").val();
			var i_Start = $("#i_Period").val().substring(0,10);
			var i_End= $("#i_Period").val().substring(13,23);
			
			
			if(i_Name==''){
				alert("이슈명을 입력하세요");
				document.insertForm.i_Name.focus();
				return false; 
			}
			
			if(c_Id==''){
				alert("협업공간ID를 입력하세요");
				document.insertForm.c_Id.focus();
				return false; 
			}
			if(i_Groupnum==''){
				alert("이슈그룹번호를 입력하세요");
				document.insertForm.i_Groupnum.focus();
				return false; 
			}
			
			
			document.insertForm.i_Start.value=i_Start;
			document.insertForm.i_End.value=i_End;

			document.insertForm.submit();
			
		});
		
		
		//캘린더 기능
		 $('#i_Period').daterangepicker({
			locale: { format: 'YYYY/MM/DD'}
		 })
		 
		//파일첨부 ajax
		$('#file').on("click", function(e){
			var formData = new FormData();
			var inputFile = $("input[name=file']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			for(var i=0; i<file.length; i++){
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url:'/issue/fileUpload',
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				success:function(result){
					alert("uploaded");
				}
			});
		});
	
	});
	
</script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <form name = insertForm action="/issue/insert" method="post" encType="UTF-8">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            
          </div>
          <div class="col-sm-6">

          </div>
        </div>
      </div>
      <!-- /.container-fluid -->
    </section>
    

    <!-- Main content -->
    <section class="content">
    <div class="row">
     <div class="col-md-6">
      <div class="card card-primary">
        
        <div class="card-body">
        	<div class="form-group">
          
              <div class="form-group">
             
                <label for="inputName">이슈명</label>
                <input type="text" id = "i_Name" name="i_Name" class="form-control">
              </div>
              
              <div class="form-group">
             
                <label for="inputDescription">이슈 내용</label>
                
                <textarea name="i_Content" id="i_Content" class="form-control" rows="4" style="width:100px;">              </textarea>
                <script>
           
                //CK에디터 적용
					 CKEDITOR.replace("i_Content", {
						filebrowserUploadUrl :"/issue/imageUpload"
					   	
					});
                
				        CKEDITOR.on('dialogDefinition', function( ev ){
				            var dialogName = ev.data.name;
				            var dialogDefinition = ev.data.definition;
				         
				            switch (dialogName) {
				                case 'image': //Image Properties dialog
				                    //dialogDefinition.removeContents('info');
				                    dialogDefinition.removeContents('Link');
				                    dialogDefinition.removeContents('advanced');
				                    break;
				            }
				        });
					</script>
              </div>
             
              <div class="form-group">
              
                <label for="inputStatus">담당자</label>
               <select class="form-control custom-select">
                  <option selected disabled>Select one</option>
                  <option>나중에 담당자명 리스트로 가져오기</option>
                </select>
              </div>
             
             <div class="form-group">
             
                <label for="inputStatus">협업공간명</label>
               <select class="form-control custom-select">
                  <option selected disabled>Select one</option>
                  <option>나중에 협업공간명 리스트로 가져오기</option>
                </select>
                </div>
                
               <!-- 캘린더 -->
                <div class="form-group">
                   <label for="inputStatus">기간</label>

                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="far fa-calendar-alt"></i>
                      </span>
                    </div>
                    <input type="text" id = "i_Period" name="i_Period" class="form-control float-right">
                    <input type="hidden" id = "i_Start" name="i_Start" value="">
                    <input type="hidden" id = "i_End" name="i_End" value="">
                  </div>
                </div>
                <!-- /.캘린더 -->
                
                
                <!--협업공간ID,작성일,회원아이디  hidden   회원아이디와 협업공간ID는 나중에 바꾸기-->
                협업공간ID는 나중에 세션에서 끌어오기<input name="c_Id" id="c_Id" type="text"><br>
				
		<!-- 멤버ID는 나중에 세션에서 끌어오기<input name="mem_Id" type="text"><br> -->
		이슈그룹번호는 나중에 세션에서 끌어오기<input name="i_Groupnum" id="i_Groupnum" type="text"><br>
				
              </div>
        <div class="row">
        <div class="col-sm-6">
          <input type="submit" id = "submit" value="이슈 작성" class="btn btn-success float-right" style="margin:3px;">
          <input type="button" id = "cancel" value="작성 취소" class="btn btn-success float-right" style="margin:3px;" onclick="location.href='list'">
        </div>
        <br><br><br>
        
      </div>
      
      
      
        </div>
        
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
</div>

<!--  파일 첨부 -->
<div class="col-md-6">
<div class="card card-info" >
          
            <div class="card-body p-0">
              <table class="table">
                <thead>
                  <tr>
                    <th>파일명</th>
                    <th>파일 크기</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="file" items="${file}" >

                  <tr>
                    <td><span id="a_RealName" name="a_RealName">${file.a_RealName}</span></td>
                    <td><span id="a_Size" name="a_Size">${file.a_Size}</span></td>
                    <td><input type="hidden" id="a_Num" name="a_Num" value="${file.a_Num}"/></td>
                    <td class="text-right py-0 align-middle">
                      <div class="btn-group btn-group-sm">
                        
                        <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                      </div>
                    </td>
                    </tr>
                    </c:forEach>
                 
                </tbody>
              </table>
              
            </div>
            
          </div>
          <input type="button" id = "addFile" name = "addFile" value="파일 첨부" class="btn btn-success float-right" style="margin:3px; background-color:gray" onclick="oncilck=document.all.file.click()"/>
          <input type="file" id="file" name="file" style="display:none" multiple="multiple" enctype="multipart/form-data"/>
          <!--  -->
    </section>
    <!-- /.content -->
    </form>
  </div>
  <!-- /.content-wrapper -->


<%@include file="../includes/footer.jsp"%>
