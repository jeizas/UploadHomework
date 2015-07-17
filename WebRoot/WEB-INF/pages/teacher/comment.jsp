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
	
	<script type="text/javascript" src="<%=basePath%>/js/Calendar.js"></script>
	 
    <link rel="stylesheet"  href="<%=basePath%>ueditor/themes/default/css/ueditor.css">
    <script type="text/javascript"src="<%=basePath%>ueditor/ueditor.config.js"></script>
    <script type="text/javascript"src="<%=basePath%>ueditor/ueditor.all.js"></script>
    <script type="text/javascript"src="<%=basePath%>ueditor/ueditor.parse.js"></script>

<script type="text/javascript">
 	function judgeUploadFile(){
 		var d=document.getElementById("backfile").value;
 		if(!d){
 			var r = confirm("作业为空！保存默认值");
 			if(r==true){
 				document.modifyForm.submit();
 			}
 		}
 		else{
 			var r =  confirm("确定提交评语？");
 			if(r==true){
 				document.modifyForm.submit();	
	 		}
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
		 			<a href="#"><img src="images/logo.png"> </a>
				</div>
			  <div class="cssmenu">
			  <ul>
		   		<li><a href="teacher/homePage?id=${id}"><span>进入首页</span></a></li>
		  		<li><a href="teacher/courseManage"><span>课程管理</span></a></li>
		   		<li class="has-sub"><a href="teacher/webSource"><span>网络资源</span></a></li>
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
			<div style="height:500px;width:80%; ">
				<form  name="modifyForm" method="post" name ="modifyForm" action="teacher/comment?sno=${sno }&cno=${cno }&sctimes=${sctimes }" enctype="multipart/form-data" >
				  <table class="_commentTable">
					<tr>
						<td style="width:20%;height:40px;">学号</td>
						<td style="width:30%;">${student.sno }</td>
						<td style="width:20%;">班级</td>
						<td style="width:30%;">${student.sclass }班</td>
					</tr>
					<tr>
					   <td style="height:40px;">实验内容 </td>
					   <td >${task.stitle }</td>
					   <td>姓名</td>
					   <td>${student.sname }</td>
					</tr>
					<tr>
						<td >评语</td>
						<td colspan="3">
							<textarea id="myEditor" name="comremark" style="margin-top:0px;width:99.7%;height:45%;">								 
								${comments.comremark }
								${image}
							</textarea>
							<script type="text/javascript">
								var us = UE.getEditor("myEditor");
								us.addListener("ready",function(){
								this.focus();
								});
							</script>
						</td>
						
					</tr>
					<tr>
						<td style="height:40px;">反馈作业</td>
						<td >
							<input type="file" name="attach"  id="backfile"style="width:100%;height:100%;"> </td>
						<td >是否允许看</td>
						<td >
							<!-- <input type="file" name="image" >  -->
								<input type="radio" value="checked" name="allowlook" ${sc.allowlook }/>允许
								<input type="radio" value="NULL" name="allowlook"  />不允许
						</td>
					</tr>
					<tr >
						<td style="height:40px;">批阅时间</td>
						<td >
							<input type="text" onfocus="HS_setDate(this)" value="${sqltime }" name="time" style="width:100%;height:100%;"> </td>
						<td >成绩</td>
						<td > 
							 <select name="comscore" style="width:100%;height:100%;">
								 <option value="${ comments.somscore }">${ comments.somscore }</option>	
								 <option value="A+">A+</option>	
								 <option value="A">A</option>
								 <option value="A-">A-</option>
								 <option value="B+">B+</option>
								 <option value="B">B</option>
								 <option value="B-">B-</option>
								 <option value="C+">C+</option>
								 <option value="C">C</option>
								 <option value="C-">C-</option>	
								 <option value="D+">D+</option>
								 <option value="D">D</option>
								 <option value="D-">D-</option>   
							  </select>
						</td>
					</tr>
					<tr >
						<td colspan="2" style="height:40px;">
							<input type="button" value="保存" onclick="judgeUploadFile()" style="width:100%;height:100%;"/>
						 </td>
						 <td colspan="2">
						 	<input type="button" name="returngo" value="返回上一页" onclick="location.href='javascript:history.go(-1);'" style="width:100%;height:100%;">
						 </td>
					</tr>
				</table>
			</form>
				
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