<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<form>							
							<div class="form-group">
								<label class="small mb-1" for="productName">제품이름</label>
								<input class="form-control py-4" id="productName" name="pdt_name" type="text" placeholder="제품 이름을 입력해주세요" />
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
							<div class="form-group mt-4 mb-0">
								<a class="btn btn-primary btn-block" href="login.html">등록</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>