<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*" %>
    <%@ page import="com.oreilly.servlet.multipart.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="dto.Book" %>
    <%@ page import="dao.BookRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String filename="";
		String realFolder = "C:\\upload";
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";
	
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		String productId = multi.getParameter("bookId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		String totalPages = multi.getParameter("totalPages");
		String publisher = multi.getParameter("publisher");
		String author = multi.getParameter("author");
		String date = multi.getParameter("releaseDate");
		Integer price;
		
		if(unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);
		
		long stock;
		
		if(unitsInStock.isEmpty())
			stock = 0;
		else
			stock = Long.valueOf(unitsInStock);
		
		long total;
		
		if(totalPages.isEmpty())
			total = 0;
		else
			total = Long.valueOf(totalPages);
		
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement(); 
		String fileName = multi.getFilesystemName(fname);
		
	
		BookRepository dao = BookRepository.getInstance();
		
		
		Book newBook = new Book();
		
		newBook.setBookId(productId);
		newBook.setName(name);
		newBook.setUnitPrice(price);
		newBook.setDescription(description);
		newBook.setCategory(category);
		newBook.setUnitsInStock(stock);
		newBook.setCondition(condition);
		newBook.setTotalPages(total);
		newBook.setPublisher(publisher);
		newBook.setAuthor(author);
		newBook.setReleaseDate(date);
		newBook.setFilename(fileName);
		dao.addBook(newBook);
		
		response.sendRedirect("book.jsp");
	%>
</body>
</html>