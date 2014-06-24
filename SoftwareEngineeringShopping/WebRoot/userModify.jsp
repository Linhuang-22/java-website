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
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	u.setPhone(phone);
	u.setAddr(addr);
	u.update();
	out.println("修改成功!");
	response.sendRedirect("userModify.jsp");
	return;
	
}
%>

<!doctype html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>联想网上商城</title>
	<link href="css/style.css" rel="stylesheet" />
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
			<jsp:include page="welcome.jsp"></jsp:include>
			<div class="clear"></div>
		</div>
		<nav role="navigation">
			<div class="container">
				<ul class="first">
					<li><a href="#">商城首页</a></li>
					<li>
						<a href="#">所有产品</a>
						<ul class="second">
							<li>
								<a href="#">分类一</a>
							</li>
							<li>
								<a href="#">分类二</a>
							</li>
							<li>
								<a href="#">分类二</a>
							</li>
						</ul>
					</li>
					<li><a href="#">售后服务</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="container">
		<article class="main" role="main">
			<section class="detail">
				<h1>个人信息</h1>
				
				
				
			<form method="post" name="form" action="userModify.jsp" onSubmit="return checkdata()">
			<input type="hidden" name="action" value="modify"/>
				
				<div class="info">
					<span>电话号码：</span>
					<input type="text" value=<%=u.getPhone() %> name="phone" disabled="disabled" />
					<a class="change-info" href="javascript:;">修改</a>
				</div>
				<div class="info">
					<span>送货地址：</span>
					<textarea name="addr" disabled="disabled"><%=u.getAddr() %></textarea>
					<a class="change-info" href="javascript:;">修改</a>
				</div>
				<input type="submit" class="submit" value="确认修改" style="display:none" />
				
			</form>	
				
				
				
				
			</section>
			<section class="detail">
				<h1>修改密码</h1>
				<form>
					<div class="input">
						<span>请输入原密码</span>
						<input type="password" />
					</div>
					<div class="input">
						<span>请输入新密码</span>
						<input type="password" />
					</div>
					<div class="input">
						<span>请再次输入新密码</span>
						<input type="password" />
					</div>
					<input type="submit" class="submit" value="确认修改" />
				</form>
			</section>
		</article>
		<aside>
			<section id="hotsale">
				<h1>我的商城</h1>
				<ul>
					<li><a href="#">个人信息</a></li>
					<li><a href="#">我的订单</a></li>
				</ul>
			</section>
		</aside>
		<div class="clear"></div>
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
	$.changeInfo(".change-info");
</script>
</body>
</html>