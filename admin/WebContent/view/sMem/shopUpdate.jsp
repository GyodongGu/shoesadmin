<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>You Shoes</title>
<style type="text/css">
form {
	margin: 0 auto;
	width: 250px;
}
</style>
</head>
<body>
	<div>
		<form method="post" enctype="multipart/form-data" action="../FileUpload.do">
			<!-- 파일첨부는 form method을 post로만 해야 한다. -->
			<input type="file" name="uploadfile"> <input type="text" name="desc">
			<button type="button">등록</button>
		</form>
	</div>
</body>
</html>