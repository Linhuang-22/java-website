<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.software.shopping.product.*,com.software.shopping.user1.*,java.sql.*" %>

<%
request.setCharacterEncoding("gb2312");
int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductManager.getInstance().loadById(id); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	
  </head>
  
  <body>
	<center>产品展示</center>
	<img height=90 alt=<%=p.getName() %> src="images/product/11.jpg" width=90 border=0>
	<br>
	<%=p.getName() %><br><br>
	<%=p.getDescr() %><br><br>
	<%=p.getNormalPrice() %><br><br>
	<%=p.getMemberPrice() %><br><br>
	<a href="buy.jsp?id=<%=id%>">我买了</a>
  </body>
</html>
