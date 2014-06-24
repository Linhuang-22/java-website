<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import = "com.software.shopping.user1.*,com.software.shopping.product.*,java.sql.*" %>
<%@ page import = "com.software.shopping.category.*,com.software.shopping.cart.*" %>
<%
User u = (User)session.getAttribute("user");
boolean flag;
if(u == null) {
	flag = true;
}
else
{
	flag = false;
}
%>
<%!
private String getSecondCategoryStr(List<Category> categories, Category topCategory)
{
	StringBuffer buf = new StringBuffer();
	
	int childCount = 1;
	
	for(int i = 0; i < categories.size(); i ++){
		Category c = categories.get(i);
		if(c.getPid() == topCategory.getId()){
			buf.append("document.form2.category2.options[" + childCount + "].text = '" + c.getName() + "';\n");
			buf.append("document.form2.category2.options[" + childCount + "].value = '" + c.getId() + "';\n");
			childCount ++;
		}
	}
	
	buf.insert(0, "document.form2.category2.options[0].text = '请选择二级目录';\n");
	buf.insert(0, "document.form2.category2.options[0].value = '-1';\n");
	buf.insert(0, "document.form2.category2.selectedIndex = 0 ;\n");
	buf.insert(0, "document.form2.category2.options.length = " + childCount + ";\n");
	buf.insert(0, "if(document.form2.category1.options[document.form2.category1.selectedIndex].value == " + topCategory.getId() + ") {\n");
	buf.append("}\n");
	
	return buf.toString();
}
 %>
  
<%
List<Product> allProducts = ProductManager.getInstance().getProducts();
List<Category> categories = Category.getCategories();
List<Category> topCategories = new ArrayList<Category>();
String str = "";
for(int i = 0; i < categories.size(); i ++){
	Category c  = categories.get(i);
	if(c.getGrade() == 1){
		topCategories.add(c);
		str += getSecondCategoryStr(categories,c);
	}
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
			
			<div class="welcome">
			  <%if(flag){ %>
				  <p>欢迎您来到联想网上商城！请 <a href="loginOrReg.jsp">[登录]</a> 或者 <a href="loginOrReg.jsp">[免费注册]</a></p>
			  <%} else{%>
			      <p><a href="userModify.jsp"><%=u.getUsername() %></a>，查看<a href="order.jsp">[我的订单]</a>，<a href="#">注销</a></p>
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
						<%
						for(int i = 0; i < categories.size(); i ++){
							Category c = categories.get(i);
							String id = "detail" + Integer.toString(i);
						 %>
							<li>
								<a href="#<%=id%>">类别：<%=c.getName() %></a>
							</li>
						<%
						}
						 %>
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
			<%
			for (int i = 0; i < categories.size(); i ++){
				Category c = categories.get(i);
				String id = "detail" + Integer.toString(i);
			 %>
			<section class="detail" id = <%=id %>>
				<h1>类别：<%= c.getName() %></h1>
				<ul>
					<% 
					for (int j = 0; j < allProducts.size(); j ++ ){
						Product p = allProducts.get(j);
						if(c.getId() == p.getCategoryId()){
						%>
						<li>
							<a href="productdetailshow.jsp?id=<%=p.getId() %>">
								<img src="images/laptop.jpg" alt=<%=p.getName() %> title="产品名称" />
								<span class="name"><%=p.getName() %></span>
								<span class="price">市场价：<%=p.getNormalPrice() %></span>
								<span class="price">会员价：<%=p.getMemberPrice() %></span>
								<span class="configuration"><%=p.getDescr() %></span>
							</a>
						</li>
						<%
						}
					}
					%>
				</ul>
				<div class="clear"></div>
			</section>
			<% } %>
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