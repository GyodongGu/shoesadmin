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
	<h1 class="main" align="center">${nid}(판매회원)님의매출내역</h1>
	<br>
	<div align="center">
		<h3>${nid}(판매회원)님의 년 매출</h3>
		<div style="width: 800px">
			<canvas id="myChartYear"></canvas>
		</div>
		<h3>${nid}(판매회원)님의 월 매출</h3>
		<div style="width: 800px">
			<canvas id="myChartMonth"></canvas>
		</div>
		<h3>${nid}(판매회원)님의 주 매출</h3>
		<div style="width: 800px">
			<canvas id="myChartWeek"></canvas>
		</div>
		<h3>${nid}(판매회원)님의 일 매출</h3>
		<div style="width: 800px">
			<canvas id="myChartDay"></canvas>
		</div>
		<div style="width: 400px">
			<canvas id="myChartProduct"></canvas>
		</div>
		<div style="width: 300px">
			<canvas id="myChartSex"></canvas>
		</div>
	</div>
	<!-- 년 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartYear").getContext('2d');
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
							label : '# 판매회원님의 년 매출',
							data : [ 202, 19, 3, 5, ],
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
	<!-- 월 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartMonth").getContext('2d');
		/*
		 - Chart를 생성하면서, 
		 - ctx를 첫번째 argument로 넘겨주고, 
		 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월","9월", "10월", "11월", "12월" ],
						datasets : [ {
							label : '# 판매회원님의 월 매출',
							data : [ 202, 19, 3, 5, ],
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
	<!-- // 월 매출 통계 -->
	<!-- 주 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartWeek").getContext('2d');
		/*
		 - Chart를 생성하면서, 
		 - ctx를 첫번째 argument로 넘겨주고, 
		 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ "1주", "2주", "3주", "4주", "5주" ],
						datasets : [ {
							label : '# 판매회원님의 주 매출',
							data : [ 202, 19, 3, 5, ],
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
	<!-- // 주 매출 통계 -->
	<!-- 일 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartDay").getContext('2d');
		/*
		 - Chart를 생성하면서, 
		 - ctx를 첫번째 argument로 넘겨주고, 
		 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" ],
						datasets : [ {
							label : '# 판매회원님의 일 매출',
							data : [ 202, 19, 3, 5, ],
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
	<!-- // 일 매출 통계 -->
	<!-- 가게별 판매한 품목 종류 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartProduct").getContext('2d');
		/*
		 - Chart를 생성하면서, 
		 - ctx를 첫번째 argument로 넘겨주고, 
		 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var myChart = new Chart(ctx,
				{
					type : 'pie',
					data : {
						labels : ["구두", "운동화", "샌들", "워커"],
						datasets : [ {
							label : '# 판매회원님의 년 매출',
							data : [ 12, 19, 3, 5, ],
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
	<!-- // 가게별 판매한 품목 종류 -->
	<!-- 가게별 판매한 물품을 구매한 성비 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartSex").getContext('2d');
		/*
		 - Chart를 생성하면서, 
		 - ctx를 첫번째 argument로 넘겨주고, 
		 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var myChart = new Chart(ctx,
				{
					type : 'pie',
					data : {
						labels : [ "남", "녀" ],
						datasets : [ {
							label : '# 판매회원님의 년 매출',
							data : [ 12, 19],
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
	<!-- // 가게별 판매한 물품을 구매한 성비 -->
</body>
</html>