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
	
	<!-- slider -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/camera.css"  media="all" />
    <link rel="Stylesheet" type="text/css" href="<%=basePath%>/css/loginDialog.css" />
    
    <script type='text/javascript' src='<%=basePath%>/js/jquery.min.js'></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script> 
   

</head>
  
<body>	
<!--start header-->
<div class="h_bg">
  <div class="wrap">
    <div class="wrapper">
      <div class="header">
	<div class="logo">
		 <a href="javascript:void(0)"><img src="./images/logo.png"> </a>
	</div>
	  <div class="cssmenu">
		<ul>
		   <li class="active"><a href="teacher/homePage?sno=${id}"><span>进入首页</span></a></li>
		   <li><a href="teacher/courseManage"><span>课程管理</span></a></li>
		   <li class="has-sub"><a href="javascript:void(0)"><span>网络资源</span></a></li>
		   <li class="last"><a href="teacher/aboutUs"><span>联系我们</span></a></li>
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
	<div class="main">
	<!-- start main -->
	    <div class="grids_1_of_3">
				<div class="grid_1_of_3 images_1_of_3 bg">
					 <h3>注册与登录</h3>
					  <a href="details.html"><img src="./images/pic1.jpg"></a>
					  <div class="plus_btn"><span id="plus_btn1"></span></div>
						<div class="clear"></div>
					  <div  class="login-after">
						<span style="font-size:12;">您好！欢迎登录沈阳工业大学作业信息管理系统</span><br/><br/>		    
					    <span style="">用户名：${teacher.tno }</span><br/>
					    <a href="logout"><input type="button" id="loginleft" value="注销" /></a>
					    <a href="teacher/changePassword"><input type="button" id="loginright" value="修改密码"/></a>
					  </div>
				</div>
				<div class="grid_1_of_3 images_1_of_3 bg">
					 <h3>作业管理</h3>
					  <a href="javascript:void(0)"><img src="./images/pic2.jpg"></a>
					 <div class="plus_btn"><a href="teacher/courseManage"><span></span></a></div>
					   <p class="para">点击进入对应课程管理</p>
				</div>
				<div class="grid_1_of_3 images_1_of_3 bg hide">
					 <h3>网络资源</h3>
					  <a href="javascript:void(0)"><img src="./images/pic3.jpg"></a>
					  <div class="plus_btn"><a href="javascript:void(0)"><span></span></a></div>
					  <p class="para">进入课程获得更多网络资源</p>
				</div>
				<div class="clear"></div>
			</div>
		<div class="clear"></div>
	</div>
	<!-- start main1 -->
	<div class="main1">
				<div class="grid_1_of_2 c_left">
				  	<h2>课程动态</h2>
				  	<div class="grid_img img_style">
				  	<a href="details.html"><img src="./images/pic4.jpg" alt=""/></a>
				  	</div>
				  	<p class="para">各科作业提交要求以及完成百分率</p>
				  	<div class="read_more">
				  		<a href="details.html"><button class="btn">read more</button></a>
				  	</div>
 				</div>
				<div class="grid_1_of_2 c_right">
				 	 <h2>作业要求及完成情况 </h2>
					<ul class="list">
                        <li>
                            <div class="clearfix">
                                <span>面向对象程序设计</span>
                                <em class="icon-caret-up">+43%</em>
                                <strong>75,5%</strong>
                                <div class="clear"></div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar" style="width: 60%"></div>
                            </div>
                        </li>
                        <li>
                            <div class="clearfix">
                                <span>Java程序设计</span>
                                <em class="icon-caret-down">-18%</em>
                                <strong>18%</strong>
                                <div class="clear"></div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar" style="width: 18%"></div>
                            </div>
                        </li>
                        <li>
                            <div class="clearfix">
                                <span>Web程序设计</span>
                                <em class="icon-caret-up">+33.7%</em>
                                <strong>44.5%</strong>
                                <div class="clear"></div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar" style="width: 35%"></div>
                            </div>
                        </li>
                        <li>
                            <div class="clearfix">
                                <span>计算机程序设计与实践</span>
                                <em class="icon-caret-down">-39%</em>
                                <strong>10%</strong>
                                <div class="clear"></div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar" style="width: 24%"></div>
                            </div>
                        </li>
                        <li>
                            <div class="clearfix">
                                <span>.NET框架</span>
                                <em class="icon-caret-down">-26%</em>
                                <strong>34%</strong>
                                <div class="clear"></div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar" style="width: 34%"></div>
                            </div>
                        </li>                                              
                    </ul>
                    <div class="clear" ></div> 
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
