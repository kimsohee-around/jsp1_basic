<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1-</title>
<link rel="stylesheet" href="assets/css/customers.css">
</head>
<body>
	<h3>상품 조회 - day3 products.jsp 에 검색기능 추가</h3>
	<div class="search">
	<!-- form action 이 없을 때 동작은? 자기자신 url 입니다.  method 기본값은 GET -->
		<form>
		<select name="category">
			<option value="">카테고리 선택</option>
			<c:forEach items="${cateList }" var="cate">
				<option value="${cate}"><c:out value="${cate }" /></option>
			</c:forEach>
		</select>
		<input type="text" name="keyword" placeholder="상품명 검색어 입력하세요.">
		<span style="padding-left: 10px;">가격대별</span>
		<input type="text" name="from" placeholder="10000"><b>~</b>
		<input type="text" name="to" placeholder="50000">
		<button id="search" type="button">조회</button>
		<button id="selectAll" type="button" onclick="location.href='search.cc'">전체보기</button>
		</form>
	</div>
	<hr>
	<ul>
		<!-- list 이름의 애트리뷰를 대상으로 합니다. : 애트리뷰트 작성은 서블릿에서 합니다. -->
		<c:forEach items="${list }" var="vo" varStatus="status">
			<li>
				<ul class="row">
					<li><c:out value="${status.index + 1 }"/></li>
					<li><c:out value="${vo.pcode }"/></li>
					<li><c:out value="${vo.category }"/></li>
					<li><c:out value="${vo.pname }"/></li>
					<li><c:out value="${vo.price }"/></li>
				</ul>
			</li>	
		</c:forEach>
	</ul>	
	<script type="text/javascript" src="assets/js/search.js"></script>
</body>
</html>








