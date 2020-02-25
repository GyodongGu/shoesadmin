<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>YouShoes</title>
<link href="${pageContext.request.contextPath}/view/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

	<!-- charts.jsp -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	
	<!--  eventInsert.jsp -->
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>

<decorator:head />
</head>
<body class="sb-nav-fixed">
	<!-- 상단 메뉴바 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="#">YouShoes</a>
		<!-- 사이드 메뉴바 상단 버튼 -->
		<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle">
			<i class="fas fa-bars"></i>
		</button>
		<!-- 사이드바 메뉴바 크기 줄일 떄 프로필 이동 부분 -->
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group" style="visibility: hidden;">
				<input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- // 사이드바 메뉴바 크기 줄일 떄 프로필 이동 부분 -->
		<!-- 상단 메뉴바 프로필 설정 부분 -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="userDropdown" href="${pageContext.request.contextPath}/view/sMem/sMem.jsp" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> </a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/view/Admin/logout.jsp">로그아웃</a>
				</div></li>
		</ul>
		<!-- 상단 메뉴바 프로필 설정 부분 -->
	</nav>
	<!-- // 상단 메뉴바 -->
	<!-- 사이드 메뉴바  -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading"></div>
						<!-- 사이드바 기본 메뉴들 -->
						<a class="nav-link" href="${pageContext.request.contextPath}/view/sMem/sMem.jsp"> 홈 </a>
						<a class="nav-link" href="${pageContext.request.contextPath}/view/Admin/InsertEvent.jsp"> 공지사항 </a>
						<a class="nav-link" href="${pageContext.request.contextPath}/view/sMem/callendar.jsp"> 일정관리 </a>
						<!-- // 사이드바 기본 메뉴들 -->
						<div class="sb-sidenav-menu-heading"></div>
						<!-- 사이드바 추가 관리 메뉴들 -->
						<a class="nav-link" href="${pageContext.request.contextPath}/view/Admin/sMemManage.jsp"> 판매 회원 관리 </a>
						<a class="nav-link" href="${pageContext.request.contextPath}/view/Admin/backup.jsp"> 구매 회원 탈퇴 후 백업 거래 내역 </a>
						<a class="nav-link" href="${pageContext.request.contextPath}/view/Admin/codeManage.jsp"> 코드ID </a>
						<a class="nav-link" href="${pageContext.request.contextPath}/view/sMem/charts.jsp"> 매출 </a>
						<!-- // 사이드바 추가 관리 메뉴들 -->
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
		<div class="container-fluid">
	<decorator:body />
	</div>
	</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/view/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/view/assets/demo/chart-area-demo.js"></script>
	<script src="${pageContext.request.contextPath}/view/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/view/assets/demo/datatables-demo.js"></script>

</body>
</html>