<%@ page import="dao.BookRepository"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>

<% 
	String id=request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book product = dao.getBookById(id);
	if(product ==null){
		response.sendRedirect("exceptionNoProductld.jsp");
	}
	
	ArrayList<Book> goodsList = dao.getAllBooks();
	Book goods = new Book();
	for(int i = 0; i<goodsList.size(); i++){
		goods =goodsList.get(1);
		if(goods.getBookId().equals(id)){
			break;
		}
	}
	
	ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");
	if(list == null){
		list = new ArrayList<Book>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0 ;
	Book goodsQnt = new Book();
	for(int i =0; i<list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getBookId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuanity() + 1;
			goodsQnt.setQuanity(orderQuantity);
			
		}
	}
	if(cnt == 0){
		goods.setQuanity(1);
		list.add(goods);
	}
	response.sendRedirect("books.jsp?id="+ id);
%>