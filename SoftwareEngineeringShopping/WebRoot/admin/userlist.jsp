<%@ page language="java" import="java.util.*,java.sql.*,com.software.shopping.user1.*" pageEncoding="GB18030"%>
<%@ include file="_sessioncheck.jsp" %>

<%
//��ȡ�����û�����Ϣ
List<User> us = User.getUsers();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>�û��б�</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table border="1" align="center">
	    <tr>
	    <td> �û�ID </td>
	    <td> �û��� </td>
	    <td> �绰 </td>
	    <td> �ջ���ַ </td>
	    <td> ע������ </td>
	    <td> ����</td>
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
		    <a href="userdelete.jsp?id=<%=u.getId() %>" target="detail">ɾ</a>
		    </td>
	    </tr>
	    <%
	    }
	     %>
	</table>
  </body>
</html>
