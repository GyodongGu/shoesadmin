<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
form {
	margin: 0 auto;
	width: 250px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.deleteProd').on("click",function() {
			var clickedRow = $(this).parent().parent();
			var clickedSize = clickedRow.children('.pdtsize');
			/* location.href="${pageContext.request.contextPath}
			/deleteProd.do?pdt_no="+clickedRow.attr('id');
			clickedRow.remove(); */
			var con = confirm('정말 삭제하시겠습니까?');
			if (con) {
				$.ajax({
					url : '${pageContext.request.contextPath}/ajax/deleteProd.do',
					dataType : 'json',
					type : 'POST',
					data : {
						'pdt_no' : clickedRow.attr('id'),
						'pdt_size_cd' : clickedSize.attr('id')},
					success : function(result) {
						if (result == '1') {
							clickedRow.remove();
							alert('삭제되었습니다.');
						}
					},
					error : function(
						request,
						status,
						error) {
							alert('code= '
								+ request.status
								+ " message= "
								+ request.responseText
								+ " error = "
								+ error);
						}
				})
			} else {
				return false;
			}
		})
	})
</script>
</head>
<body>
	<br>
	<div class="card mb-4" style="width: 700px; margin: 0 auto;">
		<div class="card-header">
			상점정보
			<span style="float: right">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/shopUpdateForm.do'">정보 수정</button>
			</span>
		</div>
		<div class="card-body">
			<div class="form-group">
				<c:forEach var="img" items="${smdto.img_name }">
					<img alt="" width="200px" height="100px" src="${request.getRequestURL().toString().replace(request.getRequestURI(),'')}/youshoes/view/img/${img.img_name}">
				</c:forEach>
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="small mb-1" for="shop_name">상점이름</label>
						<input class="form-control py-4" id="shop_name" name="shop_name" type="text" value="${smdto.shop_name }" readonly />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="small mb-1" for="sm_name">사장 이름</label>
						<input class="form-control py-4" id="sm_name" name="sm_name" type="text" value="${smdto.sm_name }" readonly />
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="small mb-1" for="sm_tell">전화번호</label>
						<input class="form-control py-4" id="sm_tell" name="sm_tell" type="text" value="${smdto.sm_tell }" readonly />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="small mb-1" for="business_no">사업자번호</label>
						<input class="form-control py-4" id="business_no" name="business_no" type="text" value="${smdto.business_no }" readonly />
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="small mb-1" for="sm_post">우편번호</label>
						<input class="form-control py-4" id="sm_post" name="sm_post" type="text" value="${smdto.sm_post }" readonly />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="small mb-1" for="sm_addr1">주소</label>
				<input class="form-control py-4" id="sm_addr1" name="sm_addr1" type="text" value="${smdto.sm_addr1 }" readonly />
				<label class="small mb-1" for="sm_addr2">상세주소</label>
				<input class="form-control py-4" id="sm_addr2" name="sm_addr2" type="text" value="${smdto.sm_addr2 }" readonly />
				<label class="small mb-1" for="sm_addr3">상세주소</label>
				<input class="form-control py-4" id="sm_addr3" name="sm_addr3" type="text" value="${smdto.sm_addr3 }" readonly />
			</div>
			<div class="form-group">
				<label class="small mb-1" for="sm_remark">상점소개글</label>
				<input class="form-control py-4" id="sm_remark" name="sm_remark" type="text" value="${smdto.sm_remark }" readonly />
			</div>
			<div class="form-row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="small mb-1" for="sm_time">운영시간</label>
						<input class="form-control py-4" id="sm_time" name="sm_time" type="text" value="${smdto.sm_time }" readonly />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="small mb-1" for="sm_rest">정기휴일</label>
						<input class="form-control py-4" id="sm_rest" name="sm_rest" type="text" value="${smdto.sm_rest }" readonly />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 제품리스트 -->
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>
			제품 리스트
			<span style="float: right">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/productInsertForm.do'">제품등록</button>
			</span>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pl" items="${plist }">
							<tr id="${pl.pdt_no }" onmouseover="this.style.backgroundColor='#FFFF00'" onmouseout="this.style.backgroundColor=''">
								<td>
									<img src="${request.getRequestURL().toString().replace(request.getRequestURI(),'')}/youshoes/view/img/${pl.img_name[0].img_name}" alt="" height="50" width="50">
								</td>
								<td>${pl.pdt_name }</td>
								<td>
									<c:if test="${pl.pdt_type_cd eq 'C'}">
										맞춤화
									</c:if>
									<c:if test="${pl.pdt_type_cd eq 'P'}">
										기성화
									</c:if>
								</td>
								<td>${pl.pdt_kind_name }</td>
								<td>${pl.gender_cd }</td>
								<td>
									<fmt:formatNumber value="${pl.pdt_price }" pattern="#,###"/>
								</td>
								<td class="pdtsize" id="${pl.pdt_size_cd }">
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
								<td>
									<button class="deleteProd btn btn-primary">삭제</button>
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