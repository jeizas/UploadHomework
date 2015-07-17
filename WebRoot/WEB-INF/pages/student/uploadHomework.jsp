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
    <title>学生在线上传作业</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css" media="all" />
	

	
<script type="text/javascript">
 	function showMessage(){
 		var d=document.getElementById("scfile").value;
 		var c=document.getElementById("sctimes").value;
 		if(!d){
 			alert("作业不能为空！请重新上传");
 			document.getElementById("scfile").select();
 			return false;
 		}
 		else{
 			alert("作业名:"+d+"\n作业次:"+c+"\n确认要上传吗？");
 			document.modifyForm.submit();
	 		
	 	}
 	}
	function judgeFile(target){
		var name=target.value;
        var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
        if(fileName !="doc" && fileName !="docx"){
          alert("请选择文件格式文件上传(doc和docx)！");
            target.value="";
            return
        }
	}

</script>
<script type="text/javascript">
	function showTask(){
			var tasks = document.getElementById("tasks").value;
			alert(tasks);
			return false;
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
		   				<li><a href="student/homePage?id=${id}"><span>进入首页</span></a></li>
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
			<div >
				<div class="content_left">
					<div style="background:url(./images/uploadbg2.jpg);height:215px;width:92%;border:5px solid #fff;margin:10px">
						<p style="margin-bottom:25px;text-align:center;font-size:22;color:#53A3C7;"><u>欢迎进入${course.cname }课程</u></p>
						<p>专业：${student.smajor}</p>
						<p>班级：${student.sclass }</p>
						<p>学号：${student.sno }</p>
						<p>姓名：${student.sname }</p>
						<a href="logout"><input type="button" id="" value="注销" style="margin:5px 10px 7px auto;float:right;background:#53A3C7;width:100px;"/></a>
					</div>
					<div style="background:url(./images/uploadbg4.jpg);height:250px;width:92%;border:5px solid #FFF;margin:10px 10px 20px 10px 	">
						<p style="margin-bottom:15px;text-align:center;font-size:22;color:#53A3C7"><u>上传作业</u></p>
						
						
						<form id="uploadHome" name="modifyForm" method="post" action="student/${cno }/upfile" enctype="multipart/form-data" style="font-size:18" >
							<span class="left_sp">选择作业</span><br/>
							<input class="left_ip" type="file" id="scfile" name="attach" onchange="judgeFile(this);"/><br/>
							<span class="left_sp">作业次数</span>	
							<input type="button" onclick="showTask();" value="作业内容" style="float:right;margin-right:15px;" >
							<br/>
							<select class="left_ip" id="sctimes"  name="times"> 
								<c:forEach items="${ tasklist}" var="task">
									<option value="${task.sctimes }">第${task.sctimes }次&nbsp;&nbsp;&nbsp;${task.stitle } </option>
								</c:forEach>
							</select><br/>
							<input type="button" value="提交" onclick="showMessage()"  style="margin:10px 10px 10px auto;float:right;background:#53A3C7;width:100px;"/><br/>
							<span style="color:#f00;font-text:10;">${error }</span>
						</form>
						
					</div>	
					<div style="display:none;">
					<textarea id="tasks">						
						<c:forEach items="${tasklist }" var="t">
							第${t.sctimes }次的作业：${t.stcontent }
						</c:forEach>	
					</textarea>		
					</div>
				</div>
				
				<div class="content_right">
					<div style="height:125px;width:100%; margin:5px;">
						<!-- 图片 -->
						<img src="./images/upload-bg.jpg"style="border:4px solid #FFF;width:98%;" >
					</div>
					<div  style="margin:5px;height:415px;font-size:18; /* border:1px solid #53A3C7; */">
             			<table class="tables"style="width:100%; margin-top:8px; table-layout:fixed;" >
							<tr >
								<td style="width: 15%;"><strong>学号</strong></td>
								<td style="width: 15%;"><strong>课程</strong></td>
								<td style="width: 15%;"><strong>次第</strong></td>
								<td style="width: 40%;"><strong>作业</strong></td>
								<td style="width: 15%;"><strong>查看评语</strong></td>
							</tr>						
							<!-- 此处13行一个分页 -->
			     			<c:forEach   items="${sclist}" var="s">
			         			<tr>
					   				<td>${s.sno}</td>
					   				<td>${s.cno }</td>
					   				<td >${s.sctimes }</td>
					   				<td><a href="teacher/${s.sno}/${s.scfile}/download">${s.scfile }</a> </td>
					   				<td><a href="student/${s.sno}/${s.cno }/${s.sctimes }/showComment">查看</a></td>
				       			</tr>
				   			</c:forEach>
  	          			</table>
         			</div>
         			
         			<!--  分页设置 -->
        			<div  style=" width: 100%; border-bottom:2px dashed #53A3C7;" >
       					<div class="left"   style="width: 25%; float:left;margin-left:10px">共${scNum}条记录</div>
       	    				<div class="right"  style=" folat:right">
        						<c:if test="${currentPage == 1}">
            					<span class="disabled"> 前一页</span>        
        						</c:if>
				        		<c:if test="${currentPage != 1}">
				            		<a href="student/uploadHomework/${course.cno }?page=${currentPage-1}"> << 前一页</a>
				       			</c:if>
				        		<c:if test="${currentPage == 1}">
				        			<span class="current">1</span>
				       			</c:if>
				        		<c:if test="${currentPage != 1}">
				        			<a href="student/uploadHomework/${course.cno }?page=1">1</a>
				        		</c:if>
				        		<%
				               	 	int pageTimes =(Integer)request.getAttribute("pageTimes");
				                	for(int i=1;i<pageTimes;i++) {
				                  	  request.setAttribute("page", i+1);
				       	 		%>            
				        		<c:if test="${currentPage == page}">
				            		<span class="current"><%=i+1%></span>       
				        		</c:if>
				        		<c:if test="${currentPage != page}">
				            	 	<a href="student/uploadHomework/${course.cno }?page=<%=i+1%>"><%=i+1%></a>
				        		</c:if>
				        		<%} %>
				        
				        		<c:if test="${currentPage == pageTimes}">
				           		 	<span class="disabled">后一页 </span>        
				        		</c:if>
				        		<c:if test="${currentPage != pageTimes}">
				        			<a href="student/uploadHomework/${course.cno }?page=${currentPage+1}">后一页  >></a>
				        		</c:if>
				        	 </div>
				        </div>
				     </div> 
         			
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
