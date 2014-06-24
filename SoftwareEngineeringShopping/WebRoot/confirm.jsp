<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.software.shopping.cart.*,com.software.shopping.product.*,com.software.shopping.user1.*,java.sql.*" %>

<% 
User u = (User) session.getAttribute("user");
if(u == null){
	out.println("您现在还没有登录，如果您确认继续购买，按市场价，<a href=loginOrReg.jsp>注册</a> 是免费的");
	//out.println("<a href=confirmusenormal.jsp>继续</a><br>");
	out.println("<a href=loginOrReg.jsp>登录</a>");
	//response.sendRedirect("userLogin.jsp");
}
%>
<jsp:useBean id = "cart" class = "com.software.shopping.cart.Cart" scope = "session"></jsp:useBean>
<table border = 1 align="center">
  <tr>
      <td>商品ID</td>
      <td>商品名称</td>
      <td>商品价格</td>
      <td>购买数量</td>
      
  </tr>
  <%
  List<CartItem> items = cart.getItems();
  for(int i=0; i < items.size(); i++)
  {
  CartItem ci = items.get(i);
  Product p = ProductManager.getInstance().loadById(ci.getProductId());
  %>
  <tr>
       <td><%=ci.getProductId() %></td>
       <td><%=p.getName() %></td>
       <td><%=p.getNormalPrice() %></td>
       <td><%=ci.getCount() %></td>
  <tr>
  <%
  }
   %>
  
   
  
</table>  


<center>
       <%
       if(u != null)
       {
        %>
                           欢迎您<%=u.getUsername() %>请确认您的送货信息<br>
        <%
        } 
        %>
        
        <form action = "order.jsp?" method  = "post">
                                             送货信息:<br>
             <textarea name = "addr"> <%=(u==null)?"":u.getAddr() %></textarea>
             <input type = "submit" value = "下单">                            
        </form>
        
</center>





