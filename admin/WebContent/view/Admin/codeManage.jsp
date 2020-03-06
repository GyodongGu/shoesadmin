<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<br>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">코드 ID</th>
				<th scope="col">코드 분류</th>
				<th scope="col">코드 이름</th>
				<th scope="col">사용 여부</th>
				<th scope="col">설명</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${codeList == null }">
					<tr>
						<td colspan="5">
							<b>등록된 거래내역이 없습니다.</b>
						</td>
					</tr>
				</c:when>
				<c:when test="${codeList != null }">
					<c:forEach items="${codeList}" var="CodeList">
						<tr>
							<th scope="row">${CodeList.code_id}</th>
							<td>${CodeList.code_type}</td>
							<td>${CodeList.code_name}</td>
							<td>${CodeList.code_use}</td>
							<td>${CodeList.code_explain}</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
</body>
</html>