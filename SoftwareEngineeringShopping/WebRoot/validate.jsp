<%
response.setContentType("text/xml");
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP1.1
response.setDateHeader("Expires", 0); // prevents caching at the proxy server
response.getWriter().write("<msg>invalid</msg>");
%>