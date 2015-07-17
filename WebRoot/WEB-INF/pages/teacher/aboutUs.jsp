<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>关于我们</title>
	<base href="<%=basePath %>">     
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/style.css"  media="all" />
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
		   				<li><a href="teacher/homePage?id=${id }"><span>进入首页</span></a></li>
		   				<li><a href="teacher/courseManage"><span>作业管理</span></a></li>
		   				<li class="has-sub"><a href="javascript:void(0)"><span>网络资料</span></a></li>
		   				<li class="active" class="last"><a href="javascript:void(0)"><span>联系我们</span></a></li>		 				
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
			<div class="main">
				<div class="section group">				
				  <div class="col span_1_of_2">
					<div class="contact_info">
			    	 	<h2>我的大学</h2>
			    	 	<img alt="" src="./images/school1.jpg" style="">
      				</div>
      			    <div class="company_address">
				     	<h2>学校地址</h2>
						<p>铁西区沈辽西路111号</p>
						<p>辽宁省 沈阳市</p>
						<p>中国</p>
				   		<p>电话: 13332420972</p>
				 	 	<p>邮箱: <span>jeizas@sina.com</span></p>
				   		<p>登录: <span>QQ</span>, <span>Google+</span></p>
				     </div>
				     <div class="clear"></div>
				  </div>				
				  <div class="col span_2_of_4">
				  	<div class="contact-form">
				  		<h2>联系我们</h2>
					       <form method="post" action="contact-post.html">
					    	<div>
						    	<span><label>姓名</label></span>
						    	<span><input name="userName" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>邮箱</label></span>
						    	<span><input name="userEmail" type="text" class="textbox"></span>
						    </div>
						    <div>
						     	<span><label>手机</label></span>
						    	<span><input name="userPhone" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>留言</label></span>
						    	<span><textarea name="userMsg"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="button" value="Send Us"></span>
						  </div>
					    </form>

				     </div>
  				   </div>		
  				   <div class="clear"></div>
		  		 </div>
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