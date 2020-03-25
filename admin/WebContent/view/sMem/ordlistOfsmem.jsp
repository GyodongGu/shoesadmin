<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath}/view/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>구매이력
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>제품</th>
							<th>제품이름</th>
							<th>구매날짜</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>제품제품</th>
							<th>제품이름</th>
							<th>구매날짜</th>
							
						</tr>
					</tfoot>
					<tbody>
					<c:forEach items="${ordlist }" var="olist">
						<tr onmouseover="this.style.backgroundColor='#FFFF00'"
					onmouseout="this.style.backgroundColor=''">
							<td>
								<img alt="" width="200px" height="100px"
								src="${request.getRequestURL().toString().replace(request.getRequestURI(),'')}/youshoes/view/img/${olist.pdto.img_name[0].img_name}">
							</td>
							<td>${olist.pdto.pdt_name }</td>
							<td>${olist.ord_date }</td>
						</tr>
					</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="${contextPath}/view/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/view/assets/demo/datatables-demo.js"></script>
</body>
</html>