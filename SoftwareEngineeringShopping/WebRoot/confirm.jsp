<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.software.shopping.cart.*,com.software.shopping.product.*,com.software.shopping.user1.*,java.sql.*" %>

<%--
// check session to see if there's a cart in it
Cart cart = (Cart) session.getAttribute("cart");
if(cart == null){
	cart = new Cart();
	session.setAttribute("cart", cart);
}
--%>

<% 
User u = (User) session.getAttribute("user");
if(u == null){
	out.println("您现在还没有登录，如果您确认继续购买，按市场价，<a href=register.jsp>注册</a> 是免费的");
	//out.println("<a href=confirmusenormal.jsp>继续</a><br>");
	out.println("<a href=userLogin.jsp>登录</a>");
	//response.sendRedirect("userLogin.jsp");
}
%>

<jsp:useBean id="cart" class="com.software.shopping.cart.Cart" scope="session"></jsp:useBean>

<table>
	<tr>
		<td>商品ID</td>
		<td>商品名称</td>
		<td>商品价格(<%=(u==null)?"市场价":"会员价" %>)</td>
		<td>购买数量</td>
		<td></td>
		<td></td>
	</tr>
	
	<%
	List<CartItem> items = cart.getItems();
	for(int i = 0; i < items.size(); i ++)
	{
		CartItem ci = items.get(i);
		Product p = ProductManager.getInstance().loadById(ci.getProductId());
		%>
		<tr>
			<td><%=ci.getProductId()%></td>
			<td><%=ProductManager.getInstance().loadById(ci.getProductId()).getName() %></td>
			<td><%=(u==null)? p.getNormalPrice(): p.getMemberPrice()%></td>
			<td>
				<%=ci.getCount()%>
			</td>
			<td></td>
		</tr>
		<%
	}
	 %>
</table>

<center>
	共<%=Math.round(cart.getTotalPrice()*100)/100 %> 元<br>	
	<%
	if(u != null){
		%>
		欢迎您<%=u.getUsername() %>请确认您的送货信息<br>
		<%
	}
	%>
	
	<form action="" method="post">
		送货信息：<br>
		<textarea name="addr" ><%=(u==null) ? "" :u.getAddr() %></textarea>
		<input type="submit" value="下单">
	</form> 
	 
</center>










