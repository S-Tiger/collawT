<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

<script type="text/javascript">



$(document).ready(function() {
	
	
	
	//댓글 목록 항상 호출
	getReplyList();
	
	var formObj = $("form[name='readForm']");
	var formReply = $("form[name='replyForm']");

	
	
	//북마크 체크 변수
	var checkbook = 0
	
	//북마크 체크 확인
	bookcheck();
	
	
	console.log("22222222222"+checkbook);
	//수정페이지로 이동 jquery
 	$("#update_btn").on("click", function() {
		
		formObj.attr("action", "/project/issue/update");
		formObj.attr("method", "get");
		formObj.submit();
	})

	//삭제 jquery
	$("#delete_btn").on("click", function() {
		if(confirm("삭제하시겠습니까?")){
			formObj.attr("action", "/project/issue/delete");
			formObj.attr("method", "post");
			formObj.submit();
			alert("삭제되었습니다.");
		}
		
	})
	
	
		//댓글 입력 버튼 클릭 시 이벤트
	$("#replyInsert_btn").on("click", function() {
		var r_Content = $("#r_Content").val();
		//댓글 입력 비어있으면 아무 이벤트도 일어나지 않게 하기
		if(r_Content==''){
			return false;
		
	//
		 }else{
			$.ajax({
				url:"/reply/insert",
				type:'post',
				data:{
					r_Content: $("#r_Content").val(),
					i_Num : $("#i_Num").val(),
					c_Id : $("#c_Id").val()
				},
				success:function(data){
					
                        $("#r_Content").val("");
                        getReplyList();
					
				}
			})
		}
	})
	
	
	//북마크 버튼 이벤트
	$("#bookmarkinsert").on("click", function() {
		console.log("1121212"+checkbook);
		if(checkbook == 0){
		$.ajax({
			url:"/bookmark/insert",
			type:'post',
			data:{
				i_Num : $("#i_Num").val(),
			},
			success:function(data){
				var bookcount = $("#bookmarkcount").html();
				console.log(bookcount);
				if(data == 1){
                    alert("북마크에 등록하셨습니다.");
				$("#bookmarkinsert").css('color','#f8f9fa');
				$("#bookmarkinsert").css('background-color', '#dc3545');
				checkbook = 1;
				bookcount++;
				console.log(bookcount);
				$("#bookmarkcount").html(bookcount);
				}
			}
		})
		}else if(checkbook == 1){
			$.ajax({
				url:"/bookmark/delete",
				type:'post',
				data:{
					i_Num : $("#i_Num").val(),
				},
				success:function(data){
					var bookcount = $("#bookmarkcount").html();
					if(data == 1){
	                    alert("북마크를 해제하셨습니다.");
					$("#bookmarkinsert").css('color','#444');
					$("#bookmarkinsert").css('background-color', '#f8f9fa');
					checkbook = 0;
					bookcount--;
					console.log(bookcount);
					$("#bookmarkcount").html(bookcount);
				}
					}
				})
			}
		})
	
		
		//북마크 추가 상태 확인 메소드
	function bookcheck() {
		$.ajax({
			url:"/bookmark/bookmarkCheck",
			type:'get',
			data:{
				i_Num : $("#i_Num").val(),
			},
			success:function(data){
				if(data == 1){
				$("#bookmarkinsert").css('color','#f8f9fa');
				$("#bookmarkinsert").css('background-color', '#dc3545');
				console.log(checkbook);
				checkbook = 1;
				console.log(checkbook);
				}
				
			}
		})
	}
	
})

	//댓글 목록
	function getReplyList(){
		$.ajax({
			type:"get",
			url : "${path}/reply/list?i_Num=${issueRead.i_Num}",
			
			success:function(result){
				
				var str="";
				if(result!=0){
					for(var i in result){
						str+='<div class="card-footer card-comments">';
						
						str+='<div class="card-comment">';
						str+='<img alt="User Image" width="50" height="50"	src="/member/getByteImage?mem_Id='+result[i].mem_Id+'" class="img-circle elevation-2"/>';
						str+='<div class="comment-text">';
						str+='<span class="username">'+result[i].mem_Name;
						str+='<span class="text-muted float-right">'+result[i].r_Date+'</span>';
						str+='<small>'+('${member.mem_Id}'==result[i].mem_Id ? "&nbsp;&nbsp;&nbsp;<a href='javascript:replyModifyForm("+result[i].r_Num+",\""+result[i].r_Content+"\")'>수정</a>" : "")+'</small>';
						str+='<small>'+('${member.mem_Id}'==result[i].mem_Id ? "&nbsp;&nbsp;&nbsp;<a href='javascript:replyDelete("+result[i].r_Num+")'>삭제</a>" : "")+'</small></span>';
						
						str+='<p id="replyContent'+result[i].r_Num+'" name="replyContent">'+result[i].r_Content+'</p>';
						str+='</div></div></div>';
						str+='<input type="hidden" id="r_Num" name="r_Num" value="'+result[i].r_Num+'" />';
					}
					
				}else{
					str+='<div class="card-footer card-comments">';
					
					str+='<div class="card-comment">';
					str+='<div class="comment-text">';
					str+='<p style="text-align:center;"><small><br><br>작성된 댓글이 없습니다.<br>이 글의 첫 번째 댓글을 작성해주세요 :D</small></p>'
					str+='</div></div></div>';
				}
				$("#replyList").html(str);
			}
				
		})
		
	}


	//댓글 삭제
  	function replyDelete(r_Num){
	
		if(confirm("삭제하시겠습니까?")){
			
			$.ajax({
				url : "/reply/delete",
				data : {"r_Num" : r_Num},
				type : 'post',
				success:function(){
					alert("삭제되었습니다.");
					getReplyList();
					
				}
			})
			
		}
			
	}
	
	
	
	//댓글 수정창 열기
  	function replyModifyForm(r_Num, r_Content){
		
		var str="";
		
		str+='<div><textarea id="r_Content'+r_Num+'" name="r_Content'+r_Num+'" class="form-control">'+r_Content+'</textarea></div>';
		str+='<small><a href="javascript:replyUpdate('+r_Num+')" id="replyInsert_btn" name="replyInsert_btn">입력</span></small>&nbsp;&nbsp;';
		str+='<small><a href="javascript:replyCancle('+r_Num+',\''+r_Content+'\')" id="replyCancel_btn" name="replyCancel_btn">취소</span></small>';
	
		
		$('#replyContent'+r_Num).html(str);	
			
	} 

  
	
	//댓글 수정 db
	function replyUpdate(r_Num){
		var updateContent = $('[name=r_Content'+r_Num+']').val();
	    
	    $.ajax({
	        url : '/reply/update',
	        type : 'post',
	        data : {'r_Content' : updateContent, 'r_Num' : r_Num},
	        success : function(data){
	           
	        	getReplyList();
	        }
	    });
	}
	
	//댓글 입력 취소 버튼 클릭시
	function replyCancle(r_Num, r_Content){
		var str="";
		str+='<p id="replyContent'+r_Num+'" name="replyContent">'+r_Content+'</p>';
			
		$('#replyContent'+r_Num).html(str);	
	}

	
	
