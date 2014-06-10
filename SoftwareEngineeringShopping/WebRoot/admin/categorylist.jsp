<%@ page language="java" import="java.util.*,java.sql.*,com.software.shopping.category.*" pageEncoding="GB18030"%>
<%@ include file="_sessioncheck.jsp" %>

<%
//获取所有用户的信息
List<Category> categories = Category.getCategories();
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
	    <td> ID </td>
	    <td> name </td>
	    <td> pid </td>
	    <td> grade </td>
	    <td></td>
	    </tr>
	    <%
	    for (Iterator<Category> it = categories.iterator(); it.hasNext(); ){
	    	Category c=it.next();
	    	String preStr = "";
	    	for(int i=1; i<c.getGrade(); i++){
	    		preStr += "----";
	    	}
	     %>
	    <tr>
		    <td><%=c.getId() %></td>
		    <td><%=preStr + c.getName() %></td>  
		    <td><%=c.getPid() %></td>
		    <td><%=c.getGrade() %></td>
		    <td>
		    <a href="categoryAdd.jsp?pid=<%=c.getId() %>">添加子类别</a>
		    &nbsp;
		    <a href="categorydelete.jsp?id=<%=c.getId() %>" target="detail">删除</a>
		    &nbsp;
		    <a href="categoryModify.jsp?id=<%=c.getId() %>">修改</a>
		    &nbsp;
		    <% if (c.isLeaf() ) {%>
		    	<a href="productAdd.jsp?categoryId=<%=c.getId() %>">在该类别下添加商品</a>
		    <% } %>
		    </td>
	    </tr>
	    <%
	    }
	     %>
	</table>
  </body>
</html>
