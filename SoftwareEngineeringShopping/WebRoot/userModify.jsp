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
	out.println("�޸ĳɹ�!");
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
			<div class="welcome">
				<p><a href="#">[�û���]</a>���鿴<a href="#">[�ҵĶ���]</a>��<a href="#">ע��</a></p>
			</div>
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
				<h1>������Ϣ</h1>
				<div class="info">
					<span>�绰���룺</span>
					<input type="text" value="12345678" disabled="disabled" />
					<a class="change-info" href="javascript:;">�޸�</a>
				</div>
				<div class="info">
					<span>�ͻ���ַ��</span>
					<textarea disabled="disabled">�������ͻ���ַ~~</textarea>
					<a class="change-info" href="javascript:;">�޸�</a>
				</div>
				<input type="submit" class="submit" value="ȷ���޸�" style="display: none;" />
			</section>
			<section class="detail">
				<h1>�޸�����</h1>
				<form>
					<div class="input">
						<span>������ԭ����</span>
						<input type="password" />
					</div>
					<div class="input">
						<span>������������</span>
						<input type="password" />
					</div>
					<div class="input">
						<span>���ٴ�����������</span>
						<input type="password" />
					</div>
					<input type="submit" class="submit" value="ȷ���޸�" />
				</form>
			</section>
		</article>
		<aside>
			<section id="hotsale">
				<h1>�ҵ��̳�</h1>
				<ul>
					<li><a href="#">������Ϣ</a></li>
					<li><a href="#">�ҵĶ���</a></li>
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
	$.regInput(".input");
	$.changeInfo(".change-info");
</script>
</body>
</html>