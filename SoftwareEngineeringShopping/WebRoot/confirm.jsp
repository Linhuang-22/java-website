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
	out.println("�����ڻ�û�е�¼�������ȷ�ϼ������򣬰��г��ۣ�<a href=register.jsp>ע��</a> ����ѵ�");
	//out.println("<a href=confirmusenormal.jsp>����</a><br>");
	out.println("<a href=userLogin.jsp>��¼</a>");
	//response.sendRedirect("userLogin.jsp");
}
%>

<jsp:useBean id="cart" class="com.software.shopping.cart.Cart" scope="session"></jsp:useBean>

<table>
	<tr>
		<td>��ƷID</td>
		<td>��Ʒ����</td>
		<td>��Ʒ�۸�(<%=(u==null)?"�г���":"��Ա��" %>)</td>
		<td>��������</td>
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
	��<%=Math.round(cart.getTotalPrice()*100)/100 %> Ԫ<br>	
	<%
	if(u != null){
		%>
		��ӭ��<%=u.getUsername() %>��ȷ�������ͻ���Ϣ<br>
		<%
	}
	%>
	
	<form action="" method="post">
		�ͻ���Ϣ��<br>
		<textarea name="addr" ><%=(u==null) ? "" :u.getAddr() %></textarea>
		<input type="submit" value="�µ�">
	</form> 
	 
</center>










