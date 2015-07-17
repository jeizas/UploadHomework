<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*" %>
<%response.setStatus(HttpServletResponse.SC_OK);%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>error page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body>

程序发生了错误，有可能该页面正在调试或者是设计上的缺陷.<br/>
你可以选择<br/>
<a href=<%=request.getContextPath()+"/forum/new.jsp" %>>反馈</a>
提醒我 或者<br/>
<a href="javascript:history.go(-1)">返回上一页</a>
<hr width=80%>
<h2><font color=#DB1260>Error Page</font></h2>


</body>
</html>
