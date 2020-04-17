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
			 getFileList();
			 
			//캘린더 시작일/마감일 구하기
			var i_Period = $("#i_Start").val()+' - '+ $("#i_End").val();
			document.updateForm.i_Period.value=i_Period;
			
			
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
			
			 
			//캘린더 기능
			 $('#i_Period').daterangepicker({
				locale: { format: 'YYYY/MM/DD'}
			 })
			 
			//파일첨부 ajax
			$('#a_File').change(function(e){
				var formData = new FormData();
				var inputFile = $("input[name='a_File']");
				var files = inputFile[0].files;
				var i_Num = $("#i_Num").val();
				
				console.log(files);
			
				
				for(var i=0; i<files.length; i++){
					formData.append("a_File", files[i]);
					
				}
				formData.append("i_Num", i_Num)
				console.log(formData);
				
				$.ajax({
					url:'/appendix/fileUpload',
					processData:false,
					contentType:false,
					data:formData,
					type:'POST',
					success:function(result){
					
						getFileList();
					}
				});
			});
		})
		
			//첨부된 파일 리스트
		 function getFileList(){
			$.ajax({
				type:"get",
				url : "${path}/appendix/fileread?i_Num=${issueUpdate.i_Num}",
						
				success:function(result){
					var str="";
					if(result!=0){
						str+='<table class="table">';
						
		                    
						for(var i in result){
							str+='<tr><td><span id="a_RealName" name="a_RealName">'+result[i].a_RealName+'</span></td>';
							str+='<td><span id="a_Size" name="a_Size">'+(result[i].a_Size/1000)+'kb</span></td>';
							str+='<td><input type="hidden" id="a_Num" name="a_Num" value="'+result[i].a_Num+'"/></td>';
							str+='<td class="text-right py-0 align-middle">';
							str+='<div class="btn-group btn-group-sm" ><a href="javascript:fileDelete('+result[i].a_Num+')" class="btn btn-danger" ><i class="fas fa-trash" ></i></a></div>';
							str+='</td></tr>'
						}
						
						str+='</tbody></table>'
						
					}else{
						str+='<p style="text-align:center;"><small><br><br>첨부된 파일이 없습니다.</small></p>'
						
					}
					$("#fileList").html(str);
				}
			})
			
			
			
			
		}
		 
			//첨부파일 삭제
		  	function fileDelete(a_Num){
			
					$.ajax({
						url : "/appendix/filedelete",
						data : {"a_Num" : a_Num},
						type : 'post',
						success:function(){
							
							getFileList();
							
						}
					})
					
				
					
			}
	
	</script>
	
	
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    

    <!-- Main content -->
    <form action="/issue/update" method="post" encType="UTF-8" name="updateForm">
    <section class="content-header">
	 <div class="container-fluid">
	  <div class="row mb-2">
     <div class="col-md-6">
     </div>
     
     <div class="col-md-6">
     </div>
     </div>
     </div>
     </section>
     
     <section class="content">
     <div class="row">
     <div class="col-md-6">
       <div class="card card-primary">
			<div class="card-body">
          		<div class="form-group">
          		
          		<div class="form-group">
           
          <input type="hidden" id = "i_Num" name="i_Num" value="${issueUpdate.i_Num}"/>
              
                <label for="i_Name">이슈명</label>
                <input type="text" id="i_Name" name="i_Name" value="${issueUpdate.i_Name}" class="form-control"/>
              </div>
              
              <div class="form-group">
             
                <label for="i_Content">이슈 내용</label>
                
                <textarea id="i_Content" name="i_Content" class="form-control" rows="4">
                <c:out value="${issueUpdate.i_Content}" /></textarea>
                <script>
                CKEDITOR.replace( 'i_Content', {
                	allowedContent:true,
                	toolbar :[['NewPage','Preview','Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','-',
                	'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Outdent','Indent','HorizontalRule','Link','Unlink','-',
                	'Find','Replace','SelectAll','Image','Youtube','Table','SpecialChar'],
                	'/',['Styles','Format','Font','FontSize','Undo','Redo'],['TextColor','BGColor'],['Cut','Copy','Paste','PasteText'],['Source']],
                	filebrowserImageUploadUrl: '/issue/imageUpload',
                	});
                                
                 				        CKEDITOR.on('dialogDefinition', function( ev ){
                				            var dialogName = ev.data.name;
                				            var dialogDefinition = ev.data.definition;
                				         
                				            switch (dialogName) {
                				                case 'image': //Image Properties dialog
                				                    //dialogDefinition.removeContents('info');
                				                    //dialogDefinition.removeContents('Link'); // 링크탭 제거
                				                    dialogDefinition.removeContents('advanced'); // 자세히탭 제거
                				                    break;
                				            }
                				        });
					</script>
              </div>
              <small>드래그 앤 드롭으로 이미지를 쉽게 추가할 수 있습니다.</small>
              </div>
              </div>
              </div>
              </div>
              
              
              
              <!--  파일 첨부 -->

		<div class="col-md-6">
		
		<div class="card card-info" >
          
            <div class="card-body">
            <label for="inputName">첨부파일</label>
            
            <a href="#"><button type="button" class="btn btn-block btn-default btn-xs float-right" onclick="oncilck=document.all.a_File.click()" style="width:50px; margin:1px">추가</button></a>
            <input type="file" id="a_File" name="a_File" style="display:none" multiple="multiple"/>
           <br>
               
				<div id="fileList"></div>

              <br>
              
            </div>
            
          </div>
              
              <div class="card card-info" >
              <div class="card-body">
              
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
                    <input type="hidden" id = "i_Start" name="i_Start" value="${issueUpdate.i_Start}">
                    <input type="hidden" id = "i_End" name="i_End" value="${issueUpdate.i_End}">
                  </div>
                </div>
                <!-- /.캘린더 -->
                
                <input type="submit" id = "submit" value="이슈 수정" class="btn btn-success float-right" style="margin:3px;">
          <input type="button" id = "cancel" value="수정 취소" class="btn btn-success float-right" style="margin:3px;" onclick="location.href='list'">
                
              </div>
              </section>
             
        
    <!-- /.content -->
     </form>
              </div>
  
  <!-- /.content-wrapper -->


<%@include file="../includes/footer.jsp"%>
