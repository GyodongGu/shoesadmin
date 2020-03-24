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
function Tdate1(start) {
	  year = "" + start.getFullYear();
	  month = "" + (start.getMonth() + 1); if (month.length == 1) { month = "0" + month; }
	  day = "" + start.getDate(); if (day.length == 1) { day = "0" + day; }
	  hour = "" + start.getHours(); if (hour.length == 1) { hour = "0" + hour; }
	  minute = "" + start.getMinutes(); if (minute.length == 1) { minute = "0" + minute; }
	  return year + "-" + month + "-" + day + " " + hour + ":" + minute;
}
function Tdate2(start) {
	  year = "" + start.getFullYear();
	  month = "" + (start.getMonth() + 1); if (month.length == 1) { month = "0" + month; }
	  day = "" + start.getDate(); if (day.length == 1) { day = "0" + day; }
	  return year + "-" + month + "-" + day
}
function Tdate3(start) {
	  hour = "" + start.getHours(); if (hour.length == 1) { hour = "0" + hour; }
	  minute = "" + start.getMinutes(); if (minute.length == 1) { minute = "0" + minute; }
	  return hour+":"+minute;
}
var daytime;
var calendar ;
var event;

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction' ,'dayGrid' ],
			views: { dayGridMonth: { titleFormat: {year: 'numeric', month: 'short' } } }, 
			eventSources: ['${pageContext.request.contextPath}/ajax/GetHoliday.do', '${pageContext.request.contextPath}/ajax/GetReserv.do'],
			defaultView : 'dayGridMonth',
		   	eventColor: '#964B00',
			eventTextColor: 'white',  
			displayEventTime : true, 
			contentHeight: 450,
			eventTimeFormat: { hour: 'numeric', minute: '2-digit' }, 
			defaultView : 'dayGridMonth',  
			dateClick : function(date) {
				var hc = confirm(date.dateStr+" 날짜로 휴일을 지정하시겠습니까?");
				var ttdate = Tdate1(date.date);  
				var today = Tdate1(new Date()); 
				var events = calendar.getEvents();
			 	var holiday = {"rest_date" : date.dateStr};
				var ttoday = today.toString();
				if (hc == false) {
					return;
				}
				
			 	for(var i=0; i < events.length; i++) {
			   		if(Tdate1(events[i].start) == Tdate1(date.date) && events[i].title == '예약') {
			   			alert("고객의 예약이 있는 날짜 입니다. 다시 한번 확인해 주세요."); 
			   			return;
			   		}
			   		if(Tdate1(events[i].start) == Tdate1(date.date) && events[i].title == '휴일') {
			   			alert("이미 휴일로 지정 된 날짜 입니다. 다시 한번 확인해 주세요.");
			   			return;
			   		}
			   	}
				
				if(date.dateStr > ttoday) {
				 	if(hc == true){
				 		$.ajax({ 
					   	url: "${pageContext.request.contextPath}/ajax/SetHoliday.do",
					   	type:'GET',
					   	data:holiday,
					   	success: function (result) {
						var date = new Date(result + 'T00:00:00');
					   	
						if (result =! null) {
								calendar.addEvent({
									title: '휴일',
									start: date,
									allDay: true
									
								}); 
								alert('휴일 입력이 완료 되었습니다!');
							}
						} 
				 	})
				 }
				 }
			}, 
			
			eventClick : function (info) { 
				var del = confirm("이 휴일 일정을 삭제 할까요?");
				var dhul = {"rest_date" : Tdate2(info.event.start)};
				if (del == false) {
					return;
				}else if(info.event.title == '예약'){
					alert("이 이일정은 고객의 예약일정입니다. 휴일일정을 선택해주세요.");
					
				}else if(del == true) {
					$.ajax({
						url: "${pageContext.request.contextPath}/ajax/DelHoliday.do", 
						type : 'GET',
						data : dhul,
						success: function (result) {
							alert(Tdate2(info.event.start) + ', 휴일 일정이 삭제되었습니다.');
							info.event.remove()
						}
					})
				}
			}
			
		}); 
		calendar.render();
	});

</script>
</head>
<body>
<br>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>휴일일정 등록 및 고객 예약일정 내역 페이지
		</div>
		<div class="card-body">
			<div id="calendar" align="center">원하시는 날짜를 클릭하시면 휴일을 지정 할 수 있습니다.</div>
		</div>
	</div>
</body>
</html>