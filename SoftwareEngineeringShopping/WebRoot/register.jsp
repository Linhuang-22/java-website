<%@ page language="java" import="java.text.SimpleDateFormat,java.util.*,com.software.shopping.user1.*" pageEncoding="GB18030" %>

<%
request.setCharacterEncoding("GB18030");
String action  = request.getParameter("action");
if (action != null && action.equals("register")){
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	User u = new User();
	u.setUsername(username);
	u.setPassword(password);
	u.setPhone(phone);
	u.setAddr(addr);
	SimpleDateFormat sdf = new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
	String dd=sdf.format(new Date());
	u.setRdate(dd);
	u.save();
	out.println("注册成功!恭喜!");
	return;
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户注册</title>
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script language=JavaScript src="script/regcheckdata.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
<tbody><tr><td class="nav" align="left" nowrap="nowrap" width="90%">&nbsp;&#37329;&#23578;&#21830;&#22478; &#187; 注册</td>
<td align="right" width="10%">&nbsp;<a href="#bottom"><img src="images/arrow_dw.gif" align="absmiddle" border="0"></a></td>        
</tr></tbody></table><br>

<form method="post" name="form" action="register.jsp" onSubmit="return checkdata()">
<input type="hidden" name="action" value="register"/>

<table class="tableborder" align="center" cellpadding="4" cellspacing="1" width="97%">
<tbody><tr>
<td colspan="2" class="header">注册 - 必填内容</td>
</tr>
<tr>
<td class="altbg1" width="21%">用户名:</td>
<td class="altbg2"><input id="userid" name="username" size="25" maxlength="25" type="text" onblur="validate()"> 
<span id="usermsg"></span>
</tr>

<tr>
<td class="altbg1">密码:</td>
<td class="altbg2"><input name="password" size="25" type="password"></td>
</tr><tr>
<td class="altbg1">确认密码:</td>
<td class="altbg2"><input name="password2" size="25" type="password"></td>
</tr>

<tr>
<td class="altbg1">电话:</td>
<td class="altbg2"><input name="phone" type="text" id="phone" size="25"></td>
</tr>

<tr>
<td class="altbg1" valign="top">送货地址:</td>
<td class="altbg2"><textarea name="addr" cols="60" rows="5" id="addr"></textarea></td>
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
<tbody><tr class="altbg1"><td>所有时间为 GMT+8, 现在时间是 2007-4-20 11:17</td>
<td align="right"><a href="http://bbs.allsmart.com/member.php?action=clearcookies" class="bold">清除 Cookies</a></td>
<td align="right" width="1">&nbsp;</td>
</tr>
<tr style="padding: 0px; font-size: 0px; line-height: 0px;" images="" green="" bg01.gif="" )=""><td colspan="3">　</td></tr>
</tbody></table>
<p align="center">

<br>
<a name="bottom"></a>

<a target="_blank" href="http://www.thinkpadclub.com.cn/"><u>金尚商城</u></a><br>
服务热线:010-58052712
<!--<br><font color=#ebebeb>
Powered by <a href="http://www.discuz.net" target="_blank"><font color=#ebebeb>Discuz!</font></a> 
<a href="misc.php?action=viewlicense"><b style="color:#ebebeb">4.0.0RC4</b></a>&nbsp;
&copy; 2001-2005 <a href="http://www.comsenz.com" target="_blank"><font color=#ebebeb>Comsenz Technology Ltd</font></a>
<br>Processed in 0.011754 second(s), 5 queries
-->
</p>
</body>
</html>
