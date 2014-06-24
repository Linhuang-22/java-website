<%@ page language="java" import="java.util.*,java.sql.*,com.software.shopping.product.*,com.software.shopping.category.*" pageEncoding="GB18030"%>

<%
final int PAGE_SIZE = 3;  //每页显示3条
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
//获取所有产品
List<Product> products = new ArrayList<Product>();
int pageCount = ProductManager.getInstance().getProducts(products, pageNo, PAGE_SIZE);
 
if (pageNo > pageCount) pageNo = pageCount;
 %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>产品列表</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table border="1" align="center">
	    <tr>
	    <td> 产品ID </td>
	    <td> 产品名 </td>
	    <td> 产品描述</td>
	    <td> 市场价 </td>
	    <td> 会员价 </td>
	    <td> 上市时间 </td>
	    <td> 所属类别</td>
	    <td> 处理 </td>
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
		    <a href="productDelete.jsp?id=<%=p.getId() %>" target="detail">删除</a>
		    <a href="productModify.jsp?id=<%=p.getId() %>" target="detail">修改</a>
		    </td>
	    </tr>
	    <%
	    }
	     %>
	</table>
	<center>
	第 <%=pageNo %>页
	 &nbsp;
	 共 <%=pageCount %>页
	 &nbsp;
	 <a href="productList.jsp?pageno=<%=pageNo-1 %>">上一页</a>
	 &nbsp;
	 <a href="productList.jsp?pageno=<%=pageNo+1 %>">下一页</a>
	 &nbsp;
	 <a href="productList.jsp?pageno=<%=pageCount %>">最后一页</a>
	</center>
  </body>
</html>
