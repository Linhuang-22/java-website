<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date,java.util.*,com.software.shopping.product.*,com.software.shopping.category.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("GB18030");
String action  = request.getParameter("action");
String strCategoryId = request.getParameter("categoryId");
System.out.println(strCategoryId);
int categoryId = 0;
if (strCategoryId != null && !strCategoryId.trim().equals("")) {
	categoryId = Integer.parseInt(strCategoryId);
}

if (action != null && action.trim().equals("add")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	double normalPrice = Double.parseDouble(request.getParameter("normalPrice"));
	double memberPrice = Double.parseDouble(request.getParameter("memberPrice"));
//	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	
	Category c= Category.loadById(categoryId);
	if (!c.isLeaf()) {
		out.println("非叶子节点下不能添加商品");
		return;
	}
	
	Product p = new Product();
	p.setId(-1);
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	SimpleDateFormat sdf = new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
	String dd=sdf.format(new Date());
	p.setPdate(dd);
	p.setCategoryId(categoryId);
	
	ProductManager.getInstance().addProduct(p);
	out.println("添加成功!");
	return;
}
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<script type="text/javascript">
	
	<!--
	var arrLeaf = new Array();
	function checkdata() {
		if (arrLeaf[document.form.categoryId.selectedIndex] == "noleaf") {
			alert("不能选择非叶子节点");
			document.form.categoryId.focus();
			return false;
		}
		return true;
	}
	-->
</script>
</head>
<body>
	<center>添加产品</center>
	<form action="productAdd.jsp" method="post" onsubmit="return checkdata()" name="form">
	<input type="hidden" name="action" value="add">
	
		<table>
			<tr>
				<td>产品名称</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>产品描述</td>
				<td><textarea name="descr" rows="8" cols="40"></textarea></td>
			</tr>
			<tr>
				<td>市场价</td>
				<td><input type="text" name="normalPrice"></td>
			</tr>
			<tr>
				<td>会员价</td>
				<td><input type="text" name="memberPrice"></td>
			</tr>
			<tr>
				<td>类别ID</td>
				<td>
					<select name="categoryId">
						<option value="0">所有类别</option>
						<script type="text/javascript">
							arrLeaf[0] = "noleaf";
						</script>
						<%
						List<Category> categories = Category.getCategories();
						int index = 1;
						for (Iterator<Category> it = categories.iterator(); it.hasNext(); ){
							Category c = it.next();
							String preStr = "";
							for (int i=1; i<c.getGrade(); i++) {
								preStr += "--";
							}
							%>
							<script type="text/javascript">
								arrLeaf[<%=index%>] = '<%=c.isLeaf() ? "leaf" : "noleaf" %>';
							</script>
							<option value="<%=c.getId() %>"<%=c.getId() == categoryId ? "selected" : ""%>><%=preStr + c.getName() %></option>
							<%
							index ++;
						}
					 	%>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan=2><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>
</body>
</html>