</script>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
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

		<div class="row" id="row">
			<div class="col-md-6">

				<!-- Box Comment -->
<!-- 본문 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				
			
				<form name="readForm" role="form">

					<div class="card card-widget">
						<div class="card-header">
						
						<span style= "vertical-align:text-top;
							<c:if test="${issueRead.ig_Num == 1}">background-color:#6c757d;</c:if>
							<c:if test="${issueRead.ig_Num == 2}">background-color:#007bff;</c:if>
							<c:if test="${issueRead.ig_Num == 3}">background-color:#ffc107;</c:if>
							<c:if test="${issueRead.ig_Num == 4}">background-color:#28a745;</c:if>
							"
							id="ig_Name" name="ig_Name" class="badge badge-success"><c:out  value="${issueRead.ig_Name}" /></span>&nbsp;&nbsp;
							<span id="i_Name" name="i_Name"><b><c:out	value="${issueRead.i_Name}" /></b></span>
							
							
							<div class="btn-group float-right">
                          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="border:white;background-color:white;height:20px;padding-top: 0px;">
                          </button>
                          <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; right: 0px; transform: translate3d(0px, 38px, 0px);">
                           <c:if test="${member.mem_Id == issueRead.mem_Id}">
                            <li><a class="dropdown-item" href='/project/issue/update?c_Id=${issueRead.c_Id}&i_Num=${issueRead.i_Num}'><small>수정</small></a></li>
                            <li><a class="dropdown-item" href="#" id="delete_btn"><small>삭제</small></a></li>
                            </c:if>
                            <li><a class="dropdown-item" href="#"><small>다른 협업공간으로 복사</small></a></li>
                            <li><a class="dropdown-item" href="#"><small>URL 복사</small></a></li>
                          </ul>
                        </div>
							
		
        <!-- 본인만 글 수정, 삭제 가능-->
						
						<%-- <c:if test="${member.mem_Id == issueRead.mem_Id}">
						
									<a id="delete_btn" class="btn btn-default btn-sm float-right" style="color:#444; margin:3px;"> <i class="fas fa-trash" ></i>&nbsp;삭제</a>
									<a id="update_btn" class="btn btn-default btn-sm float-right" href='/project/issue/update?c_Id=${issueRead.c_Id}&i_Num=${issueRead.i_Num}' style="color:#444; margin:3px;"> <i class="fas fa-pencil-alt"></i>&nbsp;수정</a>
                             
                          
						</c:if> --%>
						
                        
                        
						</div>
						

						
						<!-- /.card-header -->
						<div class="card-body">
						<span class="text-muted float-right"id="i_Date" name="i_Date" style="font-size:small">
								<c:out	value="${issueRead.i_Date}" /></span>
							<div class="user-block">
							
							


								<!-- 멤버이미지 넣기 -->
								
								<img alt="프로필사진" width="50" height="50"
								src="/member/getByteImage?mem_Id=${issueRead.mem_Id}" class="img-circle elevation-2"/>
								<span class="username" id="mem_Name" name="mem_Name">
								<c:out value="${issueRead.mem_Name}" /></span>
								<span class="description"id="mem_Id" name="mem_Id">
								<c:out	value="${issueRead.mem_Id}" /></span> 
								
								
							</div>
							<br><br><br>
							
							
				
								<br>
							
							<!-- 내용 -->
								<p id="i_Content" name="i_Content"><c:out value="${issueRead.i_Content}" escapeXml="false"/></p>
						
							
							
							<br>
							<br>
							<br>
							 <input type="hidden" id="i_Num" name="i_Num"
								value="${issueRead.i_Num}" /> <br>
							<br>

