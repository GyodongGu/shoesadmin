<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 등록</title>
</head>
<body>
	<br>
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
										<td>${smNotice.notice_content}</td>
										<td>
											<button class="btn btn-primary" onclick="location.href='${contextPath}/view/Admin/UpdateEvent.jsp'">수정</button>
										</td>
										<td>
											<button class="btn btn-primary" onclick="location.href='${contextPath}/view/Admin/DeleteEvent.jsp'">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					<tbody>
				</table>
				<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/view/Admin/InsertEvent.jsp'">공지사항 등록</button>
			</div>
		</div>
	</div>
</body>
</html>