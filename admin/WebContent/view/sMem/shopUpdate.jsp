<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>제품 리스트
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>사진</th>
							<th>이름</th>
							<th>타입</th>
							<th>종류</th>
							<th>성별</th>
							<th>가격</th>
							<th>사이즈</th>
							<th>색상</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>사진</th>
							<th>이름</th>
							<th>타입</th>
							<th>종류</th>
							<th>성별</th>
							<th>가격</th>
							<th>사이즈</th>
							<th>색상</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="pl" items="${plist }">
							<tr>
								<td>
								<img src="${request.getRequestURL().toString().replace(request.getRequestURI(),'')}/youshoes/view/img/${pl.img_name[0].img_name}"
									alt="" height="50" width="50">
								</td>
								<td>
									${pl.pdt_name }
								</td>
								<td>
									<c:if test="${pl.pdt_type_cd eq 'C'}">
										맞춤화
									</c:if>
									<c:if test="${pl.pdt_type_cd eq 'P'}">
										기성화
									</c:if>								
								</td>
								<td>
									${pl.pdt_kind_name }
								</td>
								<td>
									${pl.gender_cd }
								</td>
								<td>
									${pl.pdt_price }
								</td>
								<td>
									<c:if test="${pl.pdt_size_cd=='0' }">
										사이즈
									</c:if>
									<c:if test="${pl.pdt_size_cd!='0' }">
										${pl.pdt_size_cd }
									</c:if>
								</td>
								<td>
									<c:if test="${empty pl.pdt_color_cd }">
										색상
									</c:if>
									<c:if test="${!empty pl.pdt_color_cd }">
										${pl.pdt_color_cd }
									</c:if>
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