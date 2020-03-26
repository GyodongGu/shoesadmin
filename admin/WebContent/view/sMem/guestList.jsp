<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				/* $('#dialog').dialog({
					autoOpen:false
					
				}) */
				$('.ord').on(
						"click",
						function() {
							var clickedRow = $(this).parent().parent();
							console.log(clickedRow.attr('id'));
							window.open(
									'${pageContext.request.contextPath}/GuestOrdList.do?pm_no='
											+ clickedRow.attr('id'), '주문내역',
									'width=800, height=500');

							//$('#list').dialog("open");
						});
			});
</script>
</head>
<body>
	<br>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>고객리스트
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>생년월일</th>
							<th>email</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>구매이력</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="glist">
							<tr id="${glist.pm_no }" onmouseover="this.style.backgroundColor='#FFFF00'" onmouseout="this.style.backgroundColor=''">
								<td>${glist.pm_name }</td>
								<td>${glist.pm_id }</td>
								<td>${glist.pm_birth }</td>
								<td>${glist.pm_email }</td>
								<td>${glist.pm_tell }</td>
								<td>${glist.pm_addr1 }</td>
								<td>
									<button class="ord btn btn-primary">구매이력</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>