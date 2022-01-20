<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서목록</title>
</head>
<body>
<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서목록</h1>
		</div>
	</div>
	<%
		BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	<div class="container">
		<div >
			<%
				for (int i = 0; i < listOfBooks.size(); i++) {
					Book book = listOfBooks.get(i);
			%>
			<div>
				<img src="C:/upload/<%=book.getFilename()%>" style="width: 100px; float:left; margin-right:100px" />
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription()%>
				<p><%=book.getAuthor()%> | <%=book.getPublisher()%> | <%=book.getUnitPrice()%>원
				<p align="right">
					<a href="./books.jsp?id=<%=book.getBookId()%>"
						class="btn btn-secondary" role="button">상세 정보&raquo;</a>
			</div>
			<hr>
			<br>
			<%
				}
			%>
		</div>
		
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>