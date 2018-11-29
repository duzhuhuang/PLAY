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
 else{
var form =document.getElementById("form");
form.submit();
 }
 }

}


function submit1(){

var username=document.getElementById("user_name").value;
var pwd=document.getElementById("password").value;

xmlhttp=createXMLRequest();
var url="/dzh/mtest.do?name="+username+"&password="+pwd;
xmlhttp.onreadystatechange=stateChange;
xmlhttp.open("get", url, true);
xmlhttp.send();
}

</script>
</head>
<body>
<div class="head">
		
		
	</div>
	<div id="form1" class="form">
	<form id="form" action="mLogin.do" method="get">
	<div class="lgD">
   <img class="img1" src="./img/logName.png" /><input   id="user_name"  name="name" type="text"/>&nbsp;输入账号<br/>
   </div>
   <div class="lgD">
  <img class="img1" src="img/logPwd.png" />  <input  id="password" name="password" type="password"/>&nbsp;输入密码<br/>
   </div>
   <div class="logC">
    <button type="button" onclick="submit1()" >登录</button>
 </div>
   </form>
   </div>
   
</body>
</html>