<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductReg</title>
<link rel="stylesheet" href="assets/css/register.css">
</head>
<body>
	<div class="contents-wrap">
		<h3>상품 등록</h3>
		<hr>
		<form action="productReg.cc" method="post">
			<ul class="join-wrap">
				<li>상품 코드</li>
				<li><input name="pcode" type="text" placeholder="상품 코드(영문 최대 20글자)를 입력해 주세요." /></li>
				<li>카테고리</li>
				<li><input name="category" type="text" placeholder="카테고리(영문 2글자)" /></li>
				<li>상품명</li>
				<li><input name="pname" type="text" placeholder="상품명을 입력해 주세요." /></li>
				<li>가격</li>
				<li><input name="price" type="text" placeholder="가격을 입력하세요.(숫자 최대 9자리)" /></li>
			</ul>
			<button class="join-btn">상품 등록</button>
		</form>
	</div>
	<script src="assets/js/script.js"></script>
</body>
</html>