<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 등록</title>
</head>
<body>
	<br>
	<div class="card mb-4" style="width: 1000px; margin: 0 auto;">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>공지사항 및 이벤트
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered">
					<tr>
						<th>공지사항 번호</th>
						<th>공지사항 제목</th>
						<th>공지사항 날짜</th>
						<th>공지사항 내용</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					<c:choose>
						<c:when test="${sMemList == null }">
							<tr>
								<td colspan="6">
									<b>등록된 회원이 없습니다.</b>
								</td>
							</tr>
						</c:when>
						<c:when test="${sMemList != null }">
							<c:forEach items="${sMemNotice}" var="sMemNotice">
								<tr>
									<td>${sMemNotice.notice_no}</td>
									<td>${sMemNotice.notice_title}</td>
									<td>${sMemNotice.notice_date}</td>
									<td>${sMemNotice.notice_content}</td>
									<td>
										<button onclick="location.href='${contextPath}/view/Admin/UpdateEvent.jsp'">수정</button>
									</td>
									<td>
										<button onclick="location.href='${contextPath}/view/Admin/DeleteEvent.jsp'">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
				<button type="button" class="btn btn-primary float-right" onclick="location.href='${contextPath}/view/Admin/InsertEvent.jsp'">공지사항 등록</button>
			</div>
		</div>
	</div>
</body>
</html>