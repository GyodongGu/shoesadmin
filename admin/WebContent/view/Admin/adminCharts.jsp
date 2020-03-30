<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- chart.js CDN -->
</head>
<body>
	<br>
	<h1 class="main" align="center">${nid}님
		환영합니다. <br>
	</h1>
	<br>
	<div align="center">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area mr-1"></i>YouShoes의 역대 총 매출내역
					</div>
					<div class="card-body">
						<canvas id="myChartYouShoes" width="600" height="200"></canvas>
					</div>
				</div>
	</div>
	<!-- YouShoes 년도별 총 매출 통계 -->
	<script>
		var ctx = document.getElementById("myChartYouShoes").getContext('2d');

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
	</script>
	<!-- // YouShoes 년도별 총 매출 통계 -->
</body>
</html>