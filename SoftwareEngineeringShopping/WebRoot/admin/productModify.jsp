<%@ page language="java" import="java.util.*,java.sql.*,com.software.shopping.product.*,com.software.shopping.category.*" pageEncoding="GB18030"%>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("GB18030");
int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductManager.getInstance().loadById(id);
String action  = request.getParameter("action");

if (action != null && action.trim().equals("modify")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	double normalPrice = Double.parseDouble(request.getParameter("normalPrice"));
	double memberPrice = Double.parseDouble(request.getParameter("memberPrice"));
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	
	Category c= Category.loadById(categoryId);
	if (!c.isLeaf()) {
		out.println("��Ҷ�ӽڵ��²��������Ʒ");
		return;
	}
	
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setCategoryId(categoryId);
	
	ProductManager.getInstance().updateProduct(p);
	%>
	<script type="text/javascript">
		window.parent.main.location.reload();
	</script>
	<%
	out.println("�޸ĳɹ�!");
}

 %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>��Ʒ�б�</title>
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
  
    <center>�޸Ĳ�Ʒ</center>
	<form action="productModify.jsp" method="post" onsubmit="return checkdata()" name="form">
	<input type="hidden" name="action" value="modify">
	<input type="hidden" name="id" value="<%=p.getId() %>">
		<table>
			<tr>
				<td>��Ʒ����</td>
				<td><input type="text" name="name" value="<%=p.getName() %>"></td>
			</tr>
			<tr>
				<td>��Ʒ����</td>
				<td><textarea name="descr" rows="8" cols="40"><%=p.getDescr() %></textarea></td>
			</tr>
			<tr>
				<td>�г���</td>
				<td><input type="text" name="normalPrice" value="<%=p.getNormalPrice() %>"></td>
			</tr>
			<tr>
				<td>��Ա��</td>
				<td><input type="text" name="memberPrice" value="<%=p.getMemberPrice() %>"></td>
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
							<option value="<%=c.getId() %>"<%=c.getId() == p.getCategoryId() ? "selected" : ""%>><%=preStr + c.getName() %></option>
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
