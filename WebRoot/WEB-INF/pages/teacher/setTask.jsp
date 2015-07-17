<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>评阅作业</title>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css" media="all" />
	<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath%>/js/jquery2.0.0.min.js"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="<%=basePath%>/js/Calendar.js"></script>
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
		   		<li><a href="teacher/homePage?id=${id}"><span>进入首页</span></a></li>
		  		<li><a href="teacher/courseManage"><span>课程管理</span></a></li>
		   		<li class="has-sub"><a href="teacher/webSource/${course.cno }"><span>网络资源</span></a></li>
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
<div class="content_bg" >
	<div class="wrap">
		<div class="wrapper">
			<div class="panel-group" id="accordion">
				  <c:forEach items="${tasks }" var="task">
				  		<form action="teacher/updatetask?cno=${task.cno }&sctimes=${task.sctimes }" method="post">
							  <div class="panel panel-default">
							    <div class="panel-heading">
							      <h4 class="panel-title">
							        <a data-toggle="collapse" data-parent="#accordion" 
							          href="#collapse${task.sctimes }">
							          第${task.sctimes }次作业 
							        </a>
							        
							      </h4>
							    </div>
							    <div id="collapse${task.sctimes }" class="panel-collapse collapse">
							      <div class="panel-body" >
							      	<div style="width:30%;float:left;height:160px;">
							        	<p style="margin:0px auto 12px 10px;background:#D2E9FF;height:28px;">作业标题</p>
							        	<p style="margin:0px auto 12px 10px;background:#D2E9FF;height:28px;">截止时间</p>
							        	<p style="margin:15px auto auto 10px;background:#D2E9FF;height:60px;">作业内容</p>
							        	<input type="submit" value="修改" style="margin-left:10px;">
							        </div>
							        <div style="background:#D9FFFF;width:70%;float:right;">
							        	<input type="text" name="stitle" style="width:100%;height:28px;" value="${task.stitle }"><br/>
							        	<input type="text" name="stoptime" style="width:100%;height:28px;margin-top:14px" value="${task.stoptime }"><br/>
							        	<textarea  name="stcontent" style="width:100%;height:60px;margin-top:14px;">
							        		${task.stcontent }
							        	</textarea>
							        </div>
							        
							      </div>
							    </div>
							  </div>
						</form>
				  </c:forEach>
				<div class="panel panel-default">
				  <form method="post" action="teacher/addTask?cno=${cno}">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				      
				        <a data-toggle="collapse" data-parent="#accordion" 
				          href="#collapseOne" style="color:#F00;">
				          在这里添加作业
				        </a>
				        <input type="submit" value="添加" style="float:right;">
				      </h4>
				    </div>
				    <div id="collapseOne" class="panel-collapse collapse in">
				      <div class="panel-body" >				         
					      	<div style="width:30%;float:left;height:140px;">
					        	<p style="margin:0px auto 12px 10px;background:#D2E9FF;height:28px;">作业标题</p>
					        	<p style="margin:0px auto 12px 10px;background:#D2E9FF;height:28px;">截止时间</p>
					        	<p style="margin:0px auto auto 10px;background:#D2E9FF;height:60px;">作业内容</p>
					        	
					        </div>
					        <div style="background:#D9FFFF;width:70%;float:right;">
					        	<input type="text" name="stitle"    style="width:100%;height:28px;"><br/>
					        	<input type="text" name="stoptime"  style="width:100%;height:28px;margin-top:14px"  onfocus="HS_setDate(this)"><br/>
					        	<textarea          name="stcontent" style="width:100%;height:60px;margin-top:14px;"></textarea>			        	
					        </div>
					        <!-- <input type="submit" value="添加" style="float:right;margin:10px 0 0 0;width:100%"> -->
				         </div>
				       </div>
				     </form>
				 </div>
			</div>
		</div>
	</div>	
</div>
		

</body>
</html>