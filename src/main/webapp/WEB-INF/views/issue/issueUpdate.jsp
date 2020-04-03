<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>

<!-- <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> -->

<script src = "${path}/ckeditor/ckeditor.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script type="text/javascript">
		 $(document).ready(function(){
			 
			 var i_Num = $("#i_Num").val();
			 
			 //취소버튼 클릭시 리스트로 화면으로 이동
			$("#cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/issue/read?i_Num="+i_Num;
			})
			
			//글쓰기 빈 값 안되게 검사
			$("#submit").click(function(){
				var i_Name = $("#i_Name").val();
			
				if(i_Name==''){
					alert("이슈명을 입력하세요");
					document.updateForm.i_Name.focus();
					return false; 
				}
				
				
				document.insertForm.submit();
				
			});
			
		})
	
	</script>
	
	
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
        <div class="card-body p-0">
        
        
          <form action="/issue/update" method="post" encType="UTF-8" name="updateForm">
          <input type="hidden" id = "i_Num" name="i_Num" value="${issueUpdate.i_Num}" readonly="readonly"/>
              <div class="form-group">
              <div class="col-md-6">
                <label for="i_Namee">이슈명</label>
                <input type="text" id="i_Name" name="i_Name" value="${issueUpdate.i_Name}" class="form-control"/>
              </div>
              </div>
              <div class="form-group">
              <div class="col-md-6">
                <label for="i_Content">이슈 내용</label>
                
                <textarea id="i_Content" name="i_Content" class="form-control" rows="4">
                <c:out value="${issueUpdate.i_Content}" /></textarea>
                <script>
                CKEDITOR.replace("i_Content");
                
					/* CKEDITOR.replace("i_Content", {
						filebrowserUploadUrl :"/ckeditorimageUpload.do"
					    filebrowserImageUploadUrl: 'MacaronicsServlet?command=ckeditor_upload'	
					}); */
					</script>
              </div>
              </div>
              <div class="form-group">
              <div class="col-md-6">
                <label for="inputStatus">담당자</label>
               <select class="form-control custom-select">
                  <option selected disabled>Select one</option>
                  <option>나중에 담당자명 리스트로 가져오기</option>
                </select>
              </div>
              </div>
             <div class="form-group">
             <div class="col-md-6">
                <label for="inputStatus">협업공간명</label>
               <select class="form-control custom-select">
                  <option selected disabled>Select one</option>
                  <option>나중에 협업공간명 리스트로 가져오기</option>
                </select>
                </div>
                <!--협업공간ID,작성일,회원아이디  hidden   회원아이디와 협업공간ID는 나중에 바꾸기-->
                <!-- 협업공간ID는 나중에 세션에서 끌어오기<input name="c_Id" type="text"><br> -->
				
		<!-- 멤버ID는 나중에 세션에서 끌어오기<input name="mem_Id" type="text"><br> -->
		<!-- 이슈그룹번호는 나중에 세션에서 끌어오기<input name="i_Groupnum" type="text"><br> -->
				
              </div>
        <div class="row">
        <div class="col-sm-6">
          <input type="submit" id="submit" value="수정" class="btn btn-success float-right">
          <input type="button" id="cancel_btn" value="취소" class="btn btn-success float-right">
        </div>
        <br><br><br>
      </div>
      </form>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<%@include file="../includes/footer.jsp"%>
