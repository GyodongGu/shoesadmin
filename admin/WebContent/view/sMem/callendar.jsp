<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<link href='${pageContext.request.contextPath}/view/callendar/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/view/callendar/packages/daygrid/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/view/callendar/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/view/callendar/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/view/callendar/packages/interaction/main.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid' ],
			defaultView : 'dayGridMonth',
			header : {
				center : 'addEventButton'
			},
			eventSources: [
				
			],
			customButtons : {
				addEventButton : {
					text : '휴일일정 등록',
					
					click : function() {
						var dateStr = prompt('휴일날짜를 YYYY-MM-DD 형태로 넣어주세요.');
						var dateName = prompt('휴일 제목을 입력해주세요.');
						/* var holiday = new Date(dateStr + 'T00:00:00'); */
						
						var holiday = {"rest_date" : dateStr};
						
						$.ajax({
						   	url: "${pageContext.request.contextPath}/ajax/SetHoliday.do",
						   	type:'GET',
						   	data:holiday,
						   	success: function (result) {
							var date = new Date(result + 'T00:00:00');
						   		console.log(result)
						   		if (result =! null) {
									calendar.addEvent({
										start :date,
										allDay : true
									});
									alert('휴일 입력이 완료 되었습니다!');
								} else {
									alert('휴일 입력이 실패 하였습니다. 다시 한번 확인 해주세요.');
								}
							}
					  })
					}
				}
			}

		});

		calendar.render();
	});

	/*  document.addEventListener('DOMContentLoaded', function() {
	   var calendarEl = document.getElementById('calendar');
			
	   var calendar = new FullCalendar.Calendar(calendarEl, {
	   	plugins: [ 'interaction', 'dayGrid' ], 
	   	defaultView: 'dayGridMonth',
	   	header: {
	   		center: 'addEventButton'
	   	},
	   	customButtons: {
	   		text: 'add event...',
	           click: function() {
	               var dateStr = prompt('Enter a date in YYYY-MM-DD format');
	               var date = new Date(dateStr + 'T00:00:00'); // will be in local time

	               if (!isNaN(date.valueOf())) { // valid?
	                 calendar.addEvent({
	                   title: 'dynamic event',
	                   start: date,
	                   allDay: true
	                 });
	                 alert('Great. Now, update your database...');
	               } else {
	                 alert('Invalid date.');
	               }
	             }
	           }
	   	}

	   	 dateClick: function(info) { 
	   		 alert('Clicked on: ' + info.dateStr );
	   		 console.log(info)
			 info.dayEl.style.backgroundColor = 'lightblue';
		
	   		 
	   var holiday = {"rest_date" : info.dateStr};
	   
	   $.ajax({
	   	url: "${pageContext.request.contextPath}/ajax/SetHoliday.do",
	   	type:'GET',
	   	data:holiday,
	   	success: function (result) {
	   		console.log(result+"======================")
			alert("휴일일정 등록완료!");
	   		events: {
	   			url:"/admin/"
	   		}
		},
	   	
	   	error : function (jqXHR, textStatus, errorThrown) {
			alert("등록이 재대로 되지 않았습니다. 다시 확인해 주세요." + textStatus + ":" + errorThrown);
		}
	   })
	   	 } 
	   });

	   calendar.render();
	 }); */
</script>
</head>
<body>
<br>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>휴일일정 등록 페이지
		</div>
		<div class="card-body">
			<div id="calendar"></div>
		</div>
	</div>
</body>
</html>