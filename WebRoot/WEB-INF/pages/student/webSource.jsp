<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>网络资源</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css" media="all" />
	
  </head>  
<body>
<!--start header-->
<div class="h_bg">
  <div class="wrap">
    <div class="wrapper">
      <div class="header">
	<div class="logo">
		 <a href="index.html"><img src="./images/logo.png"> </a>
	</div>
	  <div class="cssmenu">
		<ul>
		   <li class="active"><a href="student/homePage?id=${id}"><span>进入首页</span></a></li>
		   <li><a href="student/courseManage"><span>课程管理</span></a></li>
		   <li class="has-sub"><a href="student/webSource"><span>网络资源</span></a></li>
		   <li class="last"><a href="student/aboutUs"><span>联系我们</span></a></li>
	    </ul>
	    <div class="clear"></div>
	  </div>
	  <div class="clear"></div>
      </div>
   </div>
 </div>
</div>

<div class="content_bg">
	<div class="wrap">
		<div class="wrapper">
			<c:forEach items="${datalist }" var="d"> 
					<div style="height:155px;font-size:14px;margin-top:8px;">
						<div style="background:#53A3C7;font-size:18px;">
					    	<span style="color:#fff;width:49%;">${d.dname }</span>
					    	<span style="color:#fff;float:right;">${d.dtime}</span>
						</div>
						<div style="width:30%;float:left;height:75px;">
							<p style="background:#F5FFFA;margin:14px auto 10px auto;height:28px;">下载资料</p>
							<p style="background:#F5FFFA;margin:14px auto 10px auto;height:73px" >资料简介(或者资料连接)</p>
						</div>
						<div style="width:69.5%;float:right;height:75px;">
							<p style="width:100%;height:28px;margin-top:14px;background:#D2E9FF;" ><a href="student/${d.cno }/${d.dfile}/download">${d.dfile }---------点击下载</a></p>
							<p style="width:100%;height:70px;margin-top:16px;background:#D2E9FF;" >${d.dsummary}</p>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
</div>

</body>
</html>


					