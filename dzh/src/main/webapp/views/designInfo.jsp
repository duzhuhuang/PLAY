<%@ page language="java" import="java.util.*" import="entiy.design"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <% design d=(design)request.getAttribute("design"); %>
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
	left:16%;
	
	width:66%;
	height:49%;
	background:red;
	}
.design .img{	
width: 40%;
margin-left:10px;
height: 380px;
float:left;
}
.design .info{
width:55%;
height: 380px;
float:left;
}
.info p{

}
 .tou{
	
font-size: 50px;
text-align: center;
	
	}
#btn{
	position: relative;
	left:50%;
	top:-100px;
	width: 30%;
	height: 45px;
	background-color: #ee7700;
	border: none;
	color: white;
	font-size: 18px;
}
.ab{
	background:#3FC;
	
	height:50px;
	}

	.design p{
		
		}
.img img{
	
	height:80%;
	width:100%;
	}
.body .move{
width:9%;
margin-bottom: 25%;


}
.body .im{
background:#115511;
position:relative;
left:17%;
width:66%;
height:450px;

}
.body .imge{
width:80%;
position:relative;
left:0;
height:100%;
}
.word{
background:#111155;
color:yellow;
font-size:25px;
font-weight:bold;
display:block;
text-align: center;
}
p{
color: white;
position:relative;
left:20%;
font-size:25px;
}
    </style>
<script type="text/javascript">
var i=0;
function lef(){
	var img=document.getElementsByClassName("imge");
	var title=document.getElementsByClassName("word");
	
	if(i>0){
		
		img[i].style.display="none";
		title[i].style.display="none";
		i--;
		img[i].style.display="inline";
		title[i].style.display="inline";
	}
	
	
}
function rig(){
	var img=document.getElementsByClassName("imge");
	
	var title=document.getElementsByClassName("word");
	if(i<imge.length){
		var next=img[i+1];
		
		
			
			img[i].style.display="none";
			title[i].style.display="none";
			i++;
			img[i].style.display="inline";
			title[i].style.display="inline";
			
	}
	
}
</script>
  </head>
  
  <body>
 
   <div class="head">
      <div class="headL">
			<img class="headLogo" src="img/logo.png"/>
	  </div>
	  <div class="headR">
	  <span><a></a></span>	<a href="views/person.jsp">个人中心</a>	
	  </div>
   </div>
  <div class="body">
    <div class="design">
    <div class="img" id="img1">
    <p id="w1"><%=d.getName()%></p>
      <img src="<%=d.getPictures().get(0).getPath()%>"/>
      
    </div>
    <div class="info">
    <p> 风格：<%=d.getStyle() %></p>
    <p>描述：<%=d.getword() %></p>
    <p>面积：<%=d.getArea() %></p>
    <p>估价：<%=d.getCost() %></p>
    </div>
      
    </div><a href="views/form.jsp?id=<%=d.getId()%>"><button id="btn">使用该方案</button></a>
   	<div class="word"><%=d.getPictures().get(0).getWhat()%></div>
   	<% for(int i=1;i<d.getPictures().size();i++){ %>
   	<div class="word" style="display:none"><%=d.getPictures().get(i).getWhat() %></div>
   <%} %>
	<div class="im">
    <img id="left"  src="img/left.jpg"  class="move" onclick="lef()"/>
     <img   class="imge" src="<%=d.getPictures().get(0).getPath()%>"/>
     <% for(int i=1;i<d.getPictures().size();i++){ %>
     <img   class="imge" src="<%=d.getPictures().get(i).getPath()%>" style="display:none"/>
      <%} %>
    <img id="right" class="move" src="img/right.jpg" onclick="rig()"/>
	</div>
	
  </div>
  
  <div class="ab">
  </div>
   
		
	
    
    
</body>
</html>