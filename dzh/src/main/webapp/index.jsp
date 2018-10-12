<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
.head .headR {
	width: 400px;
	height: 100%;
	display: inline-block;
	float: right;
	text-align: right;
	margin-right: 120px;
	font-size: 30px;
}
.body{
background: #551111;
}
.body .word {
background:#111155;
color:yellow;
font-size:25px;
font-weight:bold;
display:block;
text-align: center;
}
.body .move{
width:9%;
margin-bottom: 25%;


}
.body .i{
width:80%;
position:relative;
left:0;
height:100%;
}
.body .im{
background:#115511;
position:relative;
left:17%;
width:66%;
height:450px;

}
.dibu{
background:#111155;
height: 50px;
}
</style>
<script type="text/javascript">
var i=3;
function lef(){
	var img=document.getElementById("mid");
	var r=document.getElementById("right");
	var l=document.getElementById("left");
	
	if(i==3)
		img.src="img/02.jpg";
	if(i==2)
		{
		img.src="img/01.jpg";
		
		}
	if(i==1)
		{
		i++;
		}
	if(i==5)
		{
		img.src="img/04.jpg";
		}
	if(i==4)
		img.src="img/03.jpg";
	i--;
	
}
function rig(){
	var img=document.getElementById("mid");
	if(i==1)
		{
		img.src="img/02.jpg";
		}
	if(i==2)
	{
	img.src="img/03.jpg";
	}
	if(i==3)
	{
	img.src="img/04.jpg";
	}
	if(i==4)
	{
	img.src="img/05.jpg";
	}
	if(i==5)
		{
		i--;
		}
	i++;
}
</script>
</head>
<body>
<div class="all">
<div class="head">
		<div class="headL">
			<img class="headLogo" src="img/logo.png"/>
		</div>
		<div class="headR">
			<span style="color:#FFF">
			
			<a href="views/login.jsp">登录</a>||</span> <a href="views/regist.jsp" target="_top">注册</a>
		</div>
	</div>
	<div class="body">
	<div class="word">效果展示</div>
	<div class="im">
    <img id="left"  src="img/left.jpg"  class="move" onclick="lef()"/>
     <img id="mid"  class="i" src="img/03.jpg"/>
    <img id="right" class="move" src="img/right.jpg" onclick="rig()"/>
	</div>
	</div>
</div>
<div class="dibu"></div>
   
	
</body>
</html>