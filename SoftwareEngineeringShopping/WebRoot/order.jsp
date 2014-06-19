<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.software.shopping.*,com.software.shopping.user1.*,com.software.shopping.order.SalesOrder,com.software.shopping.cart.Cart,java.sql.*"%>


<%
	User u = (User) session.getAttribute("user");
%>

<jsp:useBean id="cart" class="com.software.shopping.cart.Cart" scope="session"></jsp:useBean>
<%

if (cart == null)
{
    out.println("没有任何购物项");
    return;
}
%>


<%
	String addr = request.getParameter("addr");
	SalesOrder so = new SalesOrder();
	so.setCart(cart);
	so.setAddr(addr);
	so.setUser(u);
	so.setODate(new Timestamp(System.currentTimeMillis()));
	so.setStatus(0);
	so.save();
	session.removeAttribute("cart");
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
			<div class="welcome">
				<p><a href="userModify"><%=u.getUsername() %></a>，查看<a href="#">[我的订单]</a>，<a href="#">注销</a></p>
			</div>
			<div class="clear"></div>
		</div>
		<nav role="navigation">
			<div class="container">
				<ul class="first">
					<li><a href="index.jsp">商城首页</a></li>
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
				<h1>我的订单</h1>
				<ul class="order-list">
					<li>
						<div class="order-name"><span>商品名称</span></div>
						<div class="order-price"><span>订单价格</span></div>
						<div class="order-status"><span>订单状态</span></div>
					</li>
					<li>
						<div class="order-name"><span>我是商品名称</span><span>我是第二个商品名称</span></div>
						<div class="order-price"><span>￥1000.00</span></div>
						<div class="order-status"><span>已发货</span></div>
					</li>
				</ul>
			</section>
		</article>
		<aside>
			<section id="hotsale">
				<h1>我的商城</h1>
				<ul>
					<li><a href="userModify.jsp">个人信息</a></li>
					<li><a href="order.jsp">我的订单</a></li>
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
</script>
</body>
</html>