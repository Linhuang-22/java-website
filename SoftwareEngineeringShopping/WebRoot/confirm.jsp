<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.software.shopping.cart.*,com.software.shopping.product.*,com.software.shopping.user1.*,java.sql.*" %>

<% 
User u = (User) session.getAttribute("user");
if(u == null){
	out.println("�����ڻ�û�е�¼�������ȷ�ϼ������򣬰��г��ۣ�<a href=loginOrReg.jsp>ע��</a> ����ѵ�");
	//out.println("<a href=confirmusenormal.jsp>����</a><br>");
	out.println("<a href=loginOrReg.jsp>��¼</a>");
	//response.sendRedirect("userLogin.jsp");
}
%>
<jsp:useBean id = "cart" class = "com.software.shopping.cart.Cart" scope = "session"></jsp:useBean>
<table border = 1 align="center">
  <tr>
      <td>��ƷID</td>
      <td>��Ʒ����</td>
      <td>��Ʒ�۸�</td>
      <td>��������</td>
      
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
                           ��ӭ��<%=u.getUsername() %>��ȷ�������ͻ���Ϣ<br>
        <%
        } 
        %>
        
        <form action = "order.jsp?" method  = "post">
                                             �ͻ���Ϣ:<br>
             <textarea name = "addr"> <%=(u==null)?"":u.getAddr() %></textarea>
             <input type = "submit" value = "�µ�">                            
        </form>
        
</center>





