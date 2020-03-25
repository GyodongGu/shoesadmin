<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매회원 고객 리스트</title>
</head>
<body>
<br />
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>구매회원 목록
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>I D</th>
							<th>이 름</th>
							<th>회원상태</th>
							<th>생년월일</th>
							<th>이메일</th>
							<th>가입일자</th>
							<th>연락처</th>
							<th>우편번호</th>
							<th>주 소</th>
							<th>포인트</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.pm_no }</td>
								<td>${dto.pm_id }</td>
								<td>${dto.pm_name }</td>
								<td>${dto.pm_stat_cd }</td>
								<td>${dto.pm_birth }</td>
								<td>${dto.pm_email }</td>
								<td>${dto.pm_date }</td>
								<td>${dto.pm_tell }</td>
								<td>${dto.pm_post }</td>
								<td>${dto.pm_addr1 } ${dto.pm_addr2 } ${dto.pm_addr3 }</td>
								<td>${dto.point_now }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>