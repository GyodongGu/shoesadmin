<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<!-- chart.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
	<br>
	<h1 class="main" align="center">${nid}(관리자)님 환영합니다. <br>YouShoes의 역대 총 매출내역</h1>
	<br>
	<div align="center">
		<div style="width: 800px">
			<canvas id="myChartYouShoes"></canvas>
		</div>
	</div>
	<!-- 년 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartYouShoes").getContext('2d');
		/*
		 - Chart를 생성하면서, 
		 - ctx를 첫번째 argument로 넘겨주고, 
		 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ "2017", "2018", "2019", "2020", ],
						datasets : [ {
							label : '# Youshoes의 년도별 총 매출',
							data : [ 70000, 80000, 90000, 150000 ],
							backgroundColor : [ 
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 
									'rgba(255,99,132,1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
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
	</script>
	<!-- // 년 매출 통계 -->
	
</body>
</html>