<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<br>
	<div>
		<div class="card text-center" style="width: 900px; margin: 0 auto;">
			<div class="card-header">공지사항 등록</div>
			<div class="card-body">
				<form method="post" action="${pageContext.request.contextPath}/view/Admin/eventManage.jsp">
					<input type="text" id="extraaddr1" class="form-control" placeholder="공지사항 제목">
					<br>
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="40" placeholder="공지사항 내용을 입력해주세요"></textarea>
					<br>
					<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>