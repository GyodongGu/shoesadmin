<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>