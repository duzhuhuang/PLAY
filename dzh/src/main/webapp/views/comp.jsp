<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <style type="text/css">
	 #dibu{
	 position: relative;
     top:5000px;
    background-color: #4390b9;
     height: 45px;
	 }
	 </style>
  </head>
  
  <frameset rows="120,500" cols="*" scrolling="No" framespacing="0" frameborder="no" border="0"> 
	<frame src="views/frame/head.jsp" name="headmenu" id="mainFrame" title="mainFrame">
 <frameset rows="100*"  cols="350,*" scrolling="No"
	framespacing="0" frameborder="no" border="0"> 
<frame
	src="views/frame/left.jsp" name="leftmenu" id="mainFrame" title="mainFrame">
<frame src="views/frame/c1.jsp" name="main" scrolling="yes" noresize="noresize"
	id="rightFrame" title="rightFrame"></frameset></frameset>
<body>	<div id="dibu"></div></body>
</html>