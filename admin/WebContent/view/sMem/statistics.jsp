<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>
	$("select option[value='notPick']").prop('disabled', true); // select의 value가 notPick인 것의 선택을 막음
</script>
</head>
<body>
	<br>
	<h1 class="main" align="center">${nid}의 매출 내역</h1>
	<br>
	<!-- 매출 부분 첫번째 줄 전체 감싸는 부분 -->
	<div align="center">
		<div class="row">
			<!-- 연 매출  차트 부분  -->
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area mr-1"></i> 연 매출 차트
					</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-md-4">
								<button class="btn btn-primary">확인</button>
							</div>
						</div>
						<canvas id="myChartYear" width="100%" height="40"></canvas>
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
										<option value="notPick">년도</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
									</select>
								</div>
								<div class="form-group col-md-2">
									<input type="button" value="확인" class="btn btn-primary">
								</div>
							</div>
						</form>
						<canvas id="myChartMonth" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- // 월 매출 차트 부분  -->
		</div>
	</div>
	<!-- // 매출 부분 첫번째 줄 전체 감싸는 부분 -->
	<!-- 매출 부분 두번째 줄 전체 감싸는 부분 -->
	<div align="center">
		<div class="row">
			<!-- 주 매출 차트 부분  -->
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area mr-1"></i> 주 매출 차트
					</div>
					<div class="card-body">
						<form action="#" method="post">
							<div class="form-row">
								<div class="form-group col-md-3">
									<select id="inputState" class="form-control" id="WeekChartyearSelect" name="WeekChartyearSelect">
										<option selected>년도</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
									</select>
								</div>
								<div class="form-group col-md-3">
									<select id="inputState" class="form-control" id="WeekChartMonthSelect" name="WeekChartMonthSelect">
										<option selected>월</option>
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
								</div>
								<div class="form-group col-md-2">
									<button class="btn btn-primary">확인</button>
								</div>
							</div>
						</form>
						<canvas id="myChartWeek" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- // 주 매출 차트 부분   -->
			<!-- 일 매출 차트 부분  -->
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar mr-1"></i> 일 매출 차트
					</div>
					<div class="card-body">
						<form action="#" method="post">
							<div class="form-row">
								<div class="form-group col-md-3">
									<select id="inputState" class="form-control" id="DayChartYearSelect" name="DayChartYearSelect">
										<option selected>년도</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
									</select>
								</div>
								<div class="form-group col-md-3">
									<select id="inputState" class="form-control" id="DayChartMonthSelect" name="DayChartMonthSelect">
										<option selected>월</option>
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
								</div>
								<div class="form-group col-md-2">
									<button class="btn btn-primary">확인</button>
								</div>
							</div>
						</form>
						<canvas id="myChartDay" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- // 일 매출 차트 부분  -->
		</div>
		<!-- // 매출 부분 두번째 줄 전체 감싸는 부분 -->
		<!-- 매출 부분 세번째 줄 전체 감싸는 부분 -->
		<div class="row">
			<!-- 판매 품목 차트  -->
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area mr-1"></i> 판매한 품목의 종류
					</div>
					<div class="card-body">
						<canvas id="myChartProduct" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- // 판매 품목 차트  -->
			<!-- 구매 성비 차트  -->
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar mr-1"></i> 구매한 성비
					</div>
					<div class="card-body">
						<canvas id="myChartSex" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- // 구매 성비 차트  -->
		</div>
		<!-- // 매출 부분 세번째 줄 전체 감싸는 부분 -->
	</div>
	<!-- 연 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartYear").getContext('2d');

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
	<!-- // 연 매출 통계 -->
	<!-- 월 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartMonth").getContext('2d');

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
	</script>
	<!-- // 월 매출 통계 -->
	<!-- 주 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartWeek").getContext('2d');
		var myChartWeek = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [],
				datasets : [ {
					label : '주 매출',
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
			url : "${contextPath}/ajax/sWeekStatistics.do",
			type : 'get',
			dataType : "json",
			success : youshoesWeekChart
		})
		function youshoesWeekChart(datas) {
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
			myChartWeek.data.labels = varlabels;
			myChartWeek.data.datasets[0].data = varData;
			myChartWeek.data.datasets[0].backgroundColor = varbackgroundColor;
			myChartWeek.data.datasets[0].borderColor = varBorderColor;
			// re-render the chart
			myChartWeek.update();
		}
	</script>
	<!-- // 주 매출 통계 -->
	<!-- 일 매출 통계 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartDay").getContext('2d');
		var myChartDay = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [],
				datasets : [ {
					label : '일 매출',
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
			url : "${contextPath}/ajax/sDayStatistics.do",
			type : 'get',
			dataType : "json",
			success : youshoesDayChart
		})
		function youshoesDayChart(datas) {
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
			myChartDay.data.labels = varlabels;
			myChartDay.data.datasets[0].data = varData;
			myChartDay.data.datasets[0].backgroundColor = varbackgroundColor;
			myChartDay.data.datasets[0].borderColor = varBorderColor;
			myChartDay.update();
		}
	</script>
	<!-- // 일 매출 통계 -->
	<!-- 가게별 판매한 품목 종류 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartProduct").getContext('2d');

		var myChartProduct = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [],
				datasets : [ {
					label : '판매한 품목 종류',
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
			url : "${contextPath}/ajax/ProductStatistics.do",
			type : 'get',
			dataType : "json",
			success : youshoesProductChart
		})
		function youshoesProductChart(datas) {
			var varlabels = [];
			var varData = [];

			for (i = 0; i < datas.length; i++) {
				varlabels.push(datas[i].pdtKind);
				varData.push(datas[i].pdtSt);
			}
			var varbackgroundColor = [ 'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)' ]
			var varBorderColor = [ 'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)' ]

			console.log(varData);
			myChartProduct.data.labels = varlabels;
			myChartProduct.data.datasets[0].data = varData;
			myChartProduct.data.datasets[0].backgroundColor = varbackgroundColor;
			myChartProduct.data.datasets[0].borderColor = varBorderColor;
			// re-render the chart
			myChartProduct.update();
		}
	</script>
	<!-- // 가게별 판매한 품목 종류 -->
	<!-- 가게별 판매한 물품을 구매한 성비 -->
	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChartSex").getContext('2d');
		var myChartSex = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [],
				datasets : [ {
					label : '판매한 제품을 구매한 성비',
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
			url : "${contextPath}/ajax/SexStatistics.do",
			type : 'get',
			dataType : "json",
			success : youshoesSexChart
		})
		function youshoesSexChart(sdata) {
			var varlabels = [];
			var varData = [];

			for (i = 0; i < sdata.length; i++) {
				varlabels.push(sdata[i].genderCd);
				varData.push(sdata[i].genSt);
			}
			var varbackgroundColor = [ 'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)' ]
			var varBorderColor = [ 'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)' ]

			console.log(varData);
			myChartSex.data.labels = varlabels;
			myChartSex.data.datasets[0].data = varData;
			myChartSex.data.datasets[0].backgroundColor = varbackgroundColor;
			myChartSex.data.datasets[0].borderColor = varBorderColor;
			// re-render the chart
			myChartSex.update();
		}
	</script>
	<!-- // 가게별 판매한 물품을 구매한 성비 -->
</body>
</html>