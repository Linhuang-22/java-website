<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.software.shopping.*,com.software.shopping.order.SalesOrder,com.software.shopping.order.OrderMgr,java.sql.*"%>
<%@ include file="_sessioncheck.jsp"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	SalesOrder so = OrderMgr.getInstance().loadById(id);
	
	String action = request.getParameter("action");
	if(action != null && action.equals("modify"))
	{
	   int status = Integer.parseInt(request.getParameter(status));
	   so.setStatus(status);
	   so.updateStatus();
	}
%>


<center>
	�µ���:<%=so.getUser().getUsername()%>
	<form name="form" action= "ordermodify.jsp" method = "post">
	      <input type="hidden" name ="action" vaule = "modify">
	      <input type="hidden" name = "id" vaule="<%=id %>">
	      <select name = "status">
	         <option vaule = "0">δ����</option>
	         <option vaule = "1">�Ѵ���</option>
	         <option vaule = "2">�ϵ�</option>
	      </select>
	      <br>
	      <input type="submit" value="�ύ" >
	</form>
</center>

<script type = "text/javascript">
    for(var option in document.forms("form").status.options)
    {
       if(option.vaule = <%=so.getStatus()%>)
       {
          document.forms("form").status.selectedIndex = option.index;
       }
    }
</script>