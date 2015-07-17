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
<script type="text/javascript">// <![CDATA[ 
	var t = n = 0, count; 
	$(document).ready(function(){ 
	count=$("#banner_list a").length; 
	$("#banner_list a:not(:first-child)").hide(); 
	$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt')); 
	$("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank");}); 
	$("#banner li").click(function() { 
	var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4 
	n = i; 
	if (i >= count) return; 
	$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt')); 
	$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank");}) ;
	$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000); 
	$(this).css({"background":"#be2424",'color':'#000'}).siblings().css({"background":"#6f4f67",'color':'#fff'}); 
	}); 
	t = setInterval("showAuto()", 4000); 
	$("#banner").hover(function(){clearInterval(t);}, function(){t = setInterval("showAuto()", 4000);}); 
	}) ;

	function showAuto() { 
		n = n >=(count - 1) ? 0 : ++n; 
		$("#banner li").eq(n).trigger('click'); 
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
					    <span style="">用户名：${sname }</span><br/>
					    <a href="logout"><input type="button" id="loginleft" value="注销" /></a>
					    <a href="#"><input type="button" id="loginright" value="修改密码"/></a>
					  </div>
				</div>
				<div class="grid_1_of_3 images_1_of_3 bg">
					 <h3>作业管理</h3>
					  <a href="student/courseManege"><img src="./images/pic2.jpg"></a>
					 <div class="plus_btn"><a href="student/courseManage"><span></span></a></div>
					   <p class="para">再此处进入课程，进行相关操作</p>
				</div>
				<div class="grid_1_of_3 images_1_of_3 bg hide">
					 <h3>网络资源</h3>
					  <a href="http://jwzx.sut.edu.cn/jwc/content.jsp?id=78"><img src="./images/pic3.jpg"></a>
					  <div class="plus_btn"><a href="student/webSource"><span></span></a></div>
					  <p class="para">获取更多网络资源</p>
				</div>
				<div class="clear"></div>
			</div>
		<div class="clear"></div>
	</div>
	<div style="height:40px; margin:1px auto;">
		<p style="font-size:28;">学校简介</p> 
	</div>
	<div style="width:100%;height:400px">
			<div style="width:39%;float:left;height:400px; font-family:宋体;font-size:14;">
				<p style="text-indent:2em;"> 沈阳工业大学是一所以工为主，涵盖工、理、经、管、文、法、哲、艺术等八大学科门类的多科性教学研究型大学。学校始建于1949年，1985年由沈阳机电学院更名为沈阳工业大学，原为国家机械工业部所属院校，1998年起由中央和地方共建，以辽宁省管理为主。</p>
				<p style="text-indent:2em;">学校由位于辽宁省沈阳市的中央校区、兴顺校区、国家大学科技园和位于辽宁省辽阳市的辽阳校区等四个校区组成。中央校区（主校区）位于沈阳市装备制造业聚集的国家级经济技术开发区。校园内碧波荡漾，草木葱茏，精致典雅，如诗如画，是读书治学和陶冶情操的理想之所。</p>
				<p style="text-indent:2em;">学校总占地面积138.4万平方米，校舍建筑面积62.4万平方米，设有20个学院、3个教学部和2个工程实践中心，共设50个本科专业、20个专科专业。学校现有普通本科生20348人，硕士研究生2664人，博士研究生272人，其他类硕士生473人，专科生1815人，成人教育学生7971人，外国留学生151人。</p>
				<p style="text-indent:2em;">学校师资力量雄厚，名师云集。现有师资队伍1366人，其中院士3人、教授191人、副教授424人、讲师659人、博士、硕士生导师69人，硕士导师422人。中青年学科带头人25人。具有博士学位的教师占师资队伍总数的30%。</p>
			</div>
			<div id="banner"> 
				<div id="banner_bg"></div> 
				<!--标题背景--> 
				<div id="banner_info"></div> 
				<!--标题--> 
				<ul> 
					<li>1</li> 
					<li>2</li> 
					<li>3</li> 
					<li>4</li> 
				</ul> 
				<div id="banner_list"> 
					<a href="javascript:void(0)" target="_blank"><img src="./images/home1.jpg" title="校园风光" alt="校园风光" /></a> 
					<a href="javascript:void(0)" target="_blank"><img src="./images/home2.jpg" title="青春广场" alt="青春广场" /></a> 
					<a href="javascript:void(0)" target="_blank"><img src="./images/home3.jpg" title="斜阳迎面" alt="斜阳迎面" /></a> 
					<a href="javascript:void(0)" target="_blank"><img src="./images/home4.jpg" title="蓝天白云" alt="蓝天白云" /></a> 
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
