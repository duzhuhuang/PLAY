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

<% List<String> list=(List<String>)request.getAttribute("list"); %>
<%Integer p=(Integer)request.getAttribute("page") ;%>
  <table>
 <tr><td>日志 第<%=p %>页</td></tr>
 <% for(String s:list) {%>
 <tr><td><%=s %></td></tr>
 <%} %>
  </table>
  <form action="m4.do">
  
  <a href="m4.do?page=<%= p.intValue()==1?1:p-1 %>">上一页</a><input name="page"/><a href="m4.do?page=<%=p+1 %>"> 下一页</a><button>跳转</button>
</form>
  </body>
</html>
