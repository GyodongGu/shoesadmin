<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<br>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>배송 송장번호 입력 페이지
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>송장번호</th>
							<th>주문일자</th>
							<th>배송자 성함</th>
							<th>배송자 전화번호</th>
							<th>배송 우편번호</th>
							<th>배송 주소1</th>
							<th>배송 주소2</th>
							<th>배송 주소3</th>
							<th>배송 비고</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.ord_no }</td>
								<td>
									<input type="text" id="${dto.ord_no }" size="8" style="" placeholder="${dto.invoice_no }" />
								</td>
								<td>${dto.dlvy_date }</td>
								<td>${dto.dlvy_name }</td>
								<td>${dto.dlvy_tell }</td>
								<td>${dto.dlvy_post }</td>
								<td>${dto.dlvy_addr1 }</td>
								<td>${dto.dlvy_addr2 }</td>
								<td>${dto.dlvy_addr3 }</td>
								<td>${dto.dlvy_remark }</td>
								<td>
									<input type="button" style='color:white; background-color:#007BFF; border-radius: 10px; text-align: center; display: inline-block; font-size: 16px; margin: 4px 2px; padding: 10px; text-decoration: none; border: none;' class="checkBtn" value="수정" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(".checkBtn").click(function() {

			var str = ""
			var tdArr = new Array();
			var checkBtn = $(this);

			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var ord = td.eq(0).text();
			var ord3 = td.eq(1).find("input").val();

			$.ajax({
				url : "${pageContext.request.contextPath}/SetDelivery.do",
				type : 'POST',
				data : {
					'ordno' : ord,
					'invoiceno' : ord3
				},
				success : function(result) {
					alert("송장번호가 수정되었습니다.");
				}
			})
		})
	</script>
</body>
</html>