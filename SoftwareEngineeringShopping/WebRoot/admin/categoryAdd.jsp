<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.sql.*,com.software.shopping.category.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("GB18030");
String action  = request.getParameter("action");
String strPid = request.getParameter("pid");
int pid = 0;

if (strPid != null){
	pid = Integer.parseInt(strPid);
}

System.out.println("pid="+pid);

if (action != null && action.trim().equals("add")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	
	if (pid == 0){
		Category.addTopCategory(name, descr);
	}else{
		//Category.addChildCategory(pid, name, descr);
		Category parent =Category.loadById(pid);
		parent.setId(pid);
		Category child = new Category();
		child.setId(-1);
		child.setName(name);
		child.setDescr(descr);
		parent.addChild(child);
	}

	out.println("添加成功!");
	return;
}
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<center>添加根类别</center>
	<form action="categoryAdd.jsp" method="post">
	<input type="hidden" name="action" value="add">
	<input type="hidden" name="pid" value="<%=pid %>">
		<table>
			<tr>
				<td>类别名称</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>类别描述</td>
				<td><textarea name="descr" rows="8" cols="40"></textarea></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>
</body>
</html>