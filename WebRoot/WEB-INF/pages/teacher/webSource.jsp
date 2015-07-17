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
		   				<li><a href="teacher/homePage?id=${id}"><span>进入首页</span></a></li>
		  					<li ><a href="teacher/courseManage"><span>课程管理</span></a></li>
		   					<li class="active"class="has-sub"><a href="javascript:void(0)"><span>网络资源</span></a></li>
		   					<li class="last"><a href="teacher/aboutUs"><span>联系我们</span></a></li>		 
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
			<div style="height:50px;font-size:20px;">
				<p style="margin:20px;text-align:center;">* * * 课程资料共享 	* * * </p>
			</div>
			<!-- 已上传的作业 -->
			<c:forEach items="${datalist }" var="d">
				<div style="height:155px;font-size:14px;margin-top:8px; ">
					<div style="background:#53A3C7;font-size:18px;">
					    <span style="color:#fff;width:49%;">${d.dname }</span>
					    <span style="color:#fff;margin-left:30%;">${d.dtime}</span>
					    <a href="teacher/delete?cno=${d.cno }&name=${d.dname}" style="float:right;color:#FFF;">
					    	删除
					    </a>
					</div>
						<div style="width:30%;float:left;height:75px;">
							<p style="background:#F5FFFA;margin:14px auto 10px 20px;height:28px;">下载资料</p>
							<p style="background:#F5FFFA;margin:14px auto 10px 20px;height:73px" >资料简介(或者资料连接)</p>
						</div>
						<div style="width:69.5%;float:right;height:75px;">
							<p style="width:100%;height:28px;margin-top:14px;background:#D2E9FF;" >${d.dfile }</p>
							<p style="width:100%;height:70px;margin-top:16px;background:#D2E9FF;" >${d.dsummary}</p>
						</div>
				</div>
			</c:forEach>
			
			<!-- 上传作业 -->
			<div style="height:260px;font-size:14px;margin-top:26px; ">
					<p style="color:#f00;font-size:18px;margin-top:0px;background:#53A3C7;height:22px;width:100%;">上传资料</p>
				<form method="post" action="teacher/uploadData/${cno}" enctype="multipart/form-data" >
					<div style="width:30%;float:left;height:170px;">
						<p style="background:#F5FFFA;margin:10px auto 10px 20px;height:28px;">资料名称</p>
						<p style="background:#F5FFFA;margin:14px auto 10px 20px;height:28px;">上传资料(可不填写)</p>
						<p style="background:#F5FFFA;margin:14px auto 10px 20px;height:73px" >资料简介(或者资料连接)</p>
					</div>
					<div style="width:69.5%;float:right;height:170px;">
						<input type="text" name="dname"  style="width:100%;height:28px;margin-top:10px;" ><br/>
						<input type="file" name="attach" style="width:100%;height:28px;margin-top:14px;border:1px solid #B0C4DE;" ><br/>
						<textarea rows="3" name="dsummary" style="width:100%;height:73px;margin-top:14px; " ></textarea>
					</div>
					<input type="submit" value="发布" style="width:100%;margin:10px auto;">
				</form>
			</div>		
		</div>
	</div>
</div>

</body>
</html>