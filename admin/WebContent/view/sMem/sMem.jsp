<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1 class="mt-4">메인보드(Dashboard) ${nid}</h1>
	<br>
	<!-- 내부 전체 감싸는 부분 -->
	<div class="row">
		<!-- 월별 영역 차트 부분  -->
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i>월별 영역 차트
				</div>
				<div class="card-body">
					<canvas id="myAreaChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
		<!-- // 월별 영역 차트 부분  -->
		<!-- 월별 바 차트 부분  -->
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar mr-1"></i>월별 바 차트
				</div>
				<div class="card-body">
					<canvas id="myBarChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
		<!-- // 월별 바 차트 부분  -->
	</div>
	<!-- // 내부 전체 감싸는 부분 -->
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>공지사항 및 이벤트
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>회원 이름</th>
							<th>회원 ID</th>
							<th>생년월일</th>
							<th>이메일</th>
							<th>전화번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
