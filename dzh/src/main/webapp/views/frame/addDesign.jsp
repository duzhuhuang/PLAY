<%@ page language="java" import="entiy.company" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <base href="<%=basePath%>">
<meta charset="UTF-8">
 <title>My JSP 'pesonal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	
	</style>
<script>

</script>
</head>
  
  <body onload="onload()">
  
   <form action="addDesign.do"  method="post"  enctype="multipart/form-data" >
方案名：<input name="name"  type="text"/><br/>
风格：<input name="style"  type="text"/><br/>
描述：<input name="word" type="text"/><br/>
造价：<input name="cost" value="0" type="number"/><br/>
面积：<input name="area" value="0" type="number"/><br/>
预览效果：<input name="files" type="file"/><br/>
<button type="submit">提交</button>
<input name="cid" value="<%=(company)session.getAttribute("user") %>" style="diplay:none">
</form>
  </body>
</html>
