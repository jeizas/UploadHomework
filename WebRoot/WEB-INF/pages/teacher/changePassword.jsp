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
    
<script type="text/javascript">
 	function judgepassword(){
 		var d=document.getElementById("_apwd").value;
 		var c=document.getElementById("apwd").value;
  	   if (c!=d)  {
  		   alert("两次输入的密码不一致");
  		   document.getElementById("apwd").select();
  		   return false;
    	 }
    	 else{
    	    document.modifyForm.submit();
    	 }
 	}
</script>
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
		<div class="ad_right" style="width:100%;height:95%;float:right;">
			${teacher.tname }----->修改密码
			<form method="post" action="teacher/changePassword?id=${id }" name="modifyForm"  >
					<div style="width:20%;float:left;">
						<p style="margin:16px;">帐号</p>					
						<p style="margin:16px;">密码</p>					
						<p style="margin:16px;">确认密码</p>					
						<input type="button" value="确认修改" onclick="judgepassword()" style="margin-left:10px;">
					</div>
					<div style="width:50%;float:left;">
						<p  style="margin-top:14px;">${ano }</p>
						<input type="password" name="_tpwd"  id="_apwd" style="margin-top:10px;"><br/>
						<input type="password"  name="tpwd"  id="apwd"  style="margin-top:10px;"><br/>
					</div>
			</form>
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
