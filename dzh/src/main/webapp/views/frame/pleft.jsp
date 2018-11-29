<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <style type="text/css">
    .container {
	width: 245px;
	height: 90%;
	margin: auto;
	border-style: solid;
	border-width:0px;
	border-top-width: 0;
  border-right-width: 3px;
  border-bottom-width: 0;
  border-left-width: 0px;
  border-color:00008B;
	

	position: absolute;
	left :100px;
	
}
.leftsidebar_box {
   
	width: 240px;
	height: 100%;

}

.leftsidebar_box dt {
	background-color: #00BBFA;
	color: #333;
	font-size: 14px;
	position: relative;
	line-height: 44px;
	cursor: pointer;
	border-bottom: 1px solid #dedede;
	border-right: 1px solid #dedede;
	padding-left: 40px;
}








.leftsidebar_box .line {
	background-color: #f9f9f9;
	color: #333;
	font-size: 14px;
	position: relative;
	line-height: 44px;
	cursor: pointer;
	border-bottom: 1px solid #dedede;
	border-right: 1px solid #dedede;
	padding-left: 40px
}
    </style>
    <title>My JSP 'pesonal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript">
var ajax;
window.onload=function(){
		ajax=new XMLHttpRequest();
		ajax.onreadystatechange=dosomething;
		ajax.open("get","/dzh/checkMessage.do",false);
		ajax.send();
	}
	function dosomething(){
		
		var data=ajax.responseText;
		
		var msg=document.getElementById("msg");
		if(data!="0")
		{msg.setAttribute('style','background-color: red');
		}
		else
			msg.setAttribute('style','background-color:#00BBFA');
			
	}
	function clk(){
		var msg=document.getElementById("msg");
		msg.setAttribute('style','background-color:#00BBFA');
	}
	</script>
</head>
  <body id="bg">
	<!-- 左边节点 -->
	<div class="container">

		<div class="leftsidebar_box">
			
			
			<dl class="">
				<dt ><a href="views/frame/p1.jsp" target="main">
					 个人信息
</a>
				</dt>
				
			</dl>
			
			<dl class="">
				<dt><a href="p2.do" target="main">
					 需求管理
</a>
				</dt>
			
			</dl>
			
			<dl class="">
				<dt><a href="p3.do" target="main">
					 订单管理
</a>
				</dt>
				
			</dl>
		<a href="read.do" onclick="clk()" target="main">	<div>
			<dl class="">
				<dt id="msg">
					消息

				</dt>
			
			</dl></div></a>
		</div>

	</div>
</body>
</html>
