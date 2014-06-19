<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.software.shopping.*,com.software.shopping.user1.*,com.software.shopping.order.SalesOrder,com.software.shopping.cart.Cart,java.sql.*"%>


<%
	User u = (User) session.getAttribute("user");
%>

<jsp:useBean id="cart" class="com.software.shopping.cart.Cart" scope="session"></jsp:useBean>
<%

if (cart == null)
{
    out.println("û���κι�����");
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
	<title>���������̳�</title>
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
				<a href="#"><img src="images/logo.jpg" alt="���������̳�" title="���������̳�" /></a>
			</div>
			<div class="welcome">
				<p><a href="userModify"><%=u.getUsername() %></a>���鿴<a href="#">[�ҵĶ���]</a>��<a href="#">ע��</a></p>
			</div>
			<div class="clear"></div>
		</div>
		<nav role="navigation">
			<div class="container">
				<ul class="first">
					<li><a href="index.jsp">�̳���ҳ</a></li>
					<li>
						<a href="#">���в�Ʒ</a>
						<ul class="second">
							<li>
								<a href="#">����һ</a>
							</li>
							<li>
								<a href="#">�����</a>
							</li>
							<li>
								<a href="#">�����</a>
							</li>
						</ul>
					</li>
					<li><a href="#">�ۺ����</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="container">
		<article class="main" role="main">
			<section class="detail">
				<h1>�ҵĶ���</h1>
				<ul class="order-list">
					<li>
						<div class="order-name"><span>��Ʒ����</span></div>
						<div class="order-price"><span>�����۸�</span></div>
						<div class="order-status"><span>����״̬</span></div>
					</li>
					<li>
						<div class="order-name"><span>������Ʒ����</span><span>���ǵڶ�����Ʒ����</span></div>
						<div class="order-price"><span>��1000.00</span></div>
						<div class="order-status"><span>�ѷ���</span></div>
					</li>
				</ul>
			</section>
		</article>
		<aside>
			<section id="hotsale">
				<h1>�ҵ��̳�</h1>
				<ul>
					<li><a href="userModify.jsp">������Ϣ</a></li>
					<li><a href="order.jsp">�ҵĶ���</a></li>
				</ul>
			</section>
		</aside>
		<div class="clear"></div>
	</div>
	<footer>
		<div class="container">
			<img src="images/footer.png" />
		</div>
		<p>��Ȩ���У�1998��2014 ��������̳� �� ��ICP��11035381</p>
	</footer>
<script type="text/javascript" src="script/jquery-1.11.1.min.js" ></script>
<script type="text/javascript" src="script/script.js"></script>
<script type="text/javascript">
</script>
</body>
</html>