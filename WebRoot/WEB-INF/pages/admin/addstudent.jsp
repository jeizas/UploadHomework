<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>沈阳工业大学 信息作业管理</title>
	<base href="<%=basePath %>">     
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css" media="all" />
	<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath%>/js/jquery2.0.0.min.js"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
   
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
		   <li class="active"><a href="admin/homePage?id=${id}"><span>进入首页</span></a></li>
		   <li><a href="javascript:void(0)"><span>课程管理</span></a></li>
		   <li class="has-sub"><a href="javascript:void(0)"><span>网络资源</span></a></li>
		   <li class="last"><a href="javascript:void(0)"><span>联系我们</span></a></li>
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
 	<div style="height:600px;">
		<div class="ad_left" style="width:30%;height:95%;float:left;">
 			<H2>欢迎管理系统</H2>
 				<P style="margin:10px auto 15px 10px;">管理员:${ano }</P>
			<a href="admin/teacherManage">  <button >管理老师</button> </a>
			<a href="admin/studentManage">  <button >管理学生</button> </a>
			<a href="admin/courseManage">   <button >管理课程</button> </a>
			<a href="admin/changePassword"> <button >修改密码</button> </a>
			<a href="logout">             <button >注销登录</button> </a>
		</div>
		<div class="ad_right" style="width:68%;height:95%;float:right;">
			<table class="table table-hover" style="width:100%;">
			   <caption>管理老师--->增加老师</caption>
			   <thead>
			      <tr>
			         <th>学号</th>			         
			         <th>姓名</th>
			         <th>密码</th>
			         <th>专业</th>
			         <th>年级</th>
			         <th>班级</th>
			      </tr>
			   </thead>
			</table>
			<div style="border:2px solid #dbdbdb;height:270px;">
				<form method="post" action="admin/addstudent" >
					<div style="width:20%;float:left;">
						<p style="margin:16px;">帐号</p>					
						<p style="margin:16px;">姓名</p>					
						<p style="margin:16px;">密码</p>					
						<p style="margin:16px;">专业</p>
						<p style="margin:16px;">年级</p>
						<p style="margin:16px;">班级</p>
						<input type="submit" value="添加" style="margin-left:10px;"/>
					</div>
					<div style="width:50%;float:left;">
						<input type="text" name="sno"  style="margin-top:10px;"><br/>
						<input type="text" name="sname"  style="margin-top:10px;"><br/>
						<input type="password" name="spwd" value="000000" style="margin-top:10px;"><br/>
						<input type="text" name="smajor" style="margin-top:10px;">
						<input type="text" name="sgrade" style="margin-top:10px;">
						<input type="text" name="sclass" style="margin-top:10px;">
					</div>
				</form>
			</div>
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
			<p class="w3-link">© All Rights Reserved | Design by&nbsp; <a href="#">Shenyang University of Industry</a></p>
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
