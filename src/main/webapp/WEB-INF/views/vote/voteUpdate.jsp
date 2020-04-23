<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> -->

<script src = "${path}/ckeditor/ckeditor.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">

span[name="chargerspan"] {
	background-clip: padding-box;
    border: 1px solid #17a2b8;
    padding: 2px;
    margin: 2px;
    display: inline-block;
}

#row {margin-left:0px !important; margin-right:0px !important}


</style>
	
<script type="text/javascript">
		 $(document).ready(function(){
	
			 periodSetting();

			 	
			
			 var v_Num = $("#v_Num").val();
			 
			 //취소버튼 클릭시 리스트로 화면으로 이동
			$("#cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/issue/read?v_Num="+v_Num;
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
			 $('#v_Period').daterangepicker({
				locale: { format: 'YYYY/MM/DD'}
			 })
			 
			$("#periodNull").click(function(){
				
				periodModify();
			})
			
			$('#v_Period').change(function(){
				
				periodModify();
				
				
			})
			
			$('#v_Period').click(function(){
				
				periodModify();
				
				
			})
			

			
		  //캘린더 시작일/마감일 초기 세팅
			function periodSetting(){
				
				var v_Period = $("#v_Start").val()+' - '+ $("#v_End").val();
				document.updateForm.v_Period.value=v_Period;
				
				if($("#v_Start").val()=="" && $("#v_End").val()==""){
					
					$("#v_Period").css('background-color','#e9ecef');
					$("#v_Period").css('color','#e9ecef');
					$("#v_Period").attr('disabled',true)
					$("#periodNull").attr('checked',true)
					
					var today = new Date();
					var dd = today.getDate();
					var mm = today.getMonth()+1; //January is 0!
					var yyyy = today.getFullYear();

					if(dd<10) {
					    dd='0'+dd
					} 

					if(mm<10) {
					    mm='0'+mm
					} 

					today = yyyy+'/'+mm+'/'+dd;
				
				
					var v_Period = today+' - '+ today;
					document.updateForm.v_Period.value=v_Period;
			 	}					
					
					
				}
				
			
		  
		  
			function periodModify(){
				if($("#periodNull").is(":checked")==true){
					
					var v_Start = "";
					var v_End="";
					document.updateForm.v_Start.value=v_Start;
					document.updateForm.v_End.value=v_End;
					
					var v_PeriodCheck = "";
					document.updateForm.v_PeriodCheck.value=v_PeriodCheck;
					
					$("#v_Period").css('background-color','#e9ecef');
					$("#v_Period").css('color','#e9ecef');
					$("#v_Period").attr('disabled',true);
				}else{
					
					 $("#v_Period").css('background-color','#fff');
					$("#v_Period").css('color','#495057');
					$("#v_Period").attr('disabled',false)
					
					var v_Period = $("#v_Period").val();
					
					
						var v_PeriodCheck = $("#v_Period").val();
						document.updateForm.v_PeriodCheck.value=v_PeriodCheck;
						
						var v_Start = $("#v_PeriodCheck").val().substring(0,10);
						var v_End= $("#v_PeriodCheck").val().substring(13,23);
						
						
						document.updateForm.v_Start.value=v_Start;
						document.updateForm.v_End.value=v_End;
					
					
				}
			}
			

	</script>
	
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    

    <!-- Main content -->
    <form action="/project/vote/update" method="post" encType="UTF-8" name="updateForm">
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
     <div class="row" id="row">
     <div class="col-md-6">
       <div class="card card-primary">
			<div class="card-body">
          		
           
          		<input type="hidden" id = "v_Num" name="v_Num" value="${voteUpdate.v_Num}"/>
              
                <div class="form-group">
                <label for="inputName">제목</label>
                <input type="text" id = "v_Name" name="v_Name" class="form-control">
              </div>
              
              <div class="form-group">
             
                <label for="i_Content">내용</label>
                
                <textarea id="i_Content" name="i_Content" class="form-control" rows="4">
                <c:out value="${voteUpdate.i_Content}" /></textarea>
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
				        
				        <!-- /.card-body -->
				      </div>
				      <!-- /.card -->
				</div>
              

			
			<!--  여기부터 투표기능 만드세여~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~` -->

<div class="col-md-6">

<div class="card card-info" >
          
            <div class="card-body">
            
            
            <!-- 투표 주제 -->
               <div class="form-group">
                <label for="inputName">투표 주제</label>
                <input type="text" id = "v_Subject" name="v_Subject" class="form-control" value="${voteUpdate.v_Subject}">
              </div>
              
               <!-- 투표 항목 -->
              <div class="form-group">
                <label for="inputName">투표 항목</label>
                <a href="#"><button type="button" class="btn btn-block btn-default btn-xs float-right" style="width:80px; margin:1px">항목 추가</button></a>
                <input type="text" id = "vd_Content" name="vd_Content" class="form-control" value="${voteUpdate.v_Subject}">
                
              </div>
            
            
            <!-- 답변 선택 수 -->
            <div class="form-group">
                <label for="inputStatus">답변 선택 수</label>  
               <select class="form-control custom-select" id="v_Count" name="v_Count">
               	<option>1개 선택 가능</option>
               	<option>2개 선택 가능</option>
               	<option>3개 선택 가능</option>
               </select>
             </div>
			
              
      <!-- 투표상태 설정 -->
      <div class="form-group" id="voteStatus">
		<label for="inputStatus">이슈 상태</label><br>
		
		<c:forEach var="vrRead" items="${vrRead}" >
		<label>
		<input type="radio" id="ig_checked" name="ig_checked" value="${vrRead.VR_NUM}"
		
		
		<c:if test="${vrRead.VR_NUM == voteUpdate.vr_Num}">checked</c:if>> 
		<span style= "
		<c:if test="${vrRead.VR_NUM == 1}">background-color:#28a745;</c:if>
		<c:if test="${vrRead.VR_NUM == 2}">background-color:#6c757d;</c:if>

		"
		id="vr_Name" name="vr_Name" class="badge badge-success" >${igRead.vr_Name}</span>&nbsp;&nbsp;</label>
		</c:forEach>
		<input type="hidden" id="vr_Num" name="vr_Num" value="">
		
		

         </div>
              
        <!--협업공간ID -->
         <input id="c_Id" name="c_Id" type="hidden" value="${voteUpdate.c_Id}"/>

		
                
                 <!-- 캘린더 -->
               <div class="form-group">
                <div class="row">
                <div class="col-8">
                   <label for="inputStatus">기간</label>
                   </div>
                   
                   <div class="col-4" >
                   <div class="icheck-danger" style="text-align:right; ">
                    
                        <input type="checkbox" value="" id="periodNull" name="periodNull">
                       <label for="periodNull"><small>기간 미설정</small></label>
                      </div>
                      </div>
                      </div>

                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="far fa-calendar-alt"></i>
                      </span>
                    </div>
                    <input type="text" id = "v_Period" name="v_Period" class="form-control float-right">
                  </div>
                  
                    <input type="hidden" id = "v_PeriodCheck" name="v_PeriodCheck" value="">
                    <input type="hidden" id = "v_Start" name="v_Start" value="${voteUpdate.v_Start}">
                    <input type="hidden" id = "v_End" name="v_End" value="${voteUpdate.v_End}">
                  
              </div>
                <!-- /.캘린더 -->
           <br>
                
           <input type="submit" id = "submit" value="이슈 수정" class="btn btn-danger btn-sm float-right" style="margin:3px;">
          <input type="button" id = "cancel" value="수정 취소" class="btn btn-danger btn-sm float-right" style="margin:3px;" onclick="history.back(-1)">     
                    
                 </div>
              </div>
              </section>
             
        
    <!-- /.content -->

              </div>
              
  
  <!-- /.content-wrapper -->