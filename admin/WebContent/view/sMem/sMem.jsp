<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	// 공지사항 모달
	$(document).ready(function() {
		var dialog = $('#modal').dialog({
			autoOpen : false,
			height : 600,
			width : 900,
			modal : true
		});
		$('.contents').on('click', function() {
			var i = $(this).prev().val();
			$('#modal').html('<p>' + i + '</p>');
			dialog.dialog('open');
		})
	})
</script>
</head>
<body>
	<div id="modal" title="공지사항 "></div>
	<h1 class="mt-4">메인보드(Dashboard) ${nid}</h1>
	<br>
	<c:if test="${nid eq 'admin'}">
		<div align="center">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i>YouShoes의 역대 총 매출내역
				</div>
				<div class="card-body"> 
					<canvas id="myChartYouShoesHome" width="600" height="200"></canvas>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${nid ne 'admin'}">
	<!-- 내부 전체 감싸는 부분 -->
	<div align="center">
		<div class="row">
			<!-- 연 매출  차트 부분  -->
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area mr-1"></i> 연 매출 차트
					</div>
					<div class="card-body">
						<canvas id="myChartYearHome" width="100%" height="47"></canvas>
					</div>
				</div>
			</div>
			<!-- // 연 매출  차트 부분  -->
			<!-- 월 매출 차트 부분  -->
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area mr-1"></i> 월 매출 차트
					</div>
					<div class="card-body">
						<form action="#" method="post">
							<div class="form-row">
								<div class="form-group col-md-3">
									<select class="form-control" id="yearSelect" name="yearSelect">
										<option value="">년도</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
									</select>
								</div>
								<div class="form-group col-md-2">
									<button type="button" class="yearSelectBtnHome" style='color: white; background-color: #007BFF; border-radius: 5px; text-align: center; display: inline-block; font-size: 16px; margin: 2px 2px; padding: 10px; text-decoration: none; border: none;'>확인</button>
								</div>
							</div>
						</form>
						<canvas id="myChartMonthHome" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- // 월 매출 차트 부분  -->
		</div>
	</div>
	</c:if>
	<!-- // 내부 전체 감싸는 부분 -->
	<!--  공지사항 -->
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>공지사항 및 이벤트
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>공지사항 번호</th>
							<th>공지사항 제목</th>
							<th>공지사항 날짜</th>
							<th>공지사항 내용</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${sMemNotice == null }">
								<tr>
									<td colspan="6">
										<b>등록된 공지사항이 없습니다.</b>
									</td>
								</tr>
							</c:when>
							<c:when test="${sMemNotice != null }">
								<c:forEach items="${sMemNotice}" var="smNotice">
									<tr>
										<td>${smNotice.notice_no}</td>
										<td>${smNotice.notice_title}</td>
										<td>${smNotice.notice_date}</td>
										<td>
											<input type="hidden" class="nc" name="nc" value="${smNotice.notice_content }" />
											<button class="btn btn-primary contents">내용보기</button>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					<tbody>
				</table>
			</div>
		</div>
	</div>
	<!--  // 공지사항 -->
	<script>
		$(function() {
			$(".yearSelectBtnHome").on('click', monthChart);
			
			<c:if test="${nid eq 'admin'}">
				YouShoesChart();
			</c:if>
			yearChart();
			monthChart();
		});
		// YouShoes 총 매출
		function YouShoesChart() {
			var ctx = document.getElementById("myChartYouShoesHome").getContext('2d');

			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [],
					datasets : [ {
						label : 'YouShoes 년도별 총 매출 통계',
						data : [],
						borderWidth : 1
					} ]
				},
				options : {
					maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});

			$.ajax({
				url : "${contextPath}/ajax/AdminStatistics.do",
				type : 'get',
				dataType : "json",
				success : youshoesChart
			})

			function youshoesChart(datas) {

				var varlabels = [];
				var varData = [];

				for (i = 0; i < datas.length; i++) {
					varlabels.push(datas[i].year);
					varData.push(datas[i].sumOrd);
				}
				var varbackgroundColor = [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)' ]

				var varBorderColor = [ 'rgba(255,99,132,1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ]

				console.log(varData);
				myChart.data.labels = varlabels;
				myChart.data.datasets[0].data = varData;
				myChart.data.datasets[0].backgroundColor = varbackgroundColor;
				myChart.data.datasets[0].borderColor = varBorderColor;
				// re-render the chart
				myChart.update();
			}
		}
		
		
		// 연 매출 통계
		function yearChart() {
			var ctx = document.getElementById("myChartYearHome").getContext(
					'2d');

			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [],
					datasets : [ {
						label : '연 매출',
						data : [],
						borderWidth : 1
					} ]
				},
				options : {
					maintainAspectRatio : true,
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
			$.ajax({
				url : "${contextPath}/ajax/SMemYearStatistics.do",
				type : 'get',
				dataType : "json",
				success : youshoesYearChart
			})
			function youshoesYearChart(datas) {
				var varlabels = [];
				var varData = [];

				for (i = 0; i < datas.length; i++) {
					varlabels.push(datas[i].year);
					varData.push(datas[i].sumOrd);
				}
				var varbackgroundColor = [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)' ]
				var varBorderColor = [ 'rgba(255,99,132,1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ]

				console.log(varData);
				myChart.data.labels = varlabels;
				myChart.data.datasets[0].data = varData;
				myChart.data.datasets[0].backgroundColor = varbackgroundColor;
				myChart.data.datasets[0].borderColor = varBorderColor;
				// re-render the chart
				myChart.update();
			}
		}

		// 월 매출 통계
		function monthChart() {
			var year = $('#yearSelect').val();
			var ctx = document.getElementById("myChartMonthHome").getContext(
					'2d');
			var myChartMonth = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [],
					datasets : [ {
						label : '월 매출',
						data : [],
						borderWidth : 1
					} ]
				},
				options : {
					maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
			$.ajax({
				url : "${contextPath}/ajax/sMonthStatistics.do",
				type : 'get',
				dataType : "json",
				data : {
					yearSelect : year
				},
				success : youshoesMonthChart
			})
			function youshoesMonthChart(datas) {
				var varlabels = [];
				var varData = [];

				for (i = 0; i < datas.length; i++) {
					varlabels.push(datas[i].lmon);
					varData.push(datas[i].sumord);
				}
				var varbackgroundColor = [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)' ]
				var varBorderColor = [ 'rgba(255,99,132,1)',
						'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ]

				console.log(varData);
				myChartMonth.data.labels = varlabels;
				myChartMonth.data.datasets[0].data = varData;
				myChartMonth.data.datasets[0].backgroundColor = varbackgroundColor;
				myChartMonth.data.datasets[0].borderColor = varBorderColor;
				// re-render the chart
				myChartMonth.update();
			}
		}
	</script>
</body>
</html>
