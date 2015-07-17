<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>课程管理</title>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css" media="all" />
</head>

<body>
<!--start header-->
<div class="h_bg">
	<div class="wrap">
		<div class="wrapper">
		  <div class="header">
				<div class="logo">
		 			<a href="#"><img src="images/logo.png"> </a>
				</div>
			<div class="cssmenu">
			  <ul>
		   		<li><a href="student/homePage?id=${id}"><span>进入首页</span></a></li>
		  		<li class="active"><a href="#"><span>课程管理</span></a></li>
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
<!-- start content -->
<div class="content_bg">
	<div class="wrap">
		<div class="wrapper">
			<!-- start main -->
			<div class="main"style="">
				<div class="ser-main">
					<h2>我们的课程</h2>
					<div class="ser-para">
					</div>
						<c:forEach items="${courseList }" var="cou">
							<div class="ser-grid-list img_style" style="">
								<h5>${cou.cname }</h5>
								<a href="student/uploadHomework/${cou.cno }"><img src="./images/${cou.cimage }" alt=""></a>
								<p class="para" id="para-button">${cou.csummary }</p>
								<div class="read_more">
									<a href="student/uploadHomework/${cou.cno }"><button class="btn">进入课程</button></a>
								</div>
							</div>
						</c:forEach>				
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
<!-- start footer -->
<div class="footer_bg">
	<div class="wrap">
		<div class="wrapper">
			<div class="footer">
				<div class="copy">
					<p class="w3-link">© All Rights Reserved | Design by&nbsp; <a href="#"> Shenyang University of Industry</a></p>
				</div>
				<div class="f_nav">
					<ul>
						<li><a href="#">Skype</a></li>
						<li><a href="#">Linked in</a></li>
						<li><a href="#">Twitter</a></li>
						<li><a href="#">Facebook</a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>