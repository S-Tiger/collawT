<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
<link rel="stylesheet" href="/SRC2/modal/dist/needpopup.min.css">



<script type="text/javascript">


	
	
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
						
						<span style= "vertical-align:text-top;"
							id="q_Answer" name="q_Answer" class="badge badge-success"><c:out  value="${questionRead.q_Answer}" /></span>&nbsp;&nbsp;
							<span id="q_Subject" name="q_Subject"><b><c:out	value="${questionRead.q_Subject}" /></b></span>

							
							


						</div>
						

						
						<!-- /.card-header -->

						<div class="card-body">
						<span class="text-muted float-right"id="q_Date" name="q_Date" style="font-size:small">
								<c:out	value="${questionRead.q_Date}" /></span>
							<div class="user-block">
								
								<span id="q_Email" name="q_Email" style="font-size:10pt"> 
								<c:out value="${questionRead.q_Email}" /></span>

							</div>
							<br><br><br>
							
							
				
								<br>
							
							<!-- 내용 -->
								<p id="q_Content" name="q_Content"><c:out value="${questionRead.q_Content}" escapeXml="false"/></p>
						
							
							
							<br>
							<br>
							<br>
							 <input type="hidden" id="q_Num" name="q_Num"
								value="${questionRead.q_Num}" /> <br>
							<br>

			

							

						
						<a id="list_btn" class="btn btn-default btn-sm" href='#' style="color:#444; margin:3px;"> <i class="fas fa-list"></i>&nbsp;목록</a>

								
								<br><br>
						</div>

						<!-- /.card-body -->

						<!-- /.card -->
					</div>



					<!-- /.card -->
					
			</div>

<!-- /.card -->




<!-- 댓글 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->				

			<div class="col-md-6">
				<div class="card">

					
					<div id="replyList" style="max-height:631px; overflow:auto"></div>
					
					
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

