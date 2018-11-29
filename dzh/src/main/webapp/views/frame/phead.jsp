<%@ page language="java" import="java.util.*" import="entiy.person" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pesonal.jsp' starting page</title>
    <style type="text/css">
  #bg {
	width: 100%;
	overflow-x: hidden;
}

.head {
	width: 100%;
	height: 100px;
	background-color: #4390b9;
}

.head .headL {
	width: 440px;
	height: 100%;
	text-align: center;
	float: left;
	display: inline-block;
}

.head .headL img.headLogo {
	padding-top: 22px;
	height: 80%;
}

.head .headR {
	width: 400px;
	height: 100%;
	display: inline-block;
	float: right;
	text-align: right;
	margin-right: 120px;
}

.head .headR .p1 {
	padding-top: 30px;
	font-size: 18px;
	color: white;
	display: inline-block;
	cursor: pointer;
}

.head .headR .p2 {
	
}

.head .headR .p2 a {
	font-size: 14px;
	padding-top: 12px;
	display: inline-block;
	color: white;
	cursor: pointer;
}
    </style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  
<body>
	  <% person p=(person)session.getAttribute("user"); %>
	<div class="head">
		<div class="headL">
			<a href="index.do" target="_top"><img class="headLogo" src="img/logo.png"/></a>
		</div>
		<div class="headR">
			<span style="color:#FFF">欢迎：<%=p.getName()%>
			
			</span> <a href="logoff.do" target="_top">【退出】</a>
		</div>
	</div>
</body>
</html>
