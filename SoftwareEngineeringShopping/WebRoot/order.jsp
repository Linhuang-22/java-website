<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.software.shopping.*,com.software.shopping.user1.*,com.software.shopping.order.SalesOrder,com.software.shopping.cart.Cart,com.software.shopping.cart.CartItem,java.sql.*"%>
<%@ page import="java.sql.Date" %>



<% 
User u = (User) session.getAttribute("user");
if(u == null){
	out.println("您现在还没有登录，如果您确认继续购买，按市场价，<a href=loginOrReg.jsp>注册</a> 是免费的");
	//out.println("<a href=confirmusenormal.jsp>继续</a><br>");
	out.println("<a href=loginOrReg.jsp>登录</a>");
	//response.sendRedirect("userLogin.jsp");
}
%>




<%
	String addr = request.getParameter("addr");
	SalesOrder so = new SalesOrder();
	Cart cart=null;
	cart=(Cart)session.getAttribute("cart");

	so.setAddr(addr);
	so.setUser(u);
	so.setODate("1991");
	so.setStatus(0);
	so.setCart(cart);
	so.save();
	session.removeAttribute("cart");
%>

<script>

    alert("谢谢您在本站购物");
    window.location.href = "index.jsp";  
</script>