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

  </head>
  
  <body id="bg">
	<!-- 左边节点 -->
	<div class="container">

		<div class="leftsidebar_box">
				<dl class="">
				<dt ><a href="personal.jsp" target="main">
					 业务
</a>
				</dt>
				
			</dl>
			
			<dl class="">
				<dt ><a href="T.jsp" target="main">
					 业务
</a>
				</dt>
				
			</dl>
			
			<dl class="">
				<dt><a href="/ZHPT1/designbtn" target="main">
					 设计方案
</a>
				</dt>
			
			</dl>
			
			<dl class="">
				<dt><a href="O.JSP" target="main">
					 订单管理
</a>
				</dt>
				
			</dl>
			<dl class="">
				<dt><a href="M.JSP" target="main">
					消息
</a>
				</dt>
				
			</dl>
			
		</div>

	</div>
</body>
</html>
