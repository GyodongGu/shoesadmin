<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<link href='${pageContext.request.contextPath}/view/callendar/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/view/callendar/packages/daygrid/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/view/callendar/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/view/callendar/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/view/callendar/packages/interaction/main.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${pageContext.request.contextPath}/view/js/moment.js"></script>
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
		var dialog;
		
		dialog = $('#modal-form').dialog({
			autoOpen: false,
			height: 500,
			width:500,
			modal: true,
			buttons : { 
				'휴일지정' : holiday, '휴일지정취소' : delholiday,
				Cancel: function () { 
					dialog.dialog("close"); 
				}
			} 
		}) 

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
				var ttdate = Tdate1(date.date);  
				var today = Tdate1(new Date()); 
				var events = calendar.getEvents();
				var ttoday = today.toString(); 
			
			 	var holiday = {"rest_date" : date.dateStr};
			 	if (hc == false) {
			 		return;
			 	} else if (date.dateStr < ttoday) {
			 		 alert("지정 할 수 없는 날짜 입니다. 다시 선택해주세요.");
			 		 return;
			 	}
			 	
			 	for(var i=0; i < events.length; i++) {
				   	if(Tdate2(events[i].start) == Tdate2(date.date) && events[i].title == '예약') { 
				   		alert("고객의 예약 일정이 지정 된 날짜 입니다. 다시 한번 확인해 주세요.");
			   			return; 
				   		}
			   		if(Tdate1(events[i].start) == Tdate1(date.date) && events[i].title == '휴일') {
			   			alert("이미 휴일로 지정 된 날짜 입니다. 다시 한번 확인해 주세요.");
			   			return;
			   		}   
			   	}
				
				if(date.dateStr > ttoday) {
					var hc = confirm(date.dateStr+" 날짜로 휴일을 지정하시겠습니까?");
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
			},

			footer : { 
				left: 'custom',
				right : '',
				right : 'prev,next'
				
			},
			customButtons: {
				custom : {
					text: '정기휴일등록',
					click : function () {
						dialog.dialog("open");
						$('#holidayclick').html();
					} 
				}
			}	
		}); 
		
		function holiday() { 
			var week = $('input[name="radio"]:checked').val();
			var day = $('input[name="radio1"]:checked').val();
 			var holi = {'week' : week, 'day' : day};
 			$.ajax({  
 				url: "${pageContext.request.contextPath}/ajax/SetHolidayImport.do",
 				type : 'GET',
 				data : holi,
 				success : function () {
 					alert("정기 휴일 등록이 완료 되었습니다.");
 					location.reload();
				}
 			})
			
		}
		
		function	 delholiday() {
			var week = $('input[name="radio"]:checked').val();
			var day = $('input[name="radio1"]:checked').val();
 			var holi = {'week' : week, 'day' : day};
 			$.ajax({  
 				url: "${pageContext.request.contextPath}/ajax/DelHolidayImport.do", 
 				type : 'GET',
 				data : holi,
 				success : function () {
 					alert("정기 휴일 등록이 취소 되었습니다.");
 					location.reload();
				}
 			})
			
		
		}
		
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
		<div id="calendar" style="height: 580px"></div>
			<div align="center">원하시는 날짜를 클릭하시면 휴일을 지정 할 수 있습니다.</div>
		
		<!--  modal  -->
		<div id="modal-form" style="display: none">
		<form>
		<h4><div id="holidayclick">원하시는 주차, 요일을 선택해주세요.</div></h4> 
		<br>  
		<fieldset> 
		<label>주차 선택</label><br>
			<input type="radio" name="radio" id="radio1" value=1 >첫째 주<br>
			<input type="radio" name="radio" id="radio2" value=2 >둘째 주<br>
			<input type="radio" name="radio" id="radio3" value=3 >셋째 주<br>
			<input type="radio" name="radio" id="radio4" value=4>넷째 주<br>
			<br>
		<label>요일 선택</label><br>
			<input type="radio" name="radio1" id="radio1" value=2 >월요일<br>
			<input type="radio" name="radio1" id="radio2" value=3 >화요일<br>
			<input type="radio" name="radio1" id="radio3" value=4>수요일<br>
			<input type="radio" name="radio1" id="radio4" value=5 >목요일<br>
			<input type="radio" name="radio1" id="radio5" value=6 >금요일<br>
			<input type="radio" name="radio1" id="radio6" value=7 >토요일<br>
			<input type="radio" name="radio1" id="radio7" value=1 >일요일<br>
			</fieldset>
		</form>
		</div>
		</div>
	</div>
</body>
</html>