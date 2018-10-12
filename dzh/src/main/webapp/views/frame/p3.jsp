<%@ page language="java" import="entiy.person" contentType="text/html; charset=UTF-8"
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
	#1{
	display:none;
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
  <% person u=(person)session.getAttribute("user"); %>
    <form  action="updatePersonInfo.do" method="get" onsubmit="return check(this)">
   
   <div id="username">用户名：<%=u.getName() %></div>
     
   <div id="f_phone"  style="display:none">联系电话：<input  name="phone"  type="text" value="<%=u.getPhone()%>"/></div>
   <div id="phone">联系电话：<%=u.getPhone() %><button onclick="phonechange()" type="button"> 修改</button></div>
 	<div id="f_sex" style="display:none">性别：<input  name="sex"  type="text" value="<%=u.getSex()%>"/></div>
 	<div id="sex">性别：<%=u.getSex() %><button onclick="usernamechange()" type="button"> 修改</button></div>
  <div id="f_pwd"  style="display:none">原密码：<input  id="password"  type="password" onblur="pcheck()"/><br/>新密码：<input id="newp" name="password" type="password" value="<%=u.getPassword()%>"/></div>
 <div id="cpwd" > <button type="button" onclick="pwdchange()">修改密码</button></div>
 
  <div  style="display:none"> <input id="01" value="<%=u.getPassword() %>"/></div>
 
 <div id="btn" style="display:none"> <button  type="submit" >提交</button></div>
    </form>
  </body>
</html>