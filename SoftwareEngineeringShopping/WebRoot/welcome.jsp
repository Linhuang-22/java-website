<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "com.software.shopping.user1.*,java.sql.*" %>
<div class="welcome">
	<%
	User u = (User)session.getAttribute("user");
	boolean flag;
	if(u == null) {
		flag = true;
	}
	else
	{
	flag = false;
	}
	%>
  <%if(flag){ %>
	  <p>欢迎您来到联想网上商城！请 <a href="loginOrReg.jsp">[登录]</a> 或者 <a href="loginOrReg.jsp">[免费注册]</a></p>
  <%} else{%>
      <p><a href="userModify.jsp"><%=u.getUsername() %></a>，查看<a href="order.jsp">[我的订单]</a>，<a href="index.jsp">注销</a></p>
  <%} %>
</div>
