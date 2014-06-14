<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.sql.*,java.util.*,com.software.shopping.category.*,com.software.shopping.product.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");

//List<Category> categories = Category.getCategories();
List<Product> products = new ArrayList<Product>();
int pageCount = 0;
String keyword = null;

String StrCategoryIdQuery = "";

int pageNo = 1;
String strPageNo = request.getParameter("pageno");
if (strPageNo != null && !strPageNo.trim().equals("")) {
	pageNo = Integer.parseInt(strPageNo);
}


//处理简单搜索2
	
	keyword = request.getParameter("keyword");
	
	String[] strCategories = request.getParameterValues("categoryid");
	int[] idArray;
	
	if (strCategories == null || strCategories.length == 0) {
		idArray = null;
	} else {
		for (int i=0; i<strCategories.length; i++){
			StrCategoryIdQuery += "&categoryid=" + strCategories[i];
		}
		
		idArray = new int[strCategories.length];
		for (int i=0; i<strCategories.length; i++){
			idArray[i] = Integer.parseInt(strCategories[i]);
		}
		
		products = new ArrayList<Product>();
		pageCount = ProductManager.getInstance().findProducts(products, idArray, keyword, -1, -1,
	                                          					-1, -1, null, null, pageNo, 3);
	}

%>


<!-- 显示处理的结果 -->
 <center>搜索结果</center>
	<table border="1" align="center">
	    <tr>
	    <td> 产品ID </td>
	    <td> 产品名 </td>
	    <td> 产品描述</td>
	    <td> 市场价 </td>
	    <td> 会员价 </td>
	    <td> 上市时间 </td>
	    <td> 类别Id</td>
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
		    <td><%=p.getCategoryId() %></td>
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
		共<%=pageCount %>页
		&nbsp;
		<a href="productSearch.jsp?action=<%=action%>&keyword=<%=keyword%>&pageno=<%=pageNo+1%><%=StrCategoryIdQuery%>">下一页</a>  
	</center>
 <!-- 显示处理的结果结束-->	
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>

</body>
</html>