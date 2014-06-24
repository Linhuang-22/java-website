<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.text.SimpleDateFormat,java.util.*,com.software.shopping.user1.*" %>

<%
//处理登陆
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action != null && action.equals("login")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User u = null;
	
	try{
		u = User.validate(username, password);
	}catch (UserNotFoundException e){
		out.println("User not found!");
		return;
	}catch (PasswordNotCorrectException e){
		out.println("password not correct");
		return;
	}
	
	session.setAttribute("user", u);
	response.sendRedirect("index.jsp");
}
%>

<%
//处理注册
request.setCharacterEncoding("GB18030");
action  = request.getParameter("action");
if (action != null && action.equals("register")){
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	System.out.println(addr);
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

<!doctype html>
<html lang="zh-cn">
<head>
	<meta charset="GB18030">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>联想网上商城</title>
	<link href="css/style.css" rel="stylesheet" />
	<script language=JavaScript src="script/regcheckdata.js"></script>
    <!-- enable HTML5 elements in IE -->
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="css/ie.css" />
    <script type="text/javascript" src="script/html5.js"></script>
    <![endif]-->
</head>

<body>
	<header>
		<div class="container">
			<div class="logo">
				<a href="#"><img src="images/logo.jpg" alt="联想网上商城" title="联想网上商城" /></a>
			</div>
			<div class="welcome">
				
			</div>
			<div class="clear"></div>
		</div>
	</header>
	<div class="reg">
		<nav>
			<ul>
				<li><a class="active" href="#">登录</a></li>
				<li><a href="#">注册</a></li>
			</ul>
		</nav>
		<div class="reg-con" style="display: block;">
			<form action="loginOrReg.jsp" method="post">
			<input type="hidden" name="action" value="login"/>
				<div class="input">
					<span>请输入用户名</span>
					<input type="text"  name="username" />
				</div>
				<div class="input">
					<span>请输入密码</span>
					<input type="password"  name="password"/>
				</div>
				<input type="submit" class="submit" value="登录" />
			</form>
		</div>
		<div class="reg-con">
			<form method="post" name="form" action="loginOrReg.jsp" onSubmit="return checkdata()">
			<input type="hidden" name="action" value="register"/>
				<div class="input">
					<span>请输入用户名</span>
					<input type="text"  name="username"/>
				</div>
				<div class="input">
					<span>请输入密码</span>
					<input type="password" name="password"/>
				</div>
				<div class="input">
					<span>请再次输入密码</span>
					<input type="password" name="password2"/>
				</div>
				<div class="input">
					<span>请输入电话号码</span>
					<input type="text" name="phone" />
				</div>
				<div class="input address">
					<span>请输入送货地址</span>
					<textarea rows="3" name="addr"></textarea>
				</div>
				<input type="submit" class="submit" value="注册" />
			</form>
		</div>
	</div>
	<footer>
		<div class="container">
			<img src="images/footer.png" />
		</div>
		<p>版权所有：1998－2014 联想官网商城 │ 京ICP备11035381</p>
	</footer>
<script type="text/javascript" src="script/jquery-1.11.1.min.js" ></script>
<script type="text/javascript" src="script/script.js"></script>
<script type="text/javascript">
	$.regInput(".input");
	
</script>
</body>
</html>