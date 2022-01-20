<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger"> 해당 상품이 없습니다.</h2>
		</div>
	</div>
	<div class="contaner">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString() %>
		<p><a href="products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
	</div>
</body>
</html>