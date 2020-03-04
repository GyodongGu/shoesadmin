<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 및 공지사항 업데이트</title>
</head>
<body>
	<br>
	<div>
		<div class="card text-center" style="width: 500px; margin: 0 auto;">
			<div class="card-header">이벤트 및 공지사항 수정</div>
			<div class="card-body">
				<form method="post" action="${contextPath}/view/Admin/sMemManage.do?id=${sMemInfo.id}">
					<table style="width: 450px;">
						<tr>
							<td>공지사항 번호</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}" disabled>
							</td>
						</tr>
						<tr>
							<td>공지사항 제목</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}">
							</td>
						</tr>
						<tr>
							<td>공지사항 날짜</td>
							<td>
								<input type="text" id="extraaddr1" class="form-control" value="${sMemInfo.id}" disabled>
							</td>
						</tr>
						<tr>
							<td>공지사항 내용</td>
							<td>
								<textarea class="form-control" id="exampleFormControlTextarea1" rows="15" cols="40">
									${sMemInfo.id}
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