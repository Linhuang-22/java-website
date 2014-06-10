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
double lowNormalPrice = -1;
double highNormalPrice = -1;
double lowMemberPrice = -1;
double highMemberPrice = -1;
Timestamp startDate = null;
Timestamp endDate = null;
String strStartDate = null;
String strEndDate=null;

int categoryId = 0;

String StrCategoryIdQuery = "";

int pageNo = 1;
String strPageNo = request.getParameter("pageno");
if (strPageNo != null && !strPageNo.trim().equals("")) {
	pageNo = Integer.parseInt(strPageNo);
}

keyword = request.getParameter("keyword");
lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice"));
highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice"));
lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice"));
highMemberPrice = Double.parseDouble(request.getParameter("highmemberprice"));
categoryId = Integer.parseInt(request.getParameter("categoryid"));
int[] idArray = new int[1];
if (categoryId == 0) {
	idArray = null;
}else {
	idArray = new int[1];
	idArray[0] = categoryId;
}


strStartDate = request.getParameter("startdate");
if (strStartDate == null || strStartDate.trim().equals("")) {
	startDate = null; 
} else {
	startDate = Timestamp.valueOf(request.getParameter("startdate"));
}

strEndDate = request.getParameter("enddate");
if (strEndDate == null || strEndDate.trim().equals("")) {
	endDate = null; 
} else {
	endDate = Timestamp.valueOf(request.getParameter("enddate"));
}

//String startDate = request.getParameter("startdate");
//String endDate = request.getParameter("enddate");

products = new ArrayList<Product>();
pageCount = ProductManager.getInstance().findProducts(products, idArray, keyword, lowNormalPrice, highNormalPrice,
                                          lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, 3);
	
%>


<!-- ��ʾ����Ľ�� -->
 <center>�������</center>
	<table border="1" align="center">
	    <tr>
	    <td> ��ƷID </td>
	    <td> ��Ʒ�� </td>
	    <td> ��Ʒ����</td>
	    <td> �г��� </td>
	    <td> ��Ա�� </td>
	    <td> ����ʱ�� </td>
	    <td> ���Id</td>
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
		    <td><%=p.getCategoryId() %></td>
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
		��<%=pageCount %>ҳ
		&nbsp;
		
		<a href="productSearch.jsp?action=<%=action%>&keyword=<%=keyword%>&lownormalprice=<%=lowNormalPrice%>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice%>&highmemberprice=<%=highMemberPrice%>&startdate=<%=strStartDate%>&enddate=<%=strEndDate%>&pageno=<%=pageNo+1%>&categoryid=<%=categoryId%>">��һҳ</a>
		  
	</center>
 <!-- ��ʾ����Ľ������-->	
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>

</body>
</html>