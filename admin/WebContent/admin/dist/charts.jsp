<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>You Shoes</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	
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
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':300,
                       'height':300};
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
      var chart = new google.visualization.ComboChart(document.getElementById('col-1'));
      chart.draw(data, options);
  	});
    }
    
    function drawChart2() {
      	// Set chart options
            var options = {'title':'How Much Pizza I Ate Last Night',
                           'width':300,
                           'height':300};
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
          var chart = new google.visualization.ComboChart(document.getElementById('col-2'));
          chart.draw(data, options);
      	});
        }
    
    function drawChart3() {
      	// Set chart options
            var options = {'title':'How Much Pizza I Ate Last Night',
                           'width':300,
                           'height':300};
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
          var chart = new google.visualization.ComboChart(document.getElementById('col-3'));
          chart.draw(data, options);
      	});
        }
    
    function drawChart4() {
      	// Set chart options
            var options = {'title':'How Much Pizza I Ate Last Night',
                           'width':300,
                           'height':300};
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
          var chart = new google.visualization.ComboChart(document.getElementById('col-4'));
          chart.draw(data, options);
      	});
        }
    
    function drawChart5() {
      	// Set chart options
            var options = {'title':'How Much Pizza I Ate Last Night',
                           'width':300,
                           'height':300};
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
          var chart = new google.visualization.ComboChart(document.getElementById('col-5'));
          chart.draw(data, options);
      	});
        }
  </script>

</head>
<body>
	<h1 class="main">Charts</h1>
	<div class="container">
	<div class="row">
		<div id="col-1"></div>
		<div id="col-2"></div>
	</div>
	<br> 
	<div class="row">
		<div id="col-3"></div>
		<div id="col-4"></div>
		<div id="col-5"></div>
	</div>
	</div>
</body>
</html>
