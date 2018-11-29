<%@ page language="java" import="java.util.*" import="entiy.*"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
.body{
	width:100%;
	background:#00F;
	
	height:900px;
	}
.body .design{

	position: relative;
	left:5%;
	width:90%;
	height:49%;
	background:red;
	}
.design .img{	
width: 32%;
margin-left:10px;
height: 380px;
float:left;
}
 .tou{
	
font-size: 30px;
text-align: center;
	
	}
.body .comp{
	position: relative;
	
	left:5%;
	top:1%;
	width:90%;
	height:49%;
	background:#CC6;
	}
.ab{
	background:#3FC;
	
	height:50px;
	}
.more{
	font-size:20px;
	position: relative;
	text-align:center;
	left:5%;
	top:1%;
	width:90%;
	height:9%;
	background:#CC6;
	}
	.design p{
		
		}
.img img{
	
	height:80%;
	width:100%;
	}
    </style>
  </head>
  
  <body>
  <%person p=(person)session.getAttribute("user");  %>
   <div class="head">
      <div class="headL">
			<img class="headLogo" src="img/logo.png"/>
	  </div>
	  <div class="headR">
	  	<a href="views/person.jsp">个人中心</a>	<span> <%=p.getName() %></span>
	  </div>
   </div>
  <div class="body">
    <div class="design">
      <p class="tou">为您推荐</p>
      <% ArrayList<design> list1=(ArrayList<design>)request.getAttribute("list1"); %>
      <div class="img" id="img1"><a href="designInfo.do?id=<%=list1.get(0).getId()%>&userType=person">
      <img src="<%=list1.get(0).getPictures().get(0).getPath() %>"/></a>
      <p id="w1"><%=list1.get(0).getName() %></p>
      </div>
      <div class="img" id="img2"><a href="designInfo.do?id=<%=list1.get(1).getId() %>&userType=person">
      <img src="<%=list1.get(1).getPictures().get(0).getPath() %>"/></a>
      <p id="w2"><%=list1.get(1).getName() %></p>
      </div>
       <div class="img" id="img3"><a href="designInfo.do?id=<%=list1.get(2).getId() %>&userType=person">
      <img src="<%=list1.get(2).getPictures().get(0).getPath() %>"/></a>
      <p id="w3"><%=list1.get(2).getName() %></p>
      </div>
      
    </div>
    <a href="designList.do?page=1"><div class="more">更多 </div></a>
   <!--   <div class="comp">
    	<p class="tou">	装修实例</p>
    	<div class="img">
    	</div>
        <div class="more">
      <a>更多>></a> 
      </div>
    </div>-->
  </div>
  <div class="ab">
  </div>
   
		
	
    
    
</body>
</html>
