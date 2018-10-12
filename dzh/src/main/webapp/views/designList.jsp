<%@ page language="java" import="java.util.*"  import="entiy.*"  pageEncoding="UTF-8"%>
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
	
font-size: 50px;
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
	position: absolute;
	right: 15px;
	bottom: 0px;
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
 <% Page p=(Page)request.getAttribute("page"); 
	List<design> list=(List<design>)request.getAttribute("list");
 int next=p.getTotal()==p.getPage()? p.getPage():p.getPage()+1;
 int back=p.getPage()==1?1:p.getPage()-1;
 %>
   <div class="head">
      <div class="headL">
			<img class="headLogo" src="img/logo.png"/>
	  </div>
	  <div class="headR">
	  	<a href="views/person.jsp">个人中心</a>	<span></span>
	  </div>
   </div>
  <div class="body">
    <div class="design">
     <%for(design d: list) 
     {
     
     %>
  <img src="<%=d.getPictures().get(0)%>" />
     <p><%=d.getName() %></p>
     <% }%>
    </div>
    <div class="comp">
    	<a href="designList.do?page=<%=back %>"><button>上一页</button></a><%=p.getPage() %><a href="designList.do?page=<%=next %>"><button>下一页</button></a>
  </div>
  </div>
  <div class="ab">
  </div>
   
		
	
    
    
</body>
</html>