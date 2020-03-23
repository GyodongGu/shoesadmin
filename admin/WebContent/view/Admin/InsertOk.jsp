<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매회원 입력여부</title>
</head>
<body>
<div align="center">
		<div>
			<c:choose>
				<c:when test="${pass == 0 }">
					<script>
						alert('회원가입이 되지 않았습니다.');
						location.href = '${contextPath}/InsertSmem.do';
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert('회원가입이 완료되었습니다.');
						location.href = '${contextPath}/sMemManage.do';
					</script>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>