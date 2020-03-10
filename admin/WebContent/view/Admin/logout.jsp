<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
		// 세션초기화
		session.invalidate();
		// "로그아웃됨"  loginForm.jsp로 이동
	%>
	<script>
		alert('로그아웃되었습니다.');
		location.href = '${request.getRequestURL().toString().replace(request.getRequestURI(),'')}/youshoes/view/login.jsp';
	</script>
</body>
</html>