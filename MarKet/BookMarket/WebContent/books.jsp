<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가 하실껀가요?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="c:/upload/<%=book.getFilename()%>" />
			</div>
			<div class="col-md-12">
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription() %>
				<p><b>도서코드 : </b><span class="badge badge-danger">
				<%=book.getBookId() %></span>
				<p><b>출판사</b> : <%=book.getPublisher() %>
				<p><b>저자</b> : <%=book.getAuthor() %>
				<p><b>재고 수</b> : <%=book.getUnitsInStock() %>
				<p><b>총페이지수</b> : <%=book.getTotalPages() %>
				<p><b>출판일</b> : <%=book.getReleaseDate() %>
				<h4><%=book.getUnitPrice() %>원</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=book.getBookId()%>" method="post"></form>
				<p><a href="#" class="btn btn-info"onclick="addToCart()" >상품 주문 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
				<a href="book.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>