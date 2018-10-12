<%@ page language="java" import="java.util.*" import="comp.bean.workerT" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'designList.jsp' starting page</title>
   
 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
  
 <body onload="">
  

 
<table border="1" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<th>委托人</th>
			<th>工程类别</th>
			<th>面积</th>
			<th>预算</th>
			<th>地址</th>
			<th></th>
			
		</tr>
		
	</table>
  <!-- 显示所有装修需求 -->
	
	
  </body>
</html>
