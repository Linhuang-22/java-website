<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.software.shopping.cart.*,com.software.shopping.product.*, com.software.shopping.user1.*,java.sql.*" %>

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
if(cart == null)
{
	out.println("û���κι�����");
	return;
}
%>

<center>��һ����������ô�����Ʒ��</center>
<form action="cartupdate.jsp" method="post">
<table>
	<tr>
		<td>��ƷID</td>
		<td>��Ʒ����</td>
		<td>��Ʒ�۸�</td>
		<td>��������</td>
		<td></td>
		<td></td>
	</tr>
	
	<%
	List<CartItem> items = cart.getItems();
	for(int i = 0; i < items.size(); i ++)
	{
		CartItem ci = items.get(i);
		%>
		<tr>
			<td><%=ci.getProductId()%></td>
			<td><%=ProductManager.getInstance().loadById(ci.getProductId()).getName()  %></td>
			<td><%=ci.getPrice() %></td>
			<td><%=ci.getCount() %></td>
			<td>
				<input type=text size=4 name="<%="p"+ci.getProductId()%>" value="<%=ci.getCount() %>">
			</td>
			<td></td>
		</tr>
		<%
	}
	 %>
</table>

<center>
	��<%=Math.round(cart.getTotalPrice()*100)/100 %> Ԫ<br>
	<input type="submmit" value="�޸�����">
	<input type="button" value="ȷ�϶���" onclick="document.location.href = 'confirm.jsp'">	
</center>
</form>
