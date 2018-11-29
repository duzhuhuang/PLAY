<%@ page language="java" import="entiy.*" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <base href="<%=basePath%>">
<meta charset="UTF-8">
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
	#1{
	display:none;
	}
	
	#hidendiv{
	display:none;
	position: absolute;
  	left: 30px;
  	top: 40px;
	}	
	div{
	background: gray;
	height: 160px;
	width: 220px;
	}
	input {
	
	width: 150px;
	height: 10px;
}
#hidendiv img{
position: absolute;
  	left: 210px;
  	top: -10px;
  	height:20px;
  	width: 20px;
}

	
	</style>
<script>
function displ(){
	
	var d=document.getElementById("hidendiv");
	d.style="display:block";
}
function hiden(){
	var d=document.getElementById("hidendiv");
	d.style="display:none";
}
function sbm(){
	var f1=document.getElementById("f1").value;
	var f2=document.getElementById("f2").value;
	var f3=document.getElementById("f3").value;
	var f4=document.getElementById("f4").value;
	var f5=document.getElementById("f5").value;
	var f6=document.getElementById("f6").value;
	var f=document.getElementById("f");
	if(f1==""||f2==""||f3==""||f4==""||f5==""||f6=="")
		{
		alert();
		}
	else{
		f.submit();
	}
}
</script>
</head>
  
  <body onload="onload()">
 <% design list=(design)request.getAttribute("list"); 
 	if(list==null)
 	{
 	%>
 没有发布的需求
 <button onclick="displ()">去发布</button>	
 <%
 	}else{
 %>
 <table>
 <tr><th>风格</th><th>描述</th><th>估价</th><th>面积</th></tr>

 <tr><td><%=list.getStyle() %></td><td><%=list.getword() %></td><td><%=list.getCost() %></td><td><%=list.getArea() %></td></tr>
 
 </table>
 <button onclick="displ()">修改</button>	
 <%}%>
 <div id="hidendiv"><img src="img/close.png" onclick="hiden()"/>
 <form action="wannaanddesign.do" id="f">
        风格<input id="f1" name="style" value=""/><br/>
        描述<input id="f2" name="word" value=""/><br/>
        估价<input id="f3" name="cost" type="number" value=""/><br/>
        面积<input id="f4" name="area" type="number" value=""/><br/>
        手机<input id="f5" name="phone" value=""/><br/>
        地址<input id="f6" name="address" value=""/><br/>
       
 <button type="button" onclick="sbm()"> 确定</button>
 </form>
 </div>

  </body>
</html>