<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.software.shopping.*,com.software.shopping.user1.*,com.software.shopping.order.SalesOrder,com.software.shopping.cart.Cart,com.software.shopping.cart.CartItem,java.sql.*"%>
<%@ page import="java.sql.Date" %>



<% 
User u = (User) session.getAttribute("user");
if(u == null){
	out.println("�����ڻ�û�е�¼�������ȷ�ϼ������򣬰��г��ۣ�<a href=loginOrReg.jsp>ע��</a> ����ѵ�");
	//out.println("<a href=confirmusenormal.jsp>����</a><br>");
	out.println("<a href=loginOrReg.jsp>��¼</a>");
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

    alert("лл���ڱ�վ����");
    window.location.href = "index.jsp";  
</script>