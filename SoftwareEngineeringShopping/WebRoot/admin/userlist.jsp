<%@ page language="java" import="java.util.*,java.sql.*,com.software.shopping.user1.*" pageEncoding="GB18030"%>
<%@ include file="_sessioncheck.jsp" %>

<%
//获取所有用户的信息
List<User> us = User.getUsers();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户列表</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table border="1" align="center">
	    <tr>
	    <td> 用户ID </td>
	    <td> 用户名 </td>
	    <td> 电话 </td>
	    <td> 收货地址 </td>
	    <td> 注册日期 </td>
	    <td> 处理</td>
	    </tr>
	    <%
	    for (Iterator<User> it = us.iterator(); it.hasNext(); ){
	    User u=it.next();
	     %>
	    <tr>
		    <td><%=u.getId() %></td>
		    <td><%=u.getUsername() %></td>
		    <td><%=u.getPhone() %></td>
		    <td><%=u.getAddr() %></td>
		    <td><%=u.getRdate() %></td>
		    <td>
		    <a href="userdelete.jsp?id=<%=u.getId() %>" target="detail">删</a>
		    </td>
	    </tr>
	    <%
	    }
	     %>
	</table>
  </body>
</html>
