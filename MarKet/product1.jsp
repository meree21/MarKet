<%@ page import="dao.ProductRepository"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보</title>
<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가 하실껀가요?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
		String id =request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
		<div class="col-md-5">
			<img src="c:/upload/<%=product.getFilename()%>" style="width:100%"/>
			</div>
			<div class="col-md-6">
				<h3><% out.println(product.getPname()); %></h3>
				<p><% out.println(product.getDescription()); %></p>
				<p> <b>상품 코드 : </b><span class="badge badge=danger">
					<%=product.getProductId() %></span>
				<p> <b>제조사</b> : <% out.println(product.getManufacturer()); %>
				<p> <b>분류</b> : <% out.println(product.getCategory()); %>
				<p> <b>재고 수</b> : <% out.println(product.getUnitsInStock()); %>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;></a>
				</form>
			</div>
			
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>