<%@ page language="java" import="java.util.*,java.sql.*,com.software.shopping.category.*" pageEncoding="GB18030"%>
<%@ include file="_sessioncheck.jsp" %>

<%
//��ȡ�����û�����Ϣ
List<Category> categories = Category.getCategories();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>�û��б�</title>
	<script language="javascript" src="script/TV20.js"></script>
	<script type="text/javascript">
	function t(key,parentkey) {
		document.forms["form"].pid.value = key;
	}
	
	function modify(key,parentkey){
		window.parent.frames["detail"].location.href="categoryModify.jsp?id=" + key;
	}
	</script>

  </head>
  
  <body>

  <table align="center" border="1">
  <tr><td id="show"> </td></tr>
  <tr><td>
	<form name="form" action="categoryAdd.jsp" method="post">
		<input type="hidden" name="action" value="add">
		<br>�ڴ˷���������ӷ���<br>
		<input type="text" name="pid" vale="" readonly>
		<br>
		<input type="text" name="name">
		<br>
		<textarea name="descr" rows="8" cols="40"></textarea>
		<input type="submit" value="�ύ" >
	</form>
	</td></tr>
  </table>
  
      <script language="javascript">
	<!--
	addNode(-1,0,"�������","images/top.gif");
	<%
		for (Iterator<Category> it = categories.iterator(); it.hasNext(); ){
			Category c = it.next();
			%>
			addNode(<%=c.getPid() %>,<%=c.getId() %>,"<%=c.getName() %>","images/top.gif");
			<%
			}
	%>
	
	showTV();
	addListener("click","t");
	addListener("dblclick","modify");
	-->
	</script>

  </body>
</html>
