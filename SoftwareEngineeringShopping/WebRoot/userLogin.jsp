<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="com.software.shopping.user1.*" %>

<%
String action = request.getParameter("action");
if(action != null && action.equals("login")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User u = null;
	
	try{
		u = User.validate(username, password);
	}catch (UserNotFoundException e){
		out.println("User not found!");
		return;
	}catch (PasswordNotCorrectException e){
		out.println("password not correct");
		return;
	}
	
	session.setAttribute("user", u);
	response.sendRedirect("selfService.jsp");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>会员登陆</title>
</head>
<body>
<form action="userLogin.jsp" method="post">
	<input type="hidden" name="action" value="login"/>
<table border="1" align="center">
	<tr>
		<td>user name:</td>
		<td><input type="text" size="10" name="username"/></td>
	</tr>
	<tr>
		<td>user password:</td>
		<td><input type="password" size="10" name="password"/></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="login"/><input type="reset" value="reset"/></td>
	</tr>
</table>
</form>
</body>
</html>