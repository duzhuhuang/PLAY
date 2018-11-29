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
    <script type="text/javascript">

	</script>
</head>
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
				<dt><a href="m0.do" target="main">
					 工程队列表
</a>
				</dt>
				
			</dl>
			<dl>
				<dt ><a href="m1.do" target="main">
					审核

				</dt>
				
			</dl></a>
			<a href="views/frame/m2.jsp" target="main">
			<dl>
				<dt >
					 业务表单

				</dt>
				
			</dl></a>
			<a href="m3.do" target="main">
			<dl>
				<dt>
					 投诉信息

				</dt>
			
			</dl></a>
			
			<dl class="">
				<dt><a href="m4.do?page=1" target="main">
					 日志
</a>
				</dt>
				
			</dl>
			
			
			
		</div>

	</div>
</body>
</html>
