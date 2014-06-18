<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "com.software.shopping.user1.*,java.sql.*" %>
    
<%
User u = (User)session.getAttribute("user");
boolean flag;
if(u == null) {
	flag = true;
}
else
flag = false;
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
			  <%if(flag){ %>
				  <p>欢迎您来到联想网上商城！请 <a href="loginOrReg.jsp">[登录]</a> 或者 <a href="loginOrReg.jsp">[免费注册]</a></p>
			  <%} else{%>
			      <p><a href="userModify.jsp">u.getUsername()</a>，查看<a href="order.jsp">[我的订单]</a>，<a href="#">注销</a></p>
			  <%} %>
			</div>
			<div class="clear"></div>
		</div>
		<nav role="navigation">
			<div class="container">
				<ul class="first">
					<li><a class="active" href="#">商城首页</a></li>
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
		<div id="focus" class="focus">
			<ul>
				<li><img src="images/banner1.jpg" alt="图片1" title="图片1" /></li>
				<li><img src="images/banner1.jpg" alt="图片1" title="图片1" /></li>
				<li><img src="images/banner1.jpg" alt="图片1" title="图片1" /></li>
			</ul>
		</div>
		<section id="notice" class="notice">
			<h1>最新公告：</h1>
			<ul>
				<li>6英寸炫酷大屏9mm纤薄机身A889新鲜上架！</li>
				<li>22222222222222222</li>
				<li>33333333333333333333</li>
			</ul>
		</section>
		<article class="main" role="main">
			<!-- 一个分类的产品在一个section内 -->
			<section class="detail">
				<h1>分类一</h1>
				<ul>
					<li>
						<a href="productdetailshow.jsp">
							<img src="images/laptop.jpg" alt="产品名称" title="产品名称" />
							<span class="price">￥5900</span>
							<span class="name">Yoga2 13-ITH (日光橙)</span>
							<span class="configuration">第四代智能英特尔® 酷睿 Haswell双核处理器</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/laptop.jpg" alt="产品名称" title="产品名称" />
							<span class="price">￥5900</span>
							<span class="name">Yoga2 13-ITH (日光橙)</span>
							<span class="configuration">第四代智能英特尔® 酷睿 Haswell双核处理器</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/laptop.jpg" alt="产品名称" title="产品名称" />
							<span class="price">￥5900</span>
							<span class="name">Yoga2 13-ITH (日光橙)</span>
							<span class="configuration">第四代智能英特尔® 酷睿 Haswell双核处理器</span>
						</a>
					</li>
				</ul>
				<div class="clear"></div>
			</section>
			<section class="detail">
				<h1>分类二</h1>
				<ul>
					<li>
						<a href="#">
							<img src="images/laptop.jpg" alt="产品名称" title="产品名称" />
							<span class="price">￥5900</span>
							<span class="name">Yoga2 13-ITH (日光橙)</span>
							<span class="configuration">第四代智能英特尔® 酷睿 Haswell双核处理器</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/laptop.jpg" alt="产品名称" title="产品名称" />
							<span class="price">￥5900</span>
							<span class="name">Yoga2 13-ITH (日光橙)</span>
							<span class="configuration">第四代智能英特尔® 酷睿 Haswell双核处理器</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/laptop.jpg" alt="产品名称" title="产品名称" />
							<span class="price">￥5900</span>
							<span class="name">Yoga2 13-ITH (日光橙)</span>
							<span class="configuration">第四代智能英特尔® 酷睿 Haswell双核处理器</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/laptop.jpg" alt="产品名称" title="产品名称" />
							<span class="price">￥5900</span>
							<span class="name">Yoga2 13-ITH (日光橙)</span>
							<span class="configuration">第四代智能英特尔® 酷睿 Haswell双核处理器</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="images/laptop.jpg" alt="产品名称" title="产品名称" />
							<span class="price">￥5900</span>
							<span class="name">Yoga2 13-ITH (日光橙)</span>
							<span class="configuration">第四代智能英特尔® 酷睿 Haswell双核处理器</span>
						</a>
					</li>
				</ul>
				<div class="clear"></div>
			</section>
		</article>
		<aside>
			<!--section id="classify">
				<h1>所有分类</h1>
				<ul>
					<li><a href="javascript:;">分类一</a></li>
					<li><a href="javascript:;">分类二</a></li>
					<li><a href="javascript:;">分类三</a></li>
				</ul>
			</section-->
			<section id="hotsale">
				<h1>热销榜</h1>
				<ul>
					<li><a href="#">产品一</a></li>
					<li><a href="#">产品二</a></li>
					<li><a href="#">产品三</a></li>
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
	$.focus("#focus");
	$.notice("#notice");
</script>
</body>
</html>