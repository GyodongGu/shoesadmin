<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<div>
		<div class="card text-center" style="width: 500px; margin: 0 auto;">
			<div class="card-header">판매회원 정보 수정 등록</div>
			<div class="card-body">
				<form method="post" action="${contextPath}/view/Admin/sMemManage.do?id=${sMemInfo.id}">
					<table style="width: 450px;">
						<tr>
							<td>판매자 ID</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}" disabled>
							</td>
						</tr>
						<tr>
							<td>가게 이름</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}" >
							</td>
						</tr>
						<tr>
							<td>판매자 이름</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}" disabled>
							</td>
						</tr>
						<tr>
							<td>판매자 전화번호</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}">
							</td>
						</tr>
						<tr>
							<td>사업자 번호</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}">
							</td>
						</tr>
						<tr>
							<td>판매자 우편번호</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}">
							</td>
						</tr>
					</table>
					<br>
					<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>