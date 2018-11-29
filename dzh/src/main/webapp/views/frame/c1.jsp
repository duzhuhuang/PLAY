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
	div{
	cursor: pointer;
	}
	</style>
<script>
function display(){
	var tar=document.getElementById("tar");
	tar.style="diplay:inline";
	var btn=document.getElementById("btn");
	btn.style="diplay:inline";
}
</script>
</head>
  
  <body onload="onload()">
  <% company p=(company)session.getAttribute("user"); %>
 
    
    <img src="<%=p.getLogoPath()%>" />
    <div onclick="display()"> <p>证书上传</p> </div>
     <form action="addlogo.do" method="post" enctype="multipart/form-data" >
    <input id="tar" name="file" type="file" style="display:none" />
    <button id="btn" type="submit" style="display:none">提交
    </button>
    </form>
    
    <table>
    <tr><td>企业:</td><td><%=p.getName() %></td></tr>
    <tr><td>地址:</td><td><%=p.getLocal() %></td></tr>
    <tr><td>联系人:</td><td><%=p.getLocal() %></td></tr>
    <tr><td>电话:</td><td><%=p.getLocal() %></td></tr>
    </table>
    <a href="c1.do">工程队人员管理</a>
    <form>
    </form>
  </body>
</html>
