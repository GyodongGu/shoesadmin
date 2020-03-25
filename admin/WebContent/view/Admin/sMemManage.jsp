<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>판매 회원 관리</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('.delete').on('click',function(){
			var smid = $(this).attr('name');
			var result = confirm('정말 삭제하시겠습니까?');
			if(result){
				location.href='${contextPath}/DeleteSmem.do?sm_id=' + smid;
			}else{
				return false;
			}
		})
	})
</script>
</head>
<body>
	<br>
	<!-- 조회 테이블 -->
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>판매회원 테이블
			<span style="float: right">
				<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/InsertSmem.do'">판매 회원 등록</button>
			</span>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>판매자 ID</th>
							<th>가게 이름</th>
							<th>판매자 이름</th>
							<th>판매자 전화번호</th>
							<th>사업자 번호</th>
							<th>판매자 우편번호</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${sMemSelect == null }">
								<tr>
									<td colspan="8">
										<b>등록된 회원이 없습니다.</b>
									</td>
								</tr>
							</c:when>
							<c:when test="${sMemSelect != null }">
								<c:forEach items="${sMemSelect}" var="smem">
									<tr>
										<td>${smem.sm_id}</td>
										<td>${smem.shop_name}</td>
										<td>${smem.sm_name}</td>
										<td>${smem.sm_tell}</td>
										<td>${smem.business_no}</td>
										<td>${smem.sm_post}</td>
										<td>
											<button class="btn btn-primary" onclick="location.href='${contextPath}/UpdateSmemForm.do?sm_id=${smem.sm_id}'">수정</button>
										</td>
										<td>
											<button class="btn btn-primary delete" name="${smem.sm_id }">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
	<!-- // 조회 테이블 -->
</body>

</html>