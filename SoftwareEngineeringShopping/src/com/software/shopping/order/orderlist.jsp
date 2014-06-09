<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.bjsxt.shopping.*,java.sql.*"%>
<%@ include file="_sessioncheck.jsp"%>

<%!private static final int PAGE_SIZE = 3;%>

<%
	String strPageNo = request.getParameter("pageno");
	int pageNo = 1;
	if (strPageNo != null) {
		pageNo = Integer.parseInt(strPageNo);
	}
	if (pageNo < 1)
		pageNo = 1;
%>

<%
	List<SalesOrder> orders = new ArrayList<SalesOrder>();
	int pageCount = OrderMgr.getInstance().getOrders(orders, pageNo,
			PAGE_SIZE);

	if (pageNo > pageCount)
		pageNo = pageCount;
%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'orderlist.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<table border=1 align=center>
		<tr>
			<td>ID</td>
			<td>username</td>
			<td>addr</td>
			<td>odate</td>
			<td>status</td>
		</tr>
		<%
			for (Iterator<SalesOrder> it = orders.iterator(); it.hasNext();) {
				SalesOrder so = it.next();
		%>
		<tr>
			<td><%=so.getId()%></td>
			<td><%=so.getUser().getUsername()%></td>
			<td><%=so.getAddr()%></td>
			<td><%=so.getODate()%></td>
			<td><%=so.getStatus()%></td>
			<td><a href="orderdetailshow.jsp?id=<%=so.getId()%>" target="detail">订单明细</a>
			    &bsp;
			    <a href="ordermodify.jsp?id=<%=so.getId()%>" target="detail">订单修改</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<center>
		第<%=pageNo%>页 &bsp; 共<%=pageCount%>页 &bsp; <a
			href="productlist.jsp?pageno=<%=pageNo - 1%>">上一页</a> &bsp; <a
			href="productlist.jsp?pageno=<%=pageNo + 1%>">下一页</a> &bsp; <a
			href="productlist.jsp?pageno=<%=pageCount%>">最后一页</a>
	</center>
</body>
</html>

















