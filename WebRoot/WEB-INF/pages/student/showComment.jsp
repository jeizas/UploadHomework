<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>查看评论</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css" media="all" />
	
  </head>

<body>

<div class="h_bg">
	<div class="wrap">
		<div class="wrapper">
		  <div class="header">
		  		<div class="logo">
		 			<a href="#"><img src="images/logo.png"> </a>
				</div>
				<div class="cssmenu">
			  		<ul>
		   				<li><a href="student/homePage/?id=${id}"><span>进入首页</span></a></li>
		  				<li ><a href="student/courseManage"><span>课程管理</span></a></li>
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
			<div style="height:450px;">
			    <h2 >查看评语</h2>
				<table class="tables" style="width:100%;font-size:18; " >
					<tr>
						<td colspan="4" >${course.cname }课第${task.sctimes }次作业</td>
					</tr>
					<tr>
					   <td >实验内容 </td>
					   <td colspan="3" >${task.stitle }</td>
					</tr>
					<tr >
						<td style="width:25%;">批阅时间</td>
						<td style="width:25%;">${sqltime}</td>
						<td style="width:25%;">成绩</td>
						<td style="width:25%;">${comment.somscore }</td>
					</tr>
					<tr>
						<td >查看作业</td>
						<td colspan="3"  ><a href="student/${student.sno}/${sc.scfile}/download">${sc.scfile }</a></td>
					</tr>
					<tr>
						<td style="height:200px "align="center">评语</td>
						<td colspan="3" style="text-align:left;">${comment.comremark }</td>
					</tr>					
				</table>
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
