<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<title>판매 회원 관리</title>
</head>
<body>
	<br>
	<div class="card text-center" style="width: 1000px; margin: 0 auto;">
		<div class="card-header">판매 회원 관리</div>
		<div class="card-body">
			<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='${pageContext.request.contextPath}/view/Admin/InsertSmem.jsp'">판매 회원 등록</button>
		</div>
	</div>
	<br>
	<div class="card mb-4" style="width: 1000px; margin: 0 auto;">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>판매회원 테이블
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>판매자 ID</th>
							<th>가게 이름</th>
							<th>판매자 이름</th>
							<th>판매자 전화번호</th>
							<th>사업자 번호</th>
							<th>판매자 우편번호</th>
						</tr>
					</thead>
					<tbody>
						<%-- <c:forEach items="${}" var="">
							<tr>
								<th scope="row">${}</th>
								<td>${}</td>
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