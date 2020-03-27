<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var dialog=$('#modal').dialog({
			autoOpen: false,
			height:600,
			width:900,
			modal:true
		}); 
		$('.contents').on('click',function(){
			var i = $(this).prev().val();
			$('#modal').html('<p>'+i+'</p>');
			dialog.dialog('open');
		})
	})
</script>
</head>
<body>
	<div id = "modal" title="공지사항 ">
	
	</div>
	<h1 class="mt-4">메인보드(Dashboard) ${nid}</h1>
	<br>
	<!-- 내부 전체 감싸는 부분 -->
	<div class="row">
		<!-- 월별 영역 차트 부분  -->
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i>월별 영역 차트
				</div>
				<div class="card-body">
					<canvas id="myAreaChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
		<!-- // 월별 영역 차트 부분  -->
		<!-- 월별 바 차트 부분  -->
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar mr-1"></i>월별 바 차트
				</div>
				<div class="card-body">
					<canvas id="myBarChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
		<!-- // 월별 바 차트 부분  -->
			
		
	</div>
	<!-- // 내부 전체 감싸는 부분 -->
	
		<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>공지사항 및 이벤트 
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>공지사항 번호</th>
							<th>공지사항 제목</th>
							<th>공지사항 날짜</th>
							<th>공지사항 내용</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${sMemNotice == null }">
								<tr>
									<td colspan="6">
										<b>등록된 공지사항이 없습니다.</b>
									</td>
								</tr>
							</c:when>
							<c:when test="${sMemNotice != null }">
								<c:forEach items="${sMemNotice}" var="smNotice">
									<tr>
										<td>${smNotice.notice_no}</td>
										<td>${smNotice.notice_title}</td>
										<td>${smNotice.notice_date}</td>
										<td>
											<input type="hidden" class="nc" name="nc" value="${smNotice.notice_content }"/>
											<button class="btn btn-primary contents" >내용보기</button>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					<tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
