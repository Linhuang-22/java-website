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

<% 
User u = (User) session.getAttribute("user");
if(u == null){
	out.println("您现在还没有登录，如果您确认继续购买，按市场价，<a href=register.jsp>注册</a> 是免费的");
	out.println("<a href=confirmusenormal.jsp>继续</a><br>");
	out.println("<a href=userLogin.jsp>登录</a>");
	//response.sendRedirect("userLogin.jsp");
}
%>

<jsp:useBean id="cart" class="com.software.shopping.cart.Cart" scope="session"></jsp:useBean>

<%
if(cart == null)
{
	out.println("没有任何购物项");
	return;
}

List<CartItem> items = cart.getItems();
for(int i = 0; i < items.size(); i ++){
	CartItem ci = items.get(i);
	String strCount = request.getParameter("p" + ci.getProductId());
	if(strCount != null && strCount.trim().equals("")){
		ci.setCount(Integer.parseInt(strCount));
	}
}

//response.sendRedirect("cart.jsp");
%>

<center>
修改成功
三秒钟后自动重定向
<div id="num"></div>
</center>
<script language="javascript">
document.location.href = "cart.jsp";
	//var leftTime = 5000;
	//function go(){
	//	document.getElementById("num").innerText = leftTime/1000;
	//	leftTime -= 1000;
	//	if(leftTime <= 0){
	//		document.location.href = "cart.jsp";
	//	}
	//}
	
	//setInterval(go,1000);
</script>









