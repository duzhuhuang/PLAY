<%@ page language="java" import="entiy.*" import="java.util.*" contentType="text/html; charset=UTF-8"
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
	
	table, td, th
  {
  border:1px solid green;
  
  }
  table{
  width:80%;
  }
	td{
	width:20%;
	}
	div{border: 1px solid;
		border-color: black;
		display: inline-block;
		width: 200px;
		
	}
	</style>
<script>


</script>
</head>
  
  <body onload="onload()">

<% List<worker> list=(List<worker>)request.getAttribute("workers"); 
	company c=(company)request.getAttribute("COMP");%>
  <table>
    <tr><td>企业:</td><td><%=c.getName() %></td></tr>
    <tr><td>地址:</td><td><%=c.getLocal() %></td></tr>
    <tr><td>联系人:</td><td><%=c.getLocal() %></td></tr>
    <tr><td>电话:</td><td><%=c.getLocal() %></td></tr>
    </table>
 <% for(worker w:list) {%>
   <div><img src="<%=w.getPhoto() %>" height="200px" width="180px"/>
   <p>name:<%=w.getName() %></p>
   <p>job:<%=w.getJob() %></p>
   <a href="c1_1_d.do?id=<%=w.getId() %>">删除</a>
   </div>
    <%} %>

  
  </body>
</html>
