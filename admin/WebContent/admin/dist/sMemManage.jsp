<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>You Shoes</title>
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function btn() {
		new daum.Postcode({
			oncomplete : function(data) {
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
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("extraaddr1").value = extraAddr;

				} else {
					document.getElementById("extraaddr1").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcd').value = data.zonecode;
				document.getElementById("addr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailaddr1").focus();
			}
		}).open();
	}
</script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">You Shoes</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group" style="visibility: hidden;">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a><a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="login.html">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.jsp"><div
								class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 홈</a> <a class="nav-link" href="callendar.jsp"><div
								class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 공지사항 및 이벤트 </a>
						<div class="sb-sidenav-menu-heading">회원 관리</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts"><div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 판매 회원 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="sMemManage.jsp">판매 회원 등록 </a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages"><div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 구매 회원 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="backup.jsp">구매 회원 탈퇴 후
									거래내역 </a>
							</nav>
						</div>
						<a class="nav-link" href="#"><div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 코드ID</a> <a class="nav-link" href="charts.jsp"><div
								class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 매출</a>
					</div>
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<div>
					<form>
						<div class="text-center mt-5">
							<p class="h2">회원등록</p>
						</div>
						<div class="form-group row mt-5">
							<label class="col-3">아이디</label>
							<div class="col-9">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3">비밀번호</label>
							<div class="col-9">
								<input type="text" class="form-control ">
							</div>
						</div>
						<!-- 비밀번호확인 추가예정 -->
						<div class="form-group row">
							<label class="col-3">상호명</label>
							<div class="col-9">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3">이름</label>
							<div class="col-9">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3">전화번호</label>
							<div class="col-9">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3">사업자번호</label>
							<div class="col-9">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3">주소</label>
							<div class="col-9">
								<input type="text" id="postcd" class="form-control"
									placeholder="우편번호"> <input type="button"
									onclick="btn()" value="우편번호 찾기"><br> <input
									type="text" id="addr1" class="form-control" placeholder="주소">
								<input type="text" id="detailaddr1" class="form-control"
									placeholder="상세주소"> <input type="text" id="extraaddr1"
									class="form-control" placeholder="참고항목">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3" for="exampleFormControlTextarea1">가게
								관련 비고</label>
							<div class="col-9">
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="5" cols="40"></textarea>
							</div>
						</div>
						<div class="float-right">
							<input class="btn btn-primary" type="submit" value="등록">
						</div>
					</form>
				</div>
				<div class="card-header">
					<i class="fas fa-table mr-1"></i>판매 회원 목록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<form>
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</tfoot>
							</table>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>
</body>
</html>