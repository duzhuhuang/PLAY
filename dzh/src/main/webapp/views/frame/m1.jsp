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

var submit=true;
function usernamechange(){
var u1=document.getElementById("f_sex");
var u2=document.getElementById("sex");
var b=document.getElementById("btn");
u1.style.display="block";
u2.style.display="none";
b.style.display="block";
}
function phonechange(){
var u1=document.getElementById("f_phone");
var u2=document.getElementById("phone");
var b=document.getElementById("btn");
u1.style.display="block";
u2.style.display="none";
b.style.display="block";
}
function pwdchange(){
var u1=document.getElementById("f_pwd");
var u2=document.getElementById("cpwd");
var b=document.getElementById("btn");
u1.style.display="block";
u2.style.display="none";
b.style.display="block";
submit=false;
var newp=document.getElementById("newp").value;
newp="";
}

function check(){
	var pwd=document.getElementById("password").value;
	var newp=document.getElementById("newp").value;
	var p=document.getElementById("01").value;
if(p==pwd&&newp.length>=6)
	submit=true;
	if(!submit)
	alert("密码不对  ");
		return submit;
}
</script>
</head>
  
  <body onload="onload()">
  <table>
  <%ArrayList<design> list=(ArrayList<design>)request.getAttribute("list"); %>
  <tr><td>发布者ID</td><td>查看</td><td>审查</td></tr>
  <%for(design d:list) {%>
  <tr><td><%=d.getCid() %></td><td><a href="designInfo.do?id=<%=d.getId()%>&userType=person">查看</a></td>
  <td><a href="m1_2.do?id=<%=d.getId()%>&allow=false">不通过</a>|
  <a href="m1_2.do?id=<%=d.getId()%>&allow=true">通过</a></td></tr>
  <%} %>
  
  </table>
  </body>
</html>
