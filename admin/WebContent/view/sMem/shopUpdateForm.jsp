<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sm_addr3").value = extraAddr;
                
                } else {
                    document.getElementById("sm_addr3").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sm_post').value = data.zonecode;
                document.getElementById("sm_addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sm_addr2").focus();
            }
        }).open();
    }
    
    $(document).ready(function(){
    	var length=$('img').length;
    	for(var i=0; i<3-length; i++){
    		$('#shopimage').append('<br><input type="file" name="file'+i+'"/>');
    	}
    	$('img').on("click",function(){
        	var conf=confirm("이미지를 삭제하시겠습니까?");
        	var shopimg=$(this);
        	if(conf){
        		$.ajax({
    				url:'${pageContext.request.contextPath}/ajax/deleteShopImage.do',
    				dataType:'json',
    				type:'POST',
    				data:{'img_no':$(this).attr('name')},
    				success:function(result){
    					if(result=='1'){
    						shopimg.remove();
    						alert('삭제되었습니다.');
    						$('#shopimage').append('<br><input type="file"/>');
    					}
    				},
    				error:function(request,status, error){
    					alert('code= '+request.status + " message= "+request.responseText+" error = "+error);
    				}
    				
    			})
        	}else{
        		return false;
        	}
        })
    })
    
/*     function isSame(){
    		if(document.getElementById('sm_pw').value !='' && document.getElementById('confirm_pw').value !=''){
    			if(document.getElementById('sm_pw').value == document.getElementById('confirm_pw').value){
    				document.getElementById('same').innerHTML = '비밀번호가 같습니다.';
    				document.getElementById('same').style.color = 'blue';
    				return true;
    			}else{
    				document.getElementById('same').innerHTML = '비밀번호가 다릅니다.'; 
    				document.getElementById('same').style.color = 'red';
    				return false;
    			}
    		}
    	} */
    
    
    function updateshop(){
    	if(frm.sm_pw.value==""){
    		alert("패스워드를 입력하세요.");
    		frm.sm_pw.focus();
    		return false;
    	}
    	if(frm.confirm_pw.value==""){
    		alert("패스워드 중복확인 입력하세요.");
    		frm.confirm_pw.focus();
    		return false;
    	}
    	if(frm.sm_pw.value!="" && frm.confirm_pw.value!=""){
    		if(frm.sm_pw.value != frm.confirm_pw.value){
    			alert("패스워드가 일치하지 않습니다.");
    			frm.confirm_pw.focus();
    			document.getElementById('same').innerHTML = '비밀번호가 다릅니다.'; 
				document.getElementById('same').style.color = 'red';
    			return false;
    		}
    	}
    	window.alert("상점 정보가 변경되었습니다.");
    }
    
</script>
</head>
<body>
	<div class="card mb-4">
		<div class="card-header">상점정보</div>
		<div class="card-body">
			<form id="frm" name="frm" action="${pageContext.request.contextPath}/shopUpdate.do" method="POST" enctype="multipart/form-data" onsubmit="return updateshop()">
				<div class="form-group" id="shopimage">
				<c:forEach var="img" items="${smdto.img_name }">
					<img alt="" width="200px" height="100px" class="shopimg" name="${img.img_no }"
				src="${request.getRequestURL().toString().replace(request.getRequestURI(),'')}/youshoes/view/img/${img.img_name}">
				</c:forEach>
				
				</div>
				<p>(이미지 파일 확장자는 jpg, png만 가능합니다.)</p>
				<div class="form-row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="shop_name">상점이름</label> <input
								class="form-control py-4" id="shop_name" name="shop_name"
								type="text" value="${smdto.shop_name }" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="sm_name">사장 이름</label><input
								class="form-control py-4" id="sm_name" name="sm_name"
								type="text" value="${smdto.sm_name }" />
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="shop_name">아이디</label> <input
								class="form-control py-4" id="shop_name" name="sm_id"
								type="text" value="${smdto.sm_id }" readonly />
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="sm_pw">Password</label><input
								class="form-control py-4" id="sm_pw" name="sm_pw" type="password"
								placeholder="Enter password" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="confirm_pw">Confirm
								Password&nbsp;<span id="same"></span></label><input class="form-control py-4"
								id="confirm_pw" name="confirm_pw" type="password"
								placeholder="Confirm password" />
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="sm_tell">전화번호</label><input
								class="form-control py-4" id="sm_tell" name="sm_tell"
								type="text" value="${smdto.sm_tell }" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="business_no">사업자번호</label><input
								class="form-control py-4" id="business_no" name="business_no"
								type="text" value="${smdto.business_no }" readonly/>
						</div>
					</div>
				</div>
				<!-- 카카오 주소 API -->
                <div class="form-group">
                	
                	<br />
                	<div class="form-group">
                	<label for="sm_post" class="form-control-label active">우편번호&nbsp;&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /></label>
                    <input type="text" id="sm_post" name="sm_post" class="form-control" value="${smdto.sm_post }" required style="width:120px;">
                    
                	</div>
                	<div class="form-group">
                	<label for="sm_addr1" class="form-control-label active">주소</label>
                    <input type="text" id="sm_addr1" name="sm_addr1" class="form-control" value="${smdto.sm_addr1 }">
                    
                	</div>
                	<div class="form-group float-label">
                	<label for="sm_addr2" class="form-control-label active">상세주소</label>
                    <input type="text" id="sm_addr2" name="sm_addr2" class="form-control" value="${smdto.sm_addr2 }">
                    
                	</div>
                	<div class="form-group float-label">
                	<label for="sm_addr3" class="form-control-label active">참고항목</label>
                    <input type="text" id="sm_addr3" name="sm_addr3" class="form-control" value="${smdto.sm_addr3 }">
                    
                	</div>
                </div>
                <!--//카카오 주소 API  -->

				<div class="form-group">
					<label class="small mb-1" for="sm_remark">상점소개글</label><input
						class="form-control py-4" id="sm_remark" name="sm_remark"
						type="text" value="${smdto.sm_remark }" />
				</div>
				<div class="form-row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="sm_time">운영시간</label><input
								class="form-control py-4" id="sm_time" name="sm_time"
								type="text" value="${smdto.sm_time }" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="small mb-1" for="sm_rest">정기휴일</label><input
								class="form-control py-4" id="sm_rest" name="sm_rest"
								type="text" value="${smdto.sm_rest }" />
						</div>
					</div>
				</div>
				<div class="form-group mt-4 mb-0">
					<button type="submit" class="btn btn-primary btn-block">정보
						변경</button>
				</div>
			</form>
		</div>

	</div>

</body>
</html>