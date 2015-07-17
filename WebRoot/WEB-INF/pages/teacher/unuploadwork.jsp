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
	<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath%>/js/jquery2.0.0.min.js"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function showcheck(){
		if(document.getElementById("ss").checked){
    		/* modifyForm.submit(); */
    		alert("功能还没添加，在左侧全部设置...");
		}
	}
	function uploadSign(){
		if(document.getElementById("sign").value==""){
			alert("不能上传空签名！");
		}
		else{
			document.imges.sbumit();
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
		   				<li><a href="teacher/homePage?id=${id }"><span>进入首页</span></a></li>
		  				<li ><a href="teacher/courseManage"><span>课程管理</span></a></li>
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

<div class="content_bg">
	<div class="wrap">
		<div class="wrapper">
			<div >
				<div class="content_left">			    			    
					  <div class="panel panel-default" style="height:180px;">
					   		<div class="panel-heading" >
					      		<h4 class="panel-title" >					       		
					        		欢迎进入${course.cname }课程					       		
					      		</h4>
					    	</div>
					   		<div id="collapseOne" class="panel-collapse collapse in">
					    		<div class="panel-body">
					        		<div style="font-size:14px;">
				    					<p style="margin:20px auto  5px 25px">帐号：${teacher.tno }</p>
				    					<p style="margin:auto auto 10px 25px">姓名：${teacher.tname }</p>
				    					<a href="loginout"></a><input type="button" value="注销"  style="margin-right:2%;float:right;width:100px;"/></a>
					        		</div>
					      		</div>
					    	</div>
					  </div>
					  <div class="panel-group" id="accordion" style="margin-top:0;">
					  	<div class="panel panel-default">
					    	<div class="panel-heading">
					     		<h4 class="panel-title">
					        		<a data-toggle="collapse" data-parent="#accordion" 
					            	href="#collapseTwo">
					            	 按班级次数查询
					       			</a>
					      		</h4>
					    	</div>
					    	<div id="collapseTwo" class="panel-collapse collapse">
					      	  <div class="panel-body">
					       		<div>
					       			<form action="teacher/select/${course.cno} " method="post">
					       				<span>班级</span>
					       				<select name="sclass" style="width:85%;">
					       					<c:forEach items="${ sclass}" var="c">
					       						<option value="${c}">${c}</option>
					       				 	</c:forEach>
					       				</select><br/> 
					       				<span>次数</span>
					       				<select name="sctimes" style="width:85%;margin:10px auto;">
					       					<c:forEach items="${ tasklist}" var="task">
												<option value="${task.sctimes }">第${task.sctimes }次&nbsp;&nbsp;&nbsp;${task.stitle } </option>
											</c:forEach>
					       				</select><br/>
					       				<input type="submit" value="确定" style="margin-right:2%;float:right;width:100px;"/>
					       			</form>
					       		</div>
					      	  </div>
					    	</div>
					 	</div>
					 	<div class="panel panel-default">
					        <div class="panel-heading">
					      		<h4 class="panel-title">
					        		<a data-toggle="collapse" data-parent="#accordion" 
					          			href="#collapseThree">
					          			按学生学号查询
					        		</a>
					      		</h4>
					    	</div>
					    	<div id="collapseThree" class="panel-collapse collapse">
					      		<div class="panel-body">
					        		<form action="teacher/selectBysno/${course.cno}"  method="post">
					        			<span>学号</span> 
					        			<input type="text" name="sno" style="width:85%;magin-top:10px;"><br/>
					       	 			<input type="submit" value="确定" style="margin-right:2%;float:right;width:100px;margin-top:10px;"/>
					        		</form>
					      		</div>
					    	</div>
					 	</div>
					 	<div class="panel panel-default">
					        <div class="panel-heading">
					      		<h4 class="panel-title">
					        		<a data-toggle="collapse" data-parent="#accordion" 
					          			href="#collapseFour">
					          			未交作业学生单
					        		</a>
					      		</h4>
					    	</div>
					    	<div id="collapseFour" class="panel-collapse collapse">
					      		<div class="panel-body">
					        	<div>
					       			<form action="teacher/unupload/${course.cno}" method="post">
					       				<span>班级</span>
					       				<select name="sclass" style="width:85%;">
					       					<c:forEach items="${ sclass}" var="c">
					       						<option value="${c}">${c}班</option>
					       				 	</c:forEach>
					       				</select><br/>
					       				<span>次数</span>
					       				<select name="sctimes" style="width:85%;margin:10px auto;">
					       					<c:forEach items="${ tasklist}" var="task">
												<option value="${task.sctimes }">第${task.sctimes }次&nbsp;&nbsp;&nbsp;${task.stitle } </option>
											</c:forEach>
					       				</select><br/>
					       				<input type="submit" value="查询" style="margin-right:2%;float:right;width:100px;"/>
					       			</form>
					       		</div>
					      		</div>
					    	</div>
					 	</div>
					 	
					 	<div class="panel panel-default">
					        <div class="panel-heading">
					      		<h4 class="panel-title">
					        		<a data-toggle="collapse" data-parent="#accordion" 
					          			href="#collapseFive">
					          			修&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;签&nbsp;&nbsp;&nbsp;&nbsp;名
					        		</a>
					      		</h4>
					    	</div>
					    	<div id="collapseFive" class="panel-collapse collapse">
					      		<div class="panel-body">
					        		<form action="teacher/changeSign/${course.cno}" name="images" enctype="multipart/form-data" method="post">
					        			<span>上传签名</span> 
					        			<input type="file"  id="sign" name="attach" style="width:85%;magin-top:10px;"><br/>
					       	 			<input type="button" value="确定"  onclick="uploadSign()"  style="margin-right:2%;float:right;width:100px;"/>
					        		</form>
					      		</div>
					    	</div>
					 	</div>
					 	
					 	<div class="panel panel-default">
					        <div class="panel-heading">
					      		<h4 class="panel-title">
					        		<a href="teacher/setTask?cno=${course.cno }">
					          			管理&nbsp;作&nbsp;业&nbsp;次数
					        		</a>
					      		</h4>
					    	</div>
					 	</div>
				    </div>
				</div>
				
				<div class="content_right" >
					<div style="height:125px;width:685px; margin:5px;">
						<!-- 图片 -->
						<img src="./images/upload-bg.jpg"style="border:4px solid #FFF" >
					</div>
					<div  style="margin:5px;height:415px;font-size:14;width:100%;/* border:1px solid #53A3C7; */">
             			<table class="table table-hover" id="table_comment" >
							<caption>第${sctimes }次未交作业学生名单</caption>
							<thead>
							 	<tr style="text-align:center;">
									<th style="width: 15%;"><strong>学号</strong></th>
									<th style="width: 15%;"><strong>姓名</strong></th>
									<th style="width: 40%;"><strong>专业</strong></th>
									<th style="width: 20%;"><strong>年级</strong></th>
									<th style="width: 10%;"><strong>班级</strong></th>
								</tr>	
							</thead>
								<tbody>
								  <c:forEach   items="${stulist}" var="s">
									<tr style="overflow:hidden;text-overflow:ellipsis;">
										<th style="width: 15%;">${s.sno }  </th>
										<th style="width: 15%;">${s.sname }</th>
										<th style="width: 40%;">${s.smajor }</th>
										<th style="width: 20%;">${s.sgrade }</th>
										<th style="width: 10%;">${s.sclass }班</th>
									</tr>
								  </c:forEach>									
								</tbody>					
  	          			</table>
         			</div>
         			
         			<!--  分页设置 -->
        			<div  style=" width: 685px; border-bottom:2px dashed #53A3C7;" >
       					<div class="left"   style="width: 25%; float:left;margin-left:10px">共${scNum}条记录</div>
       	    				<div class="right"  style=" folat:right">
        						<c:if test="${currentPage == 1}">
            					<span class="disabled"> 前一页</span>        
        						</c:if>
				        		<c:if test="${currentPage != 1}">
				            		<a href="teacher/lookHomework/{cno}?page=${currentPage-1}"> << 前一页</a>
				       			</c:if>
				        		<c:if test="${currentPage == 1}">
				        			<span class="current">1</span>
				       			</c:if>
				        		<c:if test="${currentPage != 1}">
				        			<a href="teacher/lookHomework/{cno}?page=1">1</a>
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
				            	 	<a href="teacher/lookHomework/{cno}?page=<%=i+1%>"><%=i+1%></a>
				        		</c:if>
				        		<%} %>
				        
				        		<c:if test="${currentPage == pageTimes}">
				           		 	<span class="disabled">后一页 </span>        
				        		</c:if>
				        		<c:if test="${currentPage != pageTimes}">
				        			<a href="teacher/lookHomework/{cno}?page=${currentPage+1}">后一页  >></a>
				        		</c:if>
				        	 </div>
				        </div>
				     </div> 
         			
				</div>
				<div class="clear"></div>
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
