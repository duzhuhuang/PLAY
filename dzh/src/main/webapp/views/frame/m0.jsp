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
	</style>
<script>


</script>
</head>
  
  <body onload="onload()">

<% List<company> list=(List<company>)request.getAttribute("list"); %>
  <table>
 
 <% for(company s:list) {%>
 <tr><td><%=s.getId() %></td><td><%=s.getName() %></td><td><a href="m0_1.do?id=<%=s.getId() %>">查看</a></td></tr>
 <%} %>
  </table>
  
  </body>
</html>