<!-- 이슈정보~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<div class="card card-primary collapsed-card">
            <div class="card-header" style="height:30px; padding-left:13px; padding-right:16px; padding-top:4px; background-color:#e87c87;">
             <label><small><b>이슈 정보 더 보기</b></small></label>
                <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-plus"></i></button>
              </div>
            </div>
            <div class="card-body p-0">
            
             <table class="table">
              <tbody>
		           <tr>
		           <td>
		           <div class="row">
		           <ion-icon name="calendar-outline" style="font-size:24"></ion-icon>&nbsp;
					<span style="font-size: 0.8em;"><b>기간</b></span>
					</div>
		           		<!-- 시작일/종료일-->
		           		<div class="row" style="margin-left:9px">
							<c:if test="${not empty issueRead.i_Start&& not empty issueRead.i_End}">
							
								<span id="i_Start" name="i_Start" class="username ">
								<small><c:out value="${issueRead.i_Start}~"/></small></span>
								<span id="i_End" name="i_End" class="username">
								<small><c:out value="${issueRead.i_End}"/></small></span>
							</c:if>
							<c:if test="${empty issueRead.i_Start&& empty issueRead.i_End}">
							
								<span class="username"><small>기간 미설정</small></span>
							</c:if>
							</div>
		           </td>
		           </tr>
		        
		           <tr>
					<td>
					<div class="row">
					<i class="fas fa-user-friends"></i>&nbsp;
					<span style="font-size: 0.8em;"><b>이슈 담당자</b></span>
					</div>
					<div id="chargerListCheck">
							<c:forEach var="chargerList" items="${chargerList}" >
							
								<div class="row" style="margin:9px">
								<div class="user-block-sm">	
								<img alt="프로필사진" width="30" height="30"
								src="/member/getByteImage?mem_Id=${chargerList.MEM_ID}" class="img-circle"/>
								<span class="username" id="ch_mem_Name" name="mem_Name">
								<small><c:out value=" ${chargerList.MEM_NAME}"/></small></span>
								<span class="description"id="mem_Id" name="mem_Id">
								<small><c:out	value="(${chargerList.MEM_ID})"/></small></span>
								</div>
								</div>
								
								</c:forEach>
					</div>
				
							</td>
							
							</tr>
							</tbody>
              </table>
            </div></div>				
