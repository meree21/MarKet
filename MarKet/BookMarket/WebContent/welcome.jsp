<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Welcome</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%!String greeting = "도서 웹 쇼핑몰";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>

	</div>
	<div class="text-center">
		<h3>
			<%
				String tagling = "Welcome to Book Market!";
			%>
			<%=tagling%>
		</h3>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>