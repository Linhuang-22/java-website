<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.software.shopping.cart.*,com.software.shopping.product.*, com.software.shopping.user1.*,java.sql.*" %>


<!-- // check session to see if there's a cart in it -->
<!-- Cart cart = (Cart) session.getAttribute("cart"); -->
<!-- if(cart == null){ -->
<!-- 	cart = new Cart(); -->
<!-- 	session.setAttribute("cart", cart); -->
<!-- } -->


<jsp:useBean id="cart" class="com.software.shopping.cart.Cart" scope="session"></jsp:useBean>

<% 
if(cart == null)
{
	out.println("û���κι�����");
	return;
}
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
			<jsp:include page="welcome.jsp"></jsp:include>
			<div class="clear"></div>
		</div>
		<nav role="navigation">
			<div class="container">
				<ul class="first">
					<li><a href="#">�̳���ҳ</a></li>
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
				<h1>���ﳵ&nbsp;-&nbsp;��һ��ѡ����������Ʒ</h1>
				<ul class="order-list">
					<li>
						<div class="order-name"><span>��Ʒ����</span></div>
						<div class="order-price"><span>��Ʒ�۸�</span></div>
						<div class="order-status"><span>��Ʒ����</span></div>
					</li>
					    <%
                        	List<CartItem> items = cart.getItems();
	                        for(int i = 0; i < items.size(); i ++)
	                        {
		                       CartItem ci = items.get(i);
		                %>
					  <li>
						<div class="order-name"><span><%=ProductManager.getInstance().loadById(ci.getProductId()).getName()%></span></div>
						
						<div class="order-price"><span>��<%=ci.getPrice() %></span></div>
						<div class="order-status"><span><%=ci.getCount() %></span></div>
						
					 </li>
					 <%
	                 }
	                 %>
				</ul>
				<form>
					<input class="submit" type="submit" value="ȷ�Ϲ���"  onclick="document.location.href='confirm.jsp'; return false" />
				</form>
			</section>
		</article>
		<aside>
			<section id="hotsale">
				<h1>������</h1>
				<ul>
					<li><a href="#">��Ʒһ</a></li>
					<li><a href="#">��Ʒ��</a></li>
					<li><a href="#">��Ʒ��</a></li>
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