<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
		<h3>${nid}(판매회원)님의년매출</h3>
		<div style="width: 800px">
			<canvas id="myChartYear"></canvas>
		</div>
		<h3>${nid}(판매회원)님의월매출</h3>
		<select>
			<option value="notPick">조회할 년도를 선택해주세요.</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
			<option value="2018">2018</option>
			<option value="2019">2019</option>
			<option value="2020">2020</option>
		</select>
		<button>확인</button>
		<div style="width: 800px">
			<canvas id="myChartMonth"></canvas>
		</div>
		<h3>${nid}(판매회원)님의주매출</h3>
		<select>
			<option value="notPick">조회할 년도를 선택해주세요.</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
			<option value="2018">2018</option>
			<option value="2019">2019</option>
			<option value="2020">2020</option>
		</select>
		<select>
			<option value="notPick">조회할 월를 선택해주세요.</option>
			<option value="1">1월</option>
			<option value="2">2월</option>
			<option value="3">3월</option>
			<option value="4">4월</option>
			<option value="5">5월</option>
			<option value="6">6월</option>
			<option value="7">7월</option>
			<option value="8">8월</option>
			<option value="9">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>
		<button>확인</button>
		<div style="width: 800px">
			<canvas id="myChartWeek"></canvas>
		</div>
		<h3>${nid}(판매회원)님의일매출</h3>
		<select>
			<option value="notPick">조회할 년도를 선택해주세요.</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
			<option value="2018">2018</option>
			<option value="2019">2019</option>
			<option value="2020">2020</option>
		</select>
		<select>
			<option value="notPick">조회할 월를 선택해주세요.</option>
			<option value="1">1월</option>
			<option value="2">2월</option>
			<option value="3">3월</option>
			<option value="4">4월</option>
			<option value="5">5월</option>
			<option value="6">6월</option>
			<option value="7">7월</option>
			<option value="8">8월</option>
			<option value="9">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>
		<select>
			<option value="notPick">조회할 주를 선택해주세요.</option>
			<option value="1">1주</option>
			<option value="2">2주</option>
			<option value="3">3주</option>
			<option value="4">4주</option>
			<option value="5">5주</option>
		</select>
		<button>확인</button>
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

		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [],
				datasets : [ {
					label : '# 판매회원님의 년 매출',
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
		var myChartMonth = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				datasets : [ {
					label : '# 판매회원님의 월 매출',
					data : [ 202, 19, 3, 5, ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
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
		var myChartWeek = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "1주", "2주", "3주", "4주", "5주" ],
				datasets : [ {
					label : '# 판매회원님의 주 매출',
					data : [ 202, 19, 3, 5, ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
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
		var myChartDay = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
						"11", "12", "13", "14", "15", "16", "17", "18", "19",
						"20", "21", "22", "23", "24", "25", "26", "27", "28",
						"29", "30", "31" ],
				datasets : [ {
					label : '# 판매회원님의 일 매출',
					data : [ 202, 19, 3, 5, ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
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
		var myChartProduct = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ "구두", "운동화", "샌들", "워커" ],
				datasets : [ {
					label : '# 판매회원님의 년 매출',
					data : [ 12, 19, 3, 5, ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
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
		var myChartSex = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ "남", "녀" ],
				datasets : [ {
					label : '# 판매회원님의 년 매출',
					data : [ 12, 19 ],
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
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