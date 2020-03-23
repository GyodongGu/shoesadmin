<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<script>
    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages':['corechart']});
 
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(callChart);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function callChart() {
		drawChart1();
		drawChart2();
		drawChart3();
		drawChart4();
		drawChart5();
	}
    
    
    function drawChart1() {
  	// Set chart options
        var options = {'title':'년도별 모든 가게의 총 매출',
                       'width':400, 
                       'height':400};
      // Create the data table. 
      var data = new google.visualization.DataTable();
      data.addColumn('string', '부서명');
      data.addColumn('number', '인원수');
      //데이터를 ajax로 받기
      $.ajax("../../ajax/getDeptCnt.do", { dataType:"json" })
      .done(function (chartData) {
      var arr = [];
      for(i=0; i<chartData.length; i++) {
      	arr.push([chartData[i].department_name, chartData[i].cnt]);
      }
      data.addRows(arr); 
      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.ColumnChart(document.getElementById('col-1'));
      chart.draw(data, options);
  	});
    }
    
    function drawChart2() {
      	// Set chart options
            var options = {'title':'월별 모든 가게의 총 매출',
                           'width':400,
                           'height':400};
          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '부서명');
          data.addColumn('number', '인원수');
          //데이터를 ajax로 받기
          $.ajax("../../ajax/getDeptCnt.do", { dataType:"json" })
          .done(function (chartData) {
          var arr = [];
          for(i=0; i<chartData.length; i++) {
          	arr.push([chartData[i].department_name, chartData[i].cnt]);
          }
          data.addRows(arr);
          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.ColumnChart(document.getElementById('col-2'));
          chart.draw(data, options);
      	});
        }
    
    function drawChart3() {
      	// Set chart options
            var options = {'title':'모든 기간 모든 가게들의 판매한 품목 비율',
                           'width':400,
                           'height':400};
          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '부서명'); 
          data.addColumn('number', '인원수');
          //데이터를 ajax로 받기
          $.ajax("../../ajax/getDeptCnt.do", { dataType:"json" })
          .done(function (chartData) {
          var arr = [];
          for(i=0; i<chartData.length; i++) {
          	arr.push([chartData[i].department_name, chartData[i].cnt]);
          }
          data.addRows(arr);
          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('col-3'));
          chart.draw(data, options);
      	});
        }
    
    function drawChart4() {
      	// Set chart options
            var options = {'title':'모든 기간 모든 가게들의 판매한 성별 비율',
                           'width':400,
                           'height':400};
          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '부서명');
          data.addColumn('number', '인원수');
          //데이터를 ajax로 받기
          $.ajax("../../ajax/getDeptCnt.do", { dataType:"json" })
          .done(function (chartData) {
          var arr = [];
          for(i=0; i<chartData.length; i++) {
          	arr.push([chartData[i].department_name, chartData[i].cnt]);
          }
          data.addRows(arr);
          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('col-4'));
          chart.draw(data, options);
      	});
        }
    
    function drawChart5() { 
      	// Set chart options
            var options = {'title':'여기에 차트 제목을 적으면 됩니다.',
                           'width':400,
                           'height':400};
          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '부서명');
          data.addColumn('number', '인원수');
          //데이터를 ajax로 받기
          $.ajax("../../ajax/getDeptCnt.do", { dataType:"json" })
          .done(function (chartData) {
          var arr = [];
          for(i=0; i<chartData.length; i++) {
          	arr.push([chartData[i].department_name, chartData[i].cnt]);
          }
          data.addRows(arr);
          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.PieChart(document.getElementById('col-5')); 
          chart.draw(data, options);
      	}); 
        }
  </script> 
</head>
<body>
	<br>
	<h1 class="main" align="center">Charts</h1>  
	<br>
	<div align="center">
	<button type="button" id="Chartb-g">연도별</button>
	<button type="button" id="Chartb-g">월별</button>
	<button type="button" id="Chartb-g">주별</button>
	<button type="button" id="Chartb-g">일별</button> 
	<div class="container" >
	<div class="row">   
		<div id="col" class="col-md-1"></div>
		<div id="col-1" class="col-lg-3"></div>
		<div id="col" class="col-md-2"></div>
		<div id="col-2" class="col-lg-3"></div>
	</div>  
	<br>    
	<div class="row">    
		<div id="col-3" class="col-lg-3"></div>
		<div id="col" class="col-md-1"></div> 
		<div id="col-4" class="col-lg-3"></div> 
		<div id="col" class="col-md-1"></div>
		<div id="col-5" class="col-lg-3"></div>
	</div>
	</div>
	</div>
</body>
</html>