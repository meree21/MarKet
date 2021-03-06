<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
	
		String cartId = session.getId();
		
		String shipping_cartId ="";
		String shipping_name ="";
		String shipping_shippingDate ="";
		String shipping_zipCode ="";
		String shipping_country ="";
		String shipping_addressName ="";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i =0; i<cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			}
		}
%>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display">주문완료</h1>
	</div>
</div>
<div class="contaner">
	<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
	<p>주문은 <% out.println(shipping_shippingDate); %>
	<p>주문번호 : <% out.println(shipping_cartId); %>
</div>
<div class="contaner">
	<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
</div>
</body>
</html>
<% 
session.invalidate();

	for(int i =0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("shipping_cartId"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_name"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_country"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>
	