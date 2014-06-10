<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.sql.*,java.util.*,com.software.shopping.category.*,com.software.shopping.product.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
List<Category> categories = Category.getCategories();

request.setCharacterEncoding("GB18030");
String action  = request.getParameter("action");
if (action != null && action.equals("complexSearch")){
	%>
	<jsp:forward page="complexSearchResult.jsp"></jsp:forward>
	<%
}

if (action != null && action.equals("simpleSearch2")) {
	%>
	<jsp:forward page="simpleSearch2Result.jsp"></jsp:forward>
	<%
}
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>产品搜索</title>
<script type="text/javascript">
<!--
	function checkdata(){
		with(document.forms("complex")){
			if (lownormalprice == null || lownormalprice.value == ""){
				lownormalprice.value = -1;
			}
			if (highnormalprice == null || highnormalprice.value == ""){
				highnormalprice.value = -1;
			}
			if (lowmemberprice == null || lowmemberprice.value == ""){
				lowmemberprice.value = -1;
			}
			if (highmemberprice == null || highmemberprice.value == ""){
				highmemberprice.value = -1;
			}
			
		}
	}
 -->
</script>
</head>
<body>
	<center>简单搜索</center><br>
	<form action="productSearch.jsp" method="post">
		<input type="hidden" name="action" value="simpleSearch">
		<center>
		类别： <select></select>
		关键字：<input type="text" name="keyword">
		<input type="submit" value="搜">
		</center>
	</form>
	<br>
	
	<center>第二种搜索方法</center><br>
	<form action="productSearch.jsp" method="post">
		<input type="hidden" name="action" value="simpleSearch2">
		<center>
		类别： <br>
		<%
		for (Iterator<Category> it = categories.iterator(); it.hasNext(); ){
			Category c = it.next();
			if (c.isLeaf()) {
				String preStr = "";
				for (int i=1; i<c.getGrade(); i++) {
					preStr += "--";
				}
			%>
			<input type="checkbox" name="categoryid" value="<%=c.getId() %>"> <%=preStr+c.getName() %><br>
			<%
			}else{
			%>
				<%=c.getName() %><br>
				<%
			}
		}
	 	%>
		关键字：<input type="text" name="keyword">
		<input type="submit" value="搜">
		</center>
	</form>
	
	<br>
	<center>复杂搜索</center><br>
	<form action="productSearch.jsp" method="post" onsubmit="checkdata()" name="complex">
		<input type="hidden" name="action" value="complexSearch">
		<center>
		<table>
			<tr> 
				<td>类别：</td>
				<td>
					<select name="categoryid">
						<option value="0">所有类别</option>
						<%
						for (Iterator<Category> it = categories.iterator(); it.hasNext(); ){
							Category c = it.next();
							String preStr = "";
							for (int i=1; i<c.getGrade(); i++) {
								preStr += "--";
							}
							%>
							<option value="<%=c.getId() %>"><%=preStr + c.getName() %></option>
							<%
						}
					 	%>
					</select>
				</td>
			</tr>
			<tr>
				<td>关键字：</td>
				<td><input type="text" name="keyword"></td>
			</tr>
			<tr>
				<td>市场价：</td>
				<td>
					从：<input type="text" name="lownormalprice">
					到：<input type="text" name="highnormalprice">
				</td>
			</tr>
			<tr>
				<td>会员价：</td>
				<td>
					从：<input type="text" name="lowmemberprice">
					到：<input type="text" name="highmemberprice">
				</td>
			</tr>
			<tr>
				<td>上架日期：：</td>
				<td>
					从：<input type="text" name="startdate">
					到：<input type="text" name="enddate">
				</td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="搜"></td>
			</tr>
		</table>
		</center>
	</form>
</body>
</html>