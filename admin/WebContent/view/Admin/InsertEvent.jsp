<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">


$(document).ready(function(){
	$('.enroll').on('click',function(){
		var result = confirm('등록하시겠습니까?');
		if(result){
			return true;
		}else{
			return false;
		}
	})
})


function insertEvent(){
	if(frm.title.value==""){
		alert("공지사항 제목을 입력해주세요");
		frm.title.focus();
		return false;
	}
	if(frm.Content.value==""){
		alert("공지사항 내용을 입력해주세요.");
		frm.Content.focus();
		return false;
	}
}


</script>
</head>
<body>
	<br>
	<div>
		<div class="card text-center" style="width: 900px; margin: 0 auto;">
			<div class="card-header">공지사항 등록</div>
			<div class="card-body">
				<form method="post" id="frm" name="frm" action="${contextPath}/InsertEvent.do" onsubmit="return insertEvent()">
					<input type="text" id="title" name="title" class="form-control" placeholder="공지사항 제목">
					<br>
					<textarea class="form-control" id="Content" name="Content" rows="15" cols="40" placeholder="공지사항 내용을 입력해주세요"></textarea>
					<br>
					<button type="submit" class="btn btn-primary btn-lg btn-block enroll">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>