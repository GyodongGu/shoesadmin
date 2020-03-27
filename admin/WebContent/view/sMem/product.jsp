<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function insertProduct(){
		if(frm.pdt_name.value==""){
			alert("제품 이름을 입력하세요");
			frm.pdt_name.focus();
			return false;
		}
		if($('input:radio[name=pdt_type_cd]').is(':checked')== false){
			alert("제품 타입을 정해주세요");
			return false;
		}
		if($('input:radio[name=pdt_kind_cd]').is(':checked')== false){
			alert("제품 종류을 정해주세요");
			return false;
		}
		if($('input:radio[name=gender_cd]').is(':checked')== false){
			alert("제품 성별을 정해주세요");
			return false;
		}
		if(frm.pdt_price.value==""){
			alert("제품 가격을 입력하세요");
			frm.pdt_price.focus();
			return false;
		}
		/* if($('.pdt_size_cd').val()==""){
			alert("사이즈를 선택해주세요");
			return false;
		} */
		for(var i =0; i<$('.pdt_size_cd').length; i++){
			if($('.pdt_size_cd')[i].value==''){
				alert("사이즈를 선택해주세요");
				return false;
			}
		}
		for(var j=1; j<=$('.selectsize').length; j++){
			if($('input:checkbox[name=pdt_color_cd'+j+']').is(':checked')==false){
				alert("색상을 정해주세요");
				return false;
			}
		}
		/* if($('input:checkbox[class=checkSelect]').is(':checked')==false){
			alert("색상을 정해주세요.");
			return false;
		} */
		window.alert("제품 등록되었습니다.");
	}
</script>

</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7">
				<div class="card shadow-lg border-0 rounded-lg mt-5">
					<div class="card-header">
						<h3 class="text-center font-weight-light my-4">${nid }</h3>
						<h3 class="text-center font-weight-light my-4">상품 등록</h3>
					</div>
					<div class="card-body">
						<form id="frm" name="frm" method="POST" action="${pageContext.request.contextPath}/productInsert.do" enctype="multipart/form-data" onsubmit="return insertProduct()">							
							<div class="form-group">
								<label class="small mb-1" for="productName">제품이름</label>
								<input class="form-control py-4" id="productName" name="pdt_name" type="text" placeholder="제품 이름을 입력해주세요" />
							</div>
							<div class="form-group productimg">
								<p class="small mb-1">제품사진</p>
								<button type="button" class="btn btn-primary" id="insertimg">사진추가</button><br>
								<input type="file"  name="file1"/>
								<!-- <input type="file" name="file2"/>
								<input type="file" name="file3"/> -->
							</div>
							<div class="form-group">
								<p class="small mb-1">기성화 OR 맞춤화</p>
								<input type="radio" name="pdt_type_cd" id="performed" value="P" />기성화
								<input type="radio" name="pdt_type_cd" id="customed" value="C" />맞춤화
							</div>
							<div class="form-group">
								<p class="small mb-1">제품종류</p>
								<input type="radio" name="pdt_kind_cd" id="shoes" value="S01" />구두
								<input type="radio" name="pdt_kind_cd" id="sportsShoes" value="S02" />운동화
								<input type="radio" name="pdt_kind_cd" id="sandle" value="S03" />샌들
								<input type="radio" name="pdt_kind_cd" id="walker" value="S04" />워커
							</div>
							<div class="form-group">
								<p class="small mb-1">성별</p>
								<input type="radio" name="gender_cd" id="man" value="M" />남성용
								<input type="radio" name="gender_cd" id="woman" value="W" />여성용
							</div>
							<div class="form-group">
								<label class="small mb-1" for="pdt_price">가격</label>
								<input class="form-control py-4" id="pdt_price" name="pdt_price" type="text" placeholder="가격을 입력해주세요" />
							</div>
							<div class="form-group">
								<label class="small mb-1" for="pdt_remark">제품 설명</label>
								<input class="form-control py-4" id="pdt_remark" name="pdt_remark" type="text" placeholder="제품을 설명해주세요" />
							</div>
							<div class="form-group addoption" style="display:none">
								<button type="button" class="addselect">사이즈 추가</button><br><br>
								<input type="hidden" name="count" id="count"/>
								<div class="selectsize">
								<label class="small mb-1" for="pdt_size_cd">사이즈</label>
								<select id="pdt_size_cd" name="pdt_size_cd" class="pdt_size_cd">
									<option value="">사이즈선택</option>
									<c:forEach var="size" items="${slist }">
										<option value="${size.code_id }">${size.code_name }</option>
									</c:forEach>
								</select><br>
								<c:forEach var="color" items="${clist }">
									<input type="checkbox" name="pdt_color_cd1" value="${color.code_id }" class="checkSelect" />${color.code_name }
								</c:forEach>
								<input type="hidden" name="chkselect" class="chkselect"/>
								</div>
							</div>
							
							<div class="form-group mt-4 mb-0">
								<button type="submit" class="btn btn-primary btn-block">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('input[type=radio][name=pdt_type_cd]').on('click',function(){
			var chkValue= $('input[type=radio][name=pdt_type_cd]:checked').val();
			
			if(chkValue=='P'){
				$('.addoption').css('display','block');
			}
			if(chkValue=='C'){
				$('.addoption').css('display','none');
			}
		})
		var cnt=1;
		$('.addselect').on('click',function(){
			cnt++;
			$('#count').val(cnt);
			var newbox = $('.selectsize').eq(0).clone();
			newbox.find('.checkSelect').attr('name','pdt_color_cd'+cnt);
			newbox.appendTo('.addoption');
			
		})
		
		var i = 2;
		$('#insertimg').on('click',function(){
			if(i>=4){
				alert("사진은 최대 3장입니다.");
				return false;
			}
			$('.productimg').append('<input type="file" name="file'+i+'"/>');
			
			i++;
		})
		
	
	</script>

</body>
</html>