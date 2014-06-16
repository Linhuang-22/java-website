<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*, com.software.shopping.cart.* ,com.software.shopping.product.*,com.software.shopping.user1.*,java.sql.*" %>

<%--
// check session to see if there's a cart in it
Cart cart = (Cart) session.getAttribute("cart");
if(cart == null){
	cart = new Cart();
	session.setAttribute("cart", cart);
}
--%>

<jsp:useBean id="cart" class="com.software.shopping.cart.Cart" scope="session"></jsp:useBean>

<%
request.setCharacterEncoding("GB18030");
int id = Integer.parseInt(request.getParameter("id"));
CartItem ci = new CartItem();
Product p = ProductManager.getInstance().loadById(id);
ci.setProductId(id);
ci.setPrice(p.getNormalPrice()); // need to check if the user logged in
ci.setCount(1);
cart.add(ci);

response.sendRedirect("cart.jsp");
%>
