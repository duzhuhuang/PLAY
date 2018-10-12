<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" 
pageEncoding="utf-8"%>
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
	padding-top: 28px;
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
.form{
	width: 768px;
	height: 800px;
	background-color: white;
	position: absolute;
	top: 20%;
	right: 20%;
}
.lgD {
	width: 86%;
	margin: 0px auto;
	position: relative;
	margin-bottom: 20px;
}

 .lgD img.img1 {
	position: absolute;
	top: 12px;
	left: 8px;
}

 .lgD input {
width: 50%;
	height: 42px;
	text-indent: 2.5rem;
}
.logC {
	width: 86%;
	margin: 0px auto;
	margin-top: 30px;
}

 .logC button {
	width: 50%;
	height: 45px;
	background-color: #ee7700;
	border: none;
	color: white;
	font-size: 18px;
}


    </style>

	
	
	
<script>
var xmlhttp;
var submit;
function pwdlen(){
	var pwd=document.getElementById("password").value;
	var pdiv=document.getElementById("h_pwd");
	if(pwd.length<6||pwd.length>18)
		{
		submit=submit*0;
		pdiv.innerHTML="密码长度应为6-18位";
		}
	else{
		submit=submit*1;
		pdiv.innerHTML="";
	}
}
function checkpswd(){
	var pwd=document.getElementById("password").value;
	var rpwd=document.getElementById("checkpwd").value;
	var rpdiv=document.getElementById("h_cpwd");
	if(pwd!=rpwd)
		{
			submit=0;
			rpdiv.innerHTML="两次密码不一致";
		}
	else
		{
		submit=submit*1;
		rpdiv.innerHTML="";
		}
	
}

function createXMLRequest(){
return new XMLHttpRequest();
}
function stateChange(){

if (xmlhttp.readyState==4&&xmlhttp.status==200)
  {
 var data=xmlhttp.responseText;
 if(data=="1")
 {
 h_username.innerHTML="用户名已被使用";
 submit=0;
 }
 else{
 submit=1;
 h_username.innerHTML="  ";
 
 }
  }

}
function ServerCheck(){
var username=document.getElementById("user_name").value;
var h_username=document.getElementById("h_username");
if(username==""){
h_username.innerHTML="用户名不能为空";
submit=0;
}
else{
h_username.innerHTML="";
xmlhttp=createXMLRequest();
var url="/dzh/personRegist/check.do?name="+username;
xmlhttp.onreadystatechange=stateChange;
xmlhttp.open("get", url, true);
xmlhttp.send();}
}
function checkphone(){

var cphone=document.getElementById("phone").value;


var hp=document.getElementById("h_phone");

 if(!(/^1[34578]\d{9}$/.test(cphone))){ 

hp.innerHTML="格式不正确";
submit=0;
}else{hp.innerHTML="";
submit=submit*1;
}

}
function submitcheck(){
ServerCheck();
checkphone();
pwdlen();
checkpswd();

if(submit==1)
return 1;
else
return false;
}
</script>

</head>
  
  
<body>

	<div class="head">
		<div class="headL">
			<img class="headLogo" src="img/logo.png"/>
		</div>
		<div class="headR">
			<span style="color:#FFF"> <a href="index.jsp" target="_top">返回首页</a></span>||<a href="views/regist2.jsp">进入企业注册</a>
		</div>
	</div>
	<div class="form">
	 <form action="/dzh/personRegist/add.do" method="get" onsubmit="return submitcheck(this)">
	<div class="lgD">&nbsp;用户名
     <input id="user_name" name="name" type="text"  onblur="ServerCheck()" />
  <div id="h_username" style="display: inline"></div>
  
   </div>
   <div class="lgD">
     &nbsp;密&nbsp;码  <input id="password" name="password" type="password" onblur="pwdlen()"/> 
   <div id="h_pwd" style="display: inline"></div>
 
   </div>
   <div class="lgD">
       确认密码 <input id="checkpwd" type="password" onblur="checkpswd()"/>
    <div id="h_cpwd" style="display: inline"></div>
 
   </div>
   <div class="lgD">
    联系电话 <input id="phone" name="phone"  type="text" onblur="checkphone()"/>
       <div id="h_phone" style="display: inline"></div>
     
   </div>
   <div class="logC">
     &nbsp; &nbsp; &nbsp; <button type="submit" >注册</button>
     
 </div>
  
   </form>
   </div>
</body>
</html>
 <!--<form action="regist" method="post">
    <input id="user_name" type="text"  />
    <input id="password" type="password" />
    <input id="check_pwd" type="password" />
    <input id="phone" type="text" />
    <input id="address" type="text"/>
    <input type="submit" value="注册" />
     <select id="province" >
    <option value="黑龙江">
    </select>
   用户名：  <input id="user_name" name="user_name" type="text" onblur="ServerCheck()" />
     <div id="h_username" style="display: inline"></div>
    <br/>     密码：<input id="password" name="password" type="password"/>
   <div id="h_pwd" style="display: inline"></div>
       <br/> 确认密码：<input id="checkpwd" type="password"/>
    <div id="h_cpwd" style="display: inline"></div>
   <br/>  联系电话：<input id="phone" name="phone" type="text"/>
       <div id="h_phone" style="display: inline"></div><br/>
     <button type="submit"  >注册</button>
    </form>-->
