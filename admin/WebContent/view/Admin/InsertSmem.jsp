<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 회원 등록</title>
</head>
<body>
	<br>
	<div>
		<div class="card text-center" style="width: 900px; margin: 0 auto;">
			<div class="card-header">판매 회원 등록</div>
			<div class="card-body">
				<form>
					<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="아이디">
					<br>
					<input type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="비밀번호">
					<br>
					<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="성함">
					<br>
					<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="상호명">
					<br>
					<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="전화번호">
					<br>
					<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="사업자 번호">
					<br>
					<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="주소">
					<br>
					<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="사업자 번호">
					<br>
					<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="사업자 번호">
					<br>
					<div class="row">
						<div class="col">
							<input type="text" id="postcd" class="form-control" placeholder="우편번호">
						</div>
						<div class="col">
							<input type="button" onclick="btn()" value="우편번호 찾기" class="btn btn-primary" style="width: 440px;">
						</div>
					</div>
					<br>
					<input type="text" id="addr1" class="form-control" placeholder="주소">
					<br>
					<input type="text" id="detailaddr1" class="form-control" placeholder="상세주소">
					<br>
					<input type="text" id="extraaddr1" class="form-control" placeholder="참고항목">
					<br>
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="40"></textarea>
					<br>
					<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>