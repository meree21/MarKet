<%@ page import="dao.ProductRepository"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>

<% 
	String id=request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("product1.jsp");
		return;
	}
	
	ProductRepository dao =ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product ==null){
		response.sendRedirect("exceptionNoProductld.jsp");
	}
	
	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for(int i = 0; i<goodsList.size(); i++){
		goods =goodsList.get(1);
		if(goods.getProductId().equals(id)){
			break;
		}
	}
	
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0 ;
	Product goodsQnt = new Product();
	for(int i =0; i<list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuanity() + 1;
			goodsQnt.setQuanity(orderQuantity);
		}
	}
	if(cnt == 0){
		goods.setQuanity(1);
		list.add(goods);
	}
	response.sendRedirect("product1.jsp?id="+ id);
%>