<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<br>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i>배송 송장번호 입력 페이지
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>송장번호</th>
							<th>종류</th>
							<th>제작 및 발송 상태</th>
							<th>주문일자</th>
							<th>배송자 성함</th>
							<th>배송자 전화번호</th>
							<th>배송 주소</th>
							<th>배송 비고</th>
							<th>(주문제작용)<br> 제작진행버튼</th>
							<th>송장번호 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr onmouseover="this.style.backgroundColor='#FFFF00'" onmouseout="this.style.backgroundColor=''">
								<td>${dto.ord_no }</td> 
								<td>
									<input type="text" id="${dto.ord_no }" size="8" style="" value="${dto.invoice_no }" />
								</td>
								<td>${dto.pdt_type_cd }</td>
								<td>${dto.ord_stat_cd }</td> 
								<td>${dto.dlvy_date }</td> 
								<td>${dto.dlvy_name }</td>
								<td>${dto.dlvy_tell }</td>
								<td>[${dto.dlvy_post }] ${dto.dlvy_addr1 } ${dto.dlvy_addr2 } ${dto.dlvy_addr3 }</td>
								<td>${dto.dlvy_remark }</td>
								<td>
								<c:choose>
								<c:when test="${dto.pdt_type_cd eq '맞춤화'}"> 
								<input type="button" style='color:white; background-color:#007BFF; border-radius: 10px; text-align: center; display: inline-block; font-size: 16px; margin: 4px 2px; padding: 10px; text-decoration: none; border: none;'  class="checkBtn1" value="수정" /> 
								</c:when> 
								<c:otherwise>
								<input type="button" style='color:white; background-color:#007BFF; border-radius: 10px; text-align: center; display: inline-block; font-size: 16px; margin: 4px 2px; padding: 10px; text-decoration: none; border: none;'  class="checkBtn1" value="수정" hidden="hidden"/>
								</c:otherwise>
								</c:choose> 
								</td>
								<td>
									<input type="button" style='color:white; background-color:#007BFF; border-radius: 10px; text-align: center; display: inline-block; font-size: 16px; margin: 4px 2px; padding: 10px; text-decoration: none; border: none;' class="checkBtn" value="수정" />
								</td>
							</tr> 
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(".checkBtn1").click(function() {
			
			var checkBtn1 = $(this);
			
			var tr = checkBtn1.parent().parent();
			var td = tr.find("td"); 
			
			var ord1 = td.eq(0).text();
			var ord2 = td.eq(3).text();
			var ord3 = td.eq(1).find("input").val();
			console.log(ord3);
			if(ord3 == null || ord3 == ""){
			$.ajax({
				url :  "${pageContext.request.contextPath}/SetOrdType.do",
				type : 'POST',
				data :{ 
					'ordno' : ord1,
					'ord_stat_cd' : ord2
					},
				success : function(result) {
					alert("제작 상태가 수정되었습니다.")
					td.eq(3).text("제작발송");
				}
			})
			} else if(ord3 != null || ord3 != ""){
				alert("이미 발송된 주문입니다. 확인하시고 다시 수정해 주세요.")
			}
		}); 
		
		$(".checkBtn").click(function() {

			var str = ""
			var tdArr = new Array();
			var checkBtn = $(this);

			var tr = checkBtn.parent().parent();
			var td = tr.children();

			var ord = td.eq(0).text();
			var ord3 = td.eq(1).find("input").val();
			if (ord3  == null || ord3 == "" ) {
				alert("송장번호가 입력되지 않았습니다, 다시 한번 확인 해주세요.")
				return;
			}else if(td.eq(2).text() == "맞춤화" && td.eq(3).text() == "주문접수" ) {
					alert("제작주문 진행이 되지 않은 상태 입니다. 제작진행 부터 확인해주세요.")
				
			}else if(ord3 != null || ord3 != "" ) {  
			$.ajax({
				url : "${pageContext.request.contextPath}/SetDelivery.do",
				type : 'POST',
				data : {
					'ordno' : ord,
					'invoiceno' : ord3
				},
				success : function(result) {
					alert("송장번호가 수정되었습니다.");
					td.eq(3).text("배송");
					
				}
			})
			} 
		})
	</script>
</body>
</html>