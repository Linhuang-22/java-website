<%@ page language="java" import="java.text.SimpleDateFormat,java.util.*,com.software.shopping.user1.*" pageEncoding="GB18030" %>

<%
User u = (User)session.getAttribute("user");
if(u == null) {
	out.println("You haven't logged in!");
	return;
}
 %>

<%
request.setCharacterEncoding("GB18030");
String action  = request.getParameter("action");
if (action != null && action.equals("modify")){
	String username = request.getParameter("username");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	u.setUsername(username);
	u.setPhone(phone);
	u.setAddr(addr);
	u.update();
	out.println("修改成功!");
	return;
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>用户信息修改</title>

</head>
  
  <body leftmargin="0" rightmargin="0" topmargin="0" onkeydown="if(event.keyCode==27) return false;">
  <div id="popLayer" style="position: absolute; z-index: 1000;" class="cPopText"></div>

<table id="table1" align="center" border="0" cellpadding="0" cellspacing="0" width="97%">
  <tbody>
  <tr valign="top">
    <td style="border-top: 0px none; border-right: 1px none; font-size: 9pt; font-family: Tahoma,Verdana; color: rgb(0, 0, 0);" width="100%"><table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tbody><tr>
        <td bgcolor="#4d76b3" height="20">&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#4e6793" height="2"></td>
      </tr>
      <tr>
        <td background="images/bitmap.gif" height="80" valign="middle"><table align="right" border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody><tr>
            <td valign="middle" width="5">&nbsp;</td>
            <td valign="middle" width="157"><div align="left"><a href="thinkshop.cn.htm" target="_blank"><br></a></div></td>
            <td valign="middle" width="812"><div align="right">
              <a style="left: 799px ! important; top: 61px ! important;" class="abp-objtab visible" href="http://www.allsmart.com/images/new1.swf"></a>                 

            </div></td>
            <td width="5">&nbsp;</td>
          </tr>
        </tbody></table></td>
      </tr>
      <tr>
        <td><table id="table3" bgcolor="#f3f6fa" cellpadding="3" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td style="border-top: 0px none; border-right: 1px none; font-size: 9pt; font-family: Tahoma,Verdana; color: rgb(0, 0, 0);" bgcolor="#f3f6fa" height="20"><font style="line-height: normal;" color="#000000"><a href="faq.php.htm"><br></a> </font></td>
              <td width="225"><table align="right" border="0" cellpadding="0" cellspacing="0" width="225">
                <tbody><tr>
                  <td width="75"><a href="index.php.htm"><br></a></td>
                  <td width="75"><a href="brandshop.php.htm" target="_blank"><br></a></td>
                  <td width="75"><a href="powered by Discuz!.htm" target="_blank"><br></a></td>
                  </tr>
              </tbody></table>
             </td>
              </tr>
            <tr bgcolor="#4d76b3">
              <td colspan="2" height="1"> </td>
            </tr>
            <tr bgcolor="#ffffff">
              <td colspan="2" height="5"></td>
            </tr>
          </tbody>
        </table></td>
      </tr>
    </tbody></table>
</td>
    </tr></tbody></table>
<table style="table-layout: fixed;" align="center" border="0" cellpadding="0" cellspacing="0" width="97%"> 
<tbody><tr><td class="nav" align="left" nowrap="nowrap" width="90%">&nbsp;联想笔记本销售网上商城>>修改信息</td>
<td align="right" width="10%">&nbsp;<a href="#bottom"><img src="images/arrow_dw.gif" align="absmiddle" border="0"></a></td>        
</tr></tbody></table><br>

<form method="post" name="form" action="userModify.jsp">
<input type="hidden" name="action" value="modify"/>

<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
<tbody><tr>
<td colspan="2" class="header">用户修改</td>
</tr>
<tr>
<td class="altbg1" width="21%">用户名:</td>
<td class="altbg2"><input id="userid" name="username" size="25" maxlength="25" type="text" value=<%=u.getUsername() %>> 
<span id="usermsg"></span>
</tr>

<!-- 
<tr>
<td class="altbg1">密码:</td>
<td class="altbg2"><input name="password" size="25" type="password"></td>
</tr>
 -->

<tr>
<td class="altbg1">电话:</td>
<td class="altbg2"><input name="phone" type="text" id="phone" size="25" value=<%=u.getPhone() %>></td>
</tr>

<tr>
<td class="altbg1" valign="top">送货地址:</td>
<td class="altbg2"><textarea name="addr" cols="60" rows="5" id="addr" ><%=u.getAddr() %></textarea></td>
</tr>
</tbody></table>
<br>
<center><input name="regsubmit" value="提 &nbsp; 交" type="submit"></center>
</form>

<script language="JavaScript">
document.register.username.focus();
</script>

<p align="center">　</p>
<table class="smalltxt" cellpadding="4" cellspacing="0" width="100%">
<tbody>
<tr class="altbg1">
<td align="right"><a href="http://bbs.allsmart.com/member.php?action=clearcookies" class="bold">清除 Cookies</a></td>
<td align="right" width="1">&nbsp;</td>
</tr>
<tr style="padding: 0px; font-size: 0px; line-height: 0px;" images="" green="" bg01.gif="" )=""><td colspan="3">　</td></tr>
</tbody>
</table>
<p align="center">
<br>
<a name="bottom"></a>
<a target="_blank" href="http://www.thinkpadclub.com.cn/"><u>商城主页</u></a>
<br>
服务热线:010-12345678
</p>
</body>
</html>
