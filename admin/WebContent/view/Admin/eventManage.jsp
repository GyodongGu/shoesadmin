<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>관리자 공지사항 등록</title>

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
		
		
		$('.update').on('click',function(){
			var no = $(this).attr('name');
			var result = confirm('수정하시겠습니까?');
			if(result){
				location.href='${contextPath}/UpdateEventForm.do?notice_no='+no;
			}
			else{
				return false;
			}
		})
		$('.delete').on('click',function(){
			var no = $(this).attr('name');
			var result = confirm('공지사항을 삭제하시겠습니까?');
			if(result){
				location.href='${contextPath}/DeleteEvent.do?notice_no='+no;
			}
			else{
				return false;
			}
		})
		
	})
</script>

<c:choose>
	<c:when test='${msg == "noticeInsert"}'>
		<script>
			window.onload = function() {
				alert("공지사항을 등록했습니다.")
			}
		</script>
	</c:when>
	<c:when test='${msg == "noticeUpdate"}'>
		<script>
			window.onload = function() {
				alert("공지사항을 수정했습니다.")
			}
		</script>
	</c:when>
	<c:when test='${msg == "noticeDelete"}'>
		<script>
			window.onload = function() {
				alert("공지사항을 삭제했습니다.")
			}
		</script>
	</c:when>
</c:choose>

</head>
<body>
	<div id = "modal" title="공지사항 ">
	
	</div>
	<br>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>공지사항 및 이벤트 <span style="float: right">
				<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/InsertEventForm.do'">공지사항 등록</button>
			</span>
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
							<th>수정</th>
							<th>삭제</th>
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
										<td>

											<button class="btn btn-primary update" name="${smNotice.notice_no}" >수정</button>
										</td>
										<td>
											<button class="btn btn-primary delete" name="${smNotice.notice_no}" >삭제</button>
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