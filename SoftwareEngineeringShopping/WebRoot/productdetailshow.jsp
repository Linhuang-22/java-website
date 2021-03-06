<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.software.shopping.product.*,com.software.shopping.user1.*,java.sql.*" %>

<%
request.setCharacterEncoding("GB18030");
int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductManager.getInstance().loadById(id); 
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
				<h1><%=p.getName() %></h1>
				<div class="detail-img">
					<img src="images\product\ThinkPad.jpg" alt="#" title="#" />
				</div>
				<div class="detail-con">
					<p class="configuration"><%=p.getDescr() %></p>
					<p>普通价：<span class="price">￥<%=p.getNormalPrice() %></span><br />会员价：<span class="price">￥<%=p.getMemberPrice() %></span></p>
					<div class="buy">
						<a href="buy.jsp?id=<%=id%>">加入购物车</a>
					</div>
				</div>
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
</script>
</body>
</html>