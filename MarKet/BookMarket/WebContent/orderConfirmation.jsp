<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
    

<%
		request.setCharacterEncoding("UTF-8");
	
		String cartId = session.getId();
		
		String shipping_cartId ="";
		String shipping_name ="";
		String shipping_shippingDate ="";
		String shipping_country ="";
		String shipping_zipCode ="";
		String shipping_addressName ="";
		
		Cookie[] cookies = request.getCookies();
		//String a = cookies==null? "a" :"b";
		//out.print(a);
		if(cookies != null){
			for(int i =0; i<cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shipping_name"))
					shipping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shipping_country"))
					shipping_country = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shipping_zipCode"))
					shipping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shipping_addressName"))
					shipping_addressName = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			}
		}
		
%>

<html>
<head>
<title>주문 정보</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="textcenter">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<Strong>배송 주소</Strong><br> 성명 : <%out.println(shipping_name); %> <br>
				우편번호 : <%out.println(shipping_zipCode); %> <br>
				주소 : <%out.println(shipping_addressName); %>(<%out.println(shipping_country); %>) <br>
			</div>	
			<div class="col-4" align="right">
				<p> <em>배송일 : <%out.println(shipping_shippingDate); %></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">도서</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소개</th>
				</tr>
				<%
					int sum = 0;
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if(cartList == null)
						cartList = new ArrayList<Book>();
					for(int i = 0; i<cartList.size(); i++){
						Book book = cartList.get(i);
						int total =book.getUnitPrice() * book.getQuanity();
						sum = sum + total;
				%>
				<tr>
					<td class="text-center"><em><%=book.getName()%></em></td>
					<td class="text-center"><%=book.getQuanity()%></td>
					<td class="text-center"><%=book.getUnitPrice()%>원</td>
					<td class="text-center"><%=total%>원</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><Strong>총액 :</Strong></td>
					<td class="text-center text-danger"><Strong><%=sum %></Strong></td>
				</tr>
			</table>
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="buton">이전</a>
			<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
			<a href="./checkOutcancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
</body>
</html>