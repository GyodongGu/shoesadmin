<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<br>
	<!-- 조회 테이블 -->
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>판매회원 테이블
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th scope="col">주문 번호</th>
							<th scope="col">주문 일자</th>
							<th scope="col">주문 금액</th>
							<th scope="col">주문 빛 배송 상태</th>
							<th scope="col">묶음 배송 여부</th>
							<th scope="col">상품별 주문금액</th>
							<th scope="col">환불 마일리지</th>
							<th scope="col">환불 일자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${backupList == null}">
								<tr>
									<td colspan="8">
										<b>등록된 거래내역이 없습니다.</b>
									</td>
								</tr>
							</c:when>
							<c:when test="${backupList != null}">
								<c:forEach items="${backupList}" var="BackupList">
									<tr>
										<th scope="row">${BackupList.ord_no}</th>
										<td>${BackupList.ord_date}</td>
										<td>${BackupList.ord_point}</td>
										<td>${BackupList.ord_stat_cd}</td>
										<td>${BackupList.group_divy_cd}</td>
										<td>${BackupList.ep_ord_point}</td>
										<td>${BackupList.refund_point}</td>
										<td>${BackupList.refund_date}</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>