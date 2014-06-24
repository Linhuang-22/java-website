<%@ page language="java" import="java.util.*,java.sql.*,com.software.shopping.product.*,com.software.shopping.category.*" pageEncoding="GB18030"%>

<%
final int PAGE_SIZE = 3;  //ÿҳ��ʾ3��
 %>
 
<%
String strPageNo = request.getParameter("pageno");
int pageNo = 1;
if (strPageNo != null){
	pageNo = Integer.parseInt(strPageNo);
}
if (pageNo <= 0)  pageNo = 1;
 %>
<%
//��ȡ���в�Ʒ
List<Product> products = new ArrayList<Product>();
int pageCount = ProductManager.getInstance().getProducts(products, pageNo, PAGE_SIZE);
 
if (pageNo > pageCount) pageNo = pageCount;
 %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>��Ʒ�б�</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table border="1" align="center">
	    <tr>
	    <td> ��ƷID </td>
	    <td> ��Ʒ�� </td>
	    <td> ��Ʒ����</td>
	    <td> �г��� </td>
	    <td> ��Ա�� </td>
	    <td> ����ʱ�� </td>
	    <td> �������</td>
	    <td> ���� </td>
	    </tr>
	    <%
	    for (Iterator<Product> it = products.iterator(); it.hasNext(); ){
	    Product p=it.next();
	     %>
	    <tr>
		    <td><%=p.getId() %></td>
		    <td><%=p.getName() %></td>
		    <td><%=p.getDescr() %></td>
		    <td><%=p.getNormalPrice() %></td>
		    <td><%=p.getMemberPrice() %></td>
		    <td><%=p.getPdate() %></td>
		    <td><%=p.getCategory().getName() %></td>
		    <td>
		    <a href="productDelete.jsp?id=<%=p.getId() %>" target="detail">ɾ��</a>
		    <a href="productModify.jsp?id=<%=p.getId() %>" target="detail">�޸�</a>
		    </td>
	    </tr>
	    <%
	    }
	     %>
	</table>
	<center>
	�� <%=pageNo %>ҳ
	 &nbsp;
	 �� <%=pageCount %>ҳ
	 &nbsp;
	 <a href="productList.jsp?pageno=<%=pageNo-1 %>">��һҳ</a>
	 &nbsp;
	 <a href="productList.jsp?pageno=<%=pageNo+1 %>">��һҳ</a>
	 &nbsp;
	 <a href="productList.jsp?pageno=<%=pageCount %>">���һҳ</a>
	</center>
  </body>
</html>
