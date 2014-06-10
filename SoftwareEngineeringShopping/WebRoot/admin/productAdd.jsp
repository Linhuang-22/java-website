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
		out.println("��Ҷ�ӽڵ��²��������Ʒ");
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
	out.println("��ӳɹ�!");
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
			alert("����ѡ���Ҷ�ӽڵ�");
			document.form.categoryId.focus();
			return false;
		}
		return true;
	}
	-->
</script>
</head>
<body>
	<center>��Ӳ�Ʒ</center>
	<form action="productAdd.jsp" method="post" onsubmit="return checkdata()" name="form">
	<input type="hidden" name="action" value="add">
	
		<table>
			<tr>
				<td>��Ʒ����</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>��Ʒ����</td>
				<td><textarea name="descr" rows="8" cols="40"></textarea></td>
			</tr>
			<tr>
				<td>�г���</td>
				<td><input type="text" name="normalPrice"></td>
			</tr>
			<tr>
				<td>��Ա��</td>
				<td><input type="text" name="memberPrice"></td>
			</tr>
			<tr>
				<td>���ID</td>
				<td>
					<select name="categoryId">
						<option value="0">�������</option>
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
				<td colspan=2><input type="submit" value="�ύ"></td>
			</tr>
		</table>
	</form>
</body>
</html>