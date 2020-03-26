<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var dialog=$('#modal').dialog({
			autoOpen: false,
			height:300,
			width:700,
			modal:true
		});
		
		
		$('.reason').on('click',function(){
			var re = $(this).prev().val();
			console.log(re);
			$('#modal').html('<p>'+re+'</p>');
			dialog.dialog('open');
		})
	})
</script>
</head>
<body>
	<div id="modal" title="환불사유">
		
	</div>
	
	<div class="card mb-4">
		<div class="card_header">
			<i class="fas fa-table mr-1"></i>환불리스트
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>신청자</th>
							<th>환불날짜</th>
							<th>환불금액</th>
							<th>환불사유</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="refund">
							<tr>
								<td>${refund.ord_no }</td>
								<td>${refund.pm_name }</td>
								<td>${refund.refund_date }</td>
								<td>${refund.refund_point }</td>
								<td>
								<input type="hidden" value="${refund.refund_reason }">
									<button class="btn btn-primary reason">보기</button>
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