<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="com.software.shopping.category.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("GB18030");
String action  = request.getParameter("action");
String strId = request.getParameter("id");
int id=0;
if (strId != null){
	id = Integer.parseInt(strId);
}
Category c = Category.loadById(id);

if (action != null && action.trim().equals("modify")){

	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	c.setName(name);
	c.setDescr(descr);

	c.update();
	out.println("修改成功!");
	return;
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>、
	<center>添加根类别</center>
	<form action="categoryModify.jsp" method="post">
	<input type="hidden" name="action" value="modify">
	<input type="hidden" name="id" value="<%=id %>">
		<table>
			<tr>
				<td>类别名称</td>
				<td><input type="text" name="name" value=<%=c.getName() %>></td>
			</tr>
			<tr>
				<td>类别描述</td>
				<td><textarea name="descr" rows="8" cols="40"><%=c.getDescr() %></textarea></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="提交"></td>
			</tr>
		</table>
</body>
</html>