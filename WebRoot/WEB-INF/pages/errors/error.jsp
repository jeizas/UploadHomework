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
<link rel="stylesheet" type="text/css" href='http://fonts.googleapis.com/css?family=Julius+Sans+One' >
<link rel="stylesheet" type="text/css" href="./css/style.css" media="all" />
<!--slider-->
    <link rel="stylesheet" type="text/css" href="./css/camera.css"  media="all" />
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
					  <p class="para">${exception.message }点击重新登录</p>
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
	<!-- start main1 -->
	<div class="main1">
				<div class="grid_1_of_2 c_left">
				  	<h2>课程动态</h2>
				  	<div class="grid_img img_style">
				  	<a href="#"><img src="./images/pic4.jpg" alt=""/></a>
				  	</div>
				  	<p class="para">各科作业提交要求以及完成百分率</p>
				  	<div class="read_more">
				  		<a href="#"><button class="btn">read more</button></a>
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
