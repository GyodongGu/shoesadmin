<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<div class="card text-center" style="width: 1000px; margin: 0 auto;">
		<div class="card-header">공지사항 관리</div>
		<div class="card-body">
			<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='${pageContext.request.contextPath}/view/Admin/InsertEvent.jsp'">공지사항 등록</button>
		</div>
	</div>
	<br>
	<div class="card mb-4" style="width: 1000px; margin: 0 auto;">
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
						<%-- <c:forEach items="${}" var="">
							<tr>
								<th scope="row">${}</th>
								<td>${}</td>
								<td>${}</td>
								<td>${}</td>
							</tr>
						</c:forEach> --%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>