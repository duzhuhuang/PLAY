<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>Insert title here</title>
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
	font-size: 28px;
	color:#FFF;
}




.form{
	width: 768px;
	height: 408px;
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
width: 70%;
	height: 42px;
	text-indent: 2.5rem;
}
.logC {
	width: 86%;
	margin: 0px auto;
	margin-top: 30px;
}

 .logC button {
	width: 70%;
	height: 45px;
	background-color: #ee7700;
	border: none;
	color: white;
	font-size: 18px;
}
#dibu{
position: relative;
top:500px;
background-color: #4390b9;
height: 45px;

} 

    </style>
    <script>
    window.onload=function(){
    	alert("用户名或密码错误");
    }
var xmlhttp;
function createXMLRequest(){
return new XMLHttpRequest();
}
function stateChange(){

if (xmlhttp.readyState==4&&xmlhttp.status==200)
  {
 var data=xmlhttp.responseText;
 if(data=="erro"){
 alert("用户名或密码错误");
 }
 if(data=="true")
 window.location.assign("/index2.jsp");
  
 }

}


function submit1(){

var username=document.getElementById("user_name").value;
var pwd=document.getElementById("password").value;

xmlhttp=createXMLRequest();
var url="/login.do?user_name="+username+"&"+"password="+pwd;
xmlhttp.onreadystatechange=stateChange;
xmlhttp.open("get", url, true);
xmlhttp.send();
}

function switch1(){
var head=document.getElementById("login1");
var form1=document.getElementById("form1");
var head2=document.getElementById("login2");
var form2=document.getElementById("form2");
head.style.display="none";
head2.style.display="block";
form1.style.display="none";
form2.style.display="block";

}
function switch2(){
var head=document.getElementById("login1");
var form1=document.getElementById("form1");
var head2=document.getElementById("login2");
var form2=document.getElementById("form2");
head.style.display="block";
head2.style.display="none";
form1.style.display="block";
form2.style.display="none";

}
</script>
</head>
<body>
<div class="head">
		<div class="headL">
			<img class="headLogo" src="./img/logo.png"/>
		</div>
		<div id="login1" class="headR">
			<span style="color:#FFF"> 【个人登录】</span>||<a href="/dzh/index.jsp">返回</a>
		</div>
		<div id="login2" class="headR" style="display:none">
			<span style="color:#FFF"> 【企业登录】</span>||<a href="/dzh/index.jsp">返回</a>
		</div>
		
	</div>
	<div id="form1" class="form">
	<form action="personLogin.do" method="get">
	<div class="lgD">
   <img class="img1" src="./img/logName.png" /><input   id="user_name"  name="name" type="text"/>&nbsp;用户名<br/>
   </div>
   <div class="lgD">
  <img class="img1" src="img/logPwd.png" />  <input  id="password" name="password" type="password"/>&nbsp;输入密码<br/>
   </div>
   <div class="logC">
    <button type="submit" >登录</button>
 </div><div class="logC">
    <button type="button" onclick="switch1()">切换至企业登录</button>
 </div>
   </form>
   </div>
   <div id="form2" class="form" style="display:none">
	<form action="compLogin.do" method="get">
	<div class="lgD">
   <img class="img1" src="./img/logName.png" /><input   id="user_name"  name="name" type="text"/>&nbsp;企业ID<br/>
   </div>
   <div class="lgD">
  <img class="img1" src="./img/logPwd.png" />  <input  id="password" name="password" type="password"/>&nbsp;输入密码<br/>
   </div>
   <div class="logC">
    <button type="submit" >登录</button>
 </div><div class="logC">
    <button type="button" onclick="switch2()">切换至个人登录</button>
 </div>
   </form>
   </div>
   <div id="dibu">
   </div>
</body>
</html>