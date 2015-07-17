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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/style.css" media="all" />
<!--slider-->
    <link rel="Stylesheet" type="text/css" href="./css/loginDialog.css" />
    <script type='text/javascript' src='./js/jquery.min.js'></script>
    <script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script> 
    
<script type="text/javascript">
	$(function ($) {
		//弹出登录
		$("#example").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '0.6'
			}, 1000);
		}).on('click', function () {
			$("body").append("<div id='mask'></div>");
			$("#mask").addClass("mask").fadeIn("slow");
			$("#LoginBox").fadeIn("slow");
		});
		//
		//按钮的透明度
		$("#loginbtn").hover(function () {
			$(this).stop().animate({
				opacity: '1'
			}, 600);
		}, function () {
			$(this).stop().animate({
				opacity: '0.8'
			}, 1000);
		});
		//文本框不允许为空---按钮触发
		$("#loginbtn").on('click', function () {
			var txtName = $("#txtName").val();
			var txtPwd = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$(".warning").css({ display: 'block' });
				}
				else {
					$("#warn").css({ display: 'block' });
					$("#warn2").css({ display: 'none' });
				}
			}
			else {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$("#warn").css({ display: 'none' });
					$(".warn2").css({ display: 'block' });
				}
				else {
					$(".warning").css({ display: 'none' });
				}
			}
		});
		//文本框不允许为空---单个文本触发
		$("#txtName").on('blur', function () {
			var txtName = $("#txtName").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn").css({ display: 'block' });
			}
			else {
				$("#warn").css({ display: 'none' });
			}
		});
		$("#txtName").on('focus', function () {
			$("#warn").css({ display: 'none' });
		});
		//
		$("#txtPwd").on('blur', function () {
			var txtName = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn2").css({ display: 'block' });
			}
			else {
				$("#warn2").css({ display: 'none' });
			}
		});
		$("#txtPwd").on('focus', function () {
			$("#warn2").css({ display: 'none' });
		});
		//关闭
		$(".close_btn").hover(function () {
		   $(this).css({ color: 'black' }); },function () { $(this).css({ color: '#999' }); }).on('click', function () {
			$("#LoginBox").fadeOut("fast");
			$("#mask").css({ display: 'none' });
		});
	});
</script>
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
		   <li class="active"><a href="#"><span>进入首页</span></a></li>
		   <li><a href="#"><span>课程管理</span></a></li>
		   <li class="has-sub"><a href="#"><span>网络资源</span></a></li>
		   <li class="last"><a href="#"><span>联系我们</span></a></li>
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
	<div class="main">
	<!-- start main -->
	    <div class="grids_1_of_3">
				<div class="grid_1_of_3 images_1_of_3 bg">
					 <h3>注册与登录</h3>
					  <a href="#"><img src="./images/pic1.jpg"></a>
					  <div class="plus_btn"><span id="example"></span></div>
						<div class="clear"></div>
					  <p class="para">欢迎使用信息作业管理系统，点击登录<br/>
					  </p>
				</div>
				<div class="grid_1_of_3 images_1_of_3 bg">
					 <h3>作业管理</h3>
					  <a href="#"><img src="./images/pic2.jpg"></a>
					 <div class="plus_btn"><a href="#"><span></span></a></div>
					   <p class="para">请登录后进行作业管理</p>
				</div>
				<div class="grid_1_of_3 images_1_of_3 bg hide">
					 <h3>网络资源</h3>
					  <a href="#"><img src="./images/pic3.jpg"></a>
					  <div class="plus_btn"><a href="#"><span></span></a></div>
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
				<p style="text-indent:2em;">学校师资力量雄厚，名师云集。现有师资队伍1366人，其中院士3人、教授191人、副教授424人、讲师659人、博士、硕士生导师69人，硕士导师422人。	</p>
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
			<p class="w3-link">© All Rights Reserved | Design by&nbsp; <a href="">Shenyang University of Industry</a></p>
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

<div id="LoginBox">
	<form method="post" action="login">
        <div class="row1">
            用户登录<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a>
        </div>
        <div class="row">
            用户名: <span class="inputBox">
                <input type="text" id="txtName" name="number" placeholder="输入账号" />
            </span><a href="javascript:void(0)" title="提示" class="warning" id="warn">*</a>
        </div>
        <div class="row">
            密&nbsp;&nbsp;&nbsp;&nbsp;码: <span class="inputBox">
                <input type="password" id="txtPwd" name="password" placeholder="输入密码" />
            </span><a href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
        </div>
        <div class="row">
            <input type="submit" id="loginbtn" value="登录">
        </div>
   </form>
</div>

	
</body>

</html>
