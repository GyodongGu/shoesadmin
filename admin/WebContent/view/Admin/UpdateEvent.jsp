<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 및 공지사항 업데이트</title>
<script type="text/javascript">
	// 비밀번호 미입력시 경고창
	function checkValue() {
		if (!document.updateForm.UpdateNoticeTitle.value) {
			alert("제목을 입력하지 않았습니다.");
			return false;
		} else if (!document.updateForm.UpdateNoticeContent.value) {
			alert("내용을 입력하지 않았습니다.");
			return false;
		} 
	}
</script>
</head>
<body>
	<br>
	<div>
		<div class="card text-center" style="width: 500px; margin: 0 auto;">
			<div class="card-header">이벤트 및 공지사항 수정</div>
			<div class="card-body">
				<form name="updateForm" method="post" action="${contextPath}/UpdateEvent.do" onsubmit="return checkValue()">
					<table style="width: 450px;">
						<tr>
							<td>공지사항 번호</td>
							<td>
								<input type="text" id="UpdateNoticeNo" name="UpdateNoticeNo" class="form-control" value="${sMemInfo.notice_no}" readonly>
							</td>
						</tr>
						<tr>
							<td>공지사항 제목</td>
							<td>
								<input type="text" id="UpdateNoticeTitle" name="UpdateNoticeTitle" class="form-control" value="${sMemInfo.notice_title}">
							</td>
						</tr>
						<tr>
							<td>공지사항 날짜</td>
							<td>
								<input type="text" id="UpdateNoticeDate" name="UpdateNoticeDate" class="form-control" value="${sMemInfo.notice_date}" readonly>
							</td>
						</tr>
						<tr>
							<td>공지사항 내용</td>
							<td>
								<textarea class="form-control" id="UpdateNoticeContent" name="UpdateNoticeContent" rows="15" cols="40">
									${sMemInfo.notice_content}
								</textarea>
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