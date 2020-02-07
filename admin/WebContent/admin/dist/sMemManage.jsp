<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<!DOCTYPE html>
<html>
<head>
<title>You Shoes</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<div class="col-lg-6 col-md-12">
		<form class="form-group">
			<div class="text-center mt-3">
				<p class="h2">회원등록</p>
			</div>
			<div class="form-group row">
				<label class="col-3">아이디</label>
				<div class="col-9">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-3">비밀번호</label>
				<div class="col-9">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-3">비밀번호확인</label>
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
				<label class="col-3">상호명</label>
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
						placeholder="우편번호"> <input type="button" onclick="btn()"
						value="우편번호 찾기"><br> <input type="text" id="addr1"
						class="form-control" placeholder="주소"> <input type="text"
						id="detailaddr1" class="form-control" placeholder="상세주소">
					<input type="text" id="extraaddr1" class="form-control"
						placeholder="참고항목">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-3" for="exampleFormControlTextarea1">가게 관련
					비고</label>
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
	<!-- <div class="card-header">
				<i class="fas fa-table mr-1"></i>판매 회원 목록
			</div>
			<div class="card-body">
			<div class="col-lg-6 col-md-12">
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
		</div> -->
	<!-- 우편번호-->
	<script src="js/postcode.js"></script>
</body>
</html>