<!-- 첨부파일 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				


<!-- 첨부된 파일 없으면 창 아예 안보이게  -->		
<c:if test="${not empty file}">
					<div class="card card-info">
                        <div class="card-header" style="height:30px; padding-left:13px; padding-right:16px; padding-top:4px; background-color:#e87c87;">
             <label><small><b>첨부파일</b></small></label>
                <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-minus"></i></button>
              </div>
            </div>
            <div class="card-body p-0">
              <table class="table">

                <tbody>

				  <c:forEach var="file" items="${file}" >
                  <tr>
                    <td><small><span id="a_RealName" name="a_RealName">${file.a_RealName}</span></small></td>
                    <td><span id="a_Size" name="a_Size"><small>${file.a_Size/1000}kb</small></span></td>
                    <td class="text-right py-0 align-middle">
                      <a href="/appendix/download?a_Num=${file.a_Num}"><i class="fas fa-download"></i></a>
                    </td>
                 </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
           <!--  /.card-body -->
          </div>
          <br>
          </c:if>
          <!-- /.card -->
          
          <!-- 이거 나중에 기능 넣기 -->
							
							<!-- 숫자 카운트 넣기 -->
							<button type="button" class="btn btn-default btn-sm" id = "bookmarkinsert"style="color:#444; margin:3px;">
								<i class="fas fa-bookmark"></i> 북마크
							</button>
							

						
						<a id="list_btn" class="btn btn-default btn-sm" href='list?c_Id=${issueRead.c_Id}' style="color:#444; margin:3px;"> <i class="fas fa-list"></i>&nbsp;목록</a>

								
								<br><br>
						</div>

						<!-- /.card-body -->

						<!-- /.card -->
					</div>

					<!-- /.col -->
					<div class="col-md-6">
						<!-- Box Comment -->

					</div>

					<!-- /.card -->
					
			</div>
			</form>

<!-- /.card -->




<!-- 댓글 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				

			<div class="col-md-6">
				<div class="card">

					
					<div id="replyList"></div>
					
					<!-- 댓글  입력-->
					<div class="card-footer" id="replyInput" name="replyInput">

						
							<img class="img-fluid img-circle img-sm"
								src="/member/getByteImage?mem_Id=${member.mem_Id}" alt="Alt Text" width="50" height="50" >
							
							<div class="img-push">
								<textarea id="r_Content" name="r_Content" class="form-control"	placeholder="댓글을 입력하세요"></textarea>
									
									
									<small><a href="#" id="replyInsert_btn" name="replyInsert_btn">입력</a></small>
																		
									<input type="hidden" id="i_Num" name="i_Num" value="${issueRead.i_Num}" />
									<input type="hidden" id="c_Id" name="c_Id" value="${issueRead.c_Id}" />
									
								
							</div>
					
					</div>
					<!-- /댓글 입력 -->
				</div>
			</div>
			<div class="row">
				<div class="col-12"></div>
			</div>
			</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->