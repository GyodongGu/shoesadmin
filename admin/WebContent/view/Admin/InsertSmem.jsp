<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 회원 등록</title>
	<!-- 주소 API  -->
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
	</script>
	<!-- /주소 API -->
	<script>
	/* 아이디 중복체크 */
    function idCheck() {
	var id = frm.sm_id.value;
	console.log(id);
	if (id == "") {
		alert("아이디값을 입력후 확인하세요.");
		frm.sm_id.focus();
	} else {
		window.open("${pageContext.request.contextPath}/IdOverlap.do?sm_id=" + id, "idChkAlert", "width=500, height=200, top=50, left=50, scrollbars=no, status=no, toolbar=no, menubar=no, resizeable=no, location=no");
	}
	}
	/* /아이디 중복체크 */
	/* 비밀번호 일치여부 체크 */
    	function isSame(){
    		if(document.getElementById('sm_pw').value !='' && document.getElementById('sm_pwChk').value !=''){
    			if(document.getElementById('sm_pw').value == document.getElementById('sm_pwChk').value){
    				document.getElementById('same').innerHTML = '비밀번호가 같습니다.';
    				document.getElementById('same').style.color = 'blue';
    			}else{
    				document.getElementById('same').innerHTML = '비밀번호가 다릅니다.'; 
    				document.getElementById('same').style.color = 'red';
    			}
    		}
    	}
    /* /비밀번호 일치여부 체크 */
    /* 회원가입 점검 */
    function chkjoin(){
    	if(frm.idChk.value=="unCheck"){
			alert("아이디 중복확인 해주세요.");
			frm.idChk.focus();
			return false;
		}
    	if(frm.sm_pw.value != frm.sm_pwChk.value){
			alert("패스워드가 일치하지 않습니다. 다시 확인해주세요.");
			frm.sm_pw.focus();
			return false;
		}
    }
    /*/회원가입 점검 */
	</script>
</head>
<body>
	<!-- id중복체크 창 안뜨고 알림창만 뜨게 -->
	<iframe width=0 height=0 name="idChkAlert" style="display: none;"></iframe>
	
	<br>
	<div>
		<div class="card text-center" style="width: 900px; margin: 0 auto;">
			<div class="card-header">판매 회원 등록</div>
			<div class="card-body">
				<form id="frm" name="frm" action="${pageContext.request.contextPath}/InsertOk.do" method="post" onsubmit="return chkjoin()">
					<div align="left"><font color="red">*</font>아이디</div>
					<div class="row">
						<div class="col">
							<input type="text" class="form-control" id="sm_id" name="sm_id" placeholder="아이디를 입력하세요.">
						</div>
						<div class="col">
							<input type="button" id="idChk" name="idChk" onclick="idCheck()" value="중복확인" class="btn btn-primary" style="width: 440px;">
						</div>
					</div>
					<br>
					<div align="left"><font color="red">*</font>비밀번호</div>
					<input type="password" class="form-control" id="sm_pw" name="sm_pw" onchange="isSame()" required placeholder="비밀번호를 입력하세요.">
					<br>
					<div align="left">비밀번호 확인&nbsp;<span id="same"></span></div>
					<input type="password" class="form-control" id="sm_pwChk" name="sm_pwChk" required onchange="isSame()" placeholder="비밀번호를 입력하세요.">
					<br>
					<div align="left"><font color="red">*</font>이름</div>
					<input type="text" class="form-control" id="sm_name" name="sm_name" required placeholder="이름을 입력하세요.">
					<br>
					<div align="left"><font color="red">*</font>상호명</div>
					<input type="text" class="form-control" id="shop_name" name="shop_name" required placeholder="상호명을 입력하세요.">
					<br>
					<div align="left"><font color="red">*</font>전화번호</div>
					<input type="tel" class="form-control" id="sm_tell" name="sm_tell" required maxlength="15" placeholder="전화번호를 입력하세요.">
					<br>
					<div align="left"><font color="red">*</font>사업자번호</div>
					<input type="tel" class="form-control" id="business_no" name="business_no" required placeholder="사업자 번호를 입력하세요.">
					<br>
					
					<!-- 카카오 주소 API -->
					<div class="form-group float-label active">
						<div align="left"><font color="red">*</font>우편번호</div>
						<div class="row">
							<div class="col">
								 <input type="text" id="sm_post" name="sm_post" class="form-control" placeholder="우편번호">
							</div>
							<div class="col">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary" style="width: 440px;">
							</div>
						</div>
						<br>
						<div align="left"><font color="red">*</font>주소</div>
						<input type="text" id="sm_addr1" name="sm_addr1" class="form-control" placeholder="주소">
						<br>
						<div align="left">상세주소</div>
						<input type="text" id="sm_addr2" name="sm_addr2" class="form-control" placeholder="상세주소">
						<br>
						<div align="left">참고항목</div>
						<input type="text" id="sm_addr3" name="sm_addr3" class="form-control" placeholder="참고항목">
					</div>
					<!--//카카오 주소 API  -->
					<br>
					<div align="left">비고</div>
					<textarea class="form-control" id="sm_remark" name="sm_remark" rows="5" cols="40" placeholder="가게 관련 비고사항을 입력하세요."></textarea>
					<br>
					<div align="left">운영시간</div>
					<input type="text" class="form-control" id="sm_time" name="sm_time" placeholder="운영시간을 입력하세요.">
					<br>
					<div align="left">휴무일</div>
					<input type="text" class="form-control" id="sm_rest" name="sm_rest" placeholder="휴무일을 입력하세요.">
					<br>
					<button type="submit" class="btn btn-primary btn-lg btn-block">등 록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>