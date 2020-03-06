<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 유저 업데이트</title>
</head>
<body>
	<br>
	<div>
		<div class="card text-center">
			<div class="card-header">${smUpdate.sm_id}판매회원 정보 수정 등록</div>
			<div class="card-body">
				<form method="post" action="${contextPath}/sMemManage.do?id=${smUpdate.sm_id}">
					<input type="text" id="UpdateShopName" class="form-control" value="${smUpdate.shop_name}">
					<br>
					<input type="text" id="UpdateSmPw" class="form-control" value="${smUpdate.sm_pw}">
					<br>
					<input type="text" id="UpdateSmTell" class="form-control" value="${smUpdate.sm_tell}">
					<br>
					<input type="text" id="UpdateBusinessNo" class="form-control" value="${smUpdate.business_no}">
					<br>
					<input type="text" id="UpdatePost" class="form-control" value="${smUpdate.sm_post}">
					<br>
					<input type="text" id="UpdateAddr2" class="form-control" value="${smUpdate.sm_addr1}">
					<br>
					<input type="text" id="UpdateAddr2" class="form-control" value="${smUpdate.sm_addr2}">
					<br>
					<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>