<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.software.shopping.*,com.software.shopping.user1.*,com.software.shopping.order.SalesOrder,java.sql.*"%>


<%
	User u = (User) session.getAttribute("user");
%>

<jsp:useBean id="cart" class="com.software.shopping.Cart" scope="session"></jsp:useBean>
<%
	if (cart = null)
		out.println("没有任何购物项");
	return;
%>


<%
	String addr = request.getParameter("addr");
	SalesOrder so = new SalesOrder();
	so.setCart(cart);
	so.setAddr(addr);
	so.setUser(u);
	so.setODate(new Timestamp(System.currentTimeMillis()));
	so.setStatus(0);
	so.save();
	session.removeAttribute("cart");
%>

<center>谢谢您在本站购物！欢迎继续</center>