<%@ page language="java" import="entiy.order" import="java.util.*" contentType="text/html; charset=UTF-8"
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
	
	table,td{
  border:1px solid green;
  
  }
	#hidendiv{
	display:none;
	position: absolute;
  	left: 30px;
  	top: 40px;
	}	
	#hidendiv img{
position: absolute;
  	left: 210px;
  	top: -10px;
  	height:20px;
  	width: 20px;
}
	div{
	background: gray;
	height: 160px;
	width: 220px;
	}
	input {
	
	width: 220px;
	height: 160px;
}
	</style>

<script>
function displ(obj){
	var s=document.getElementById("sourc");
	var d=document.getElementById("hidendiv");
	d.style="display:block";
	s.value=obj;
}
function hiden(){
	var d=document.getElementById("hidendiv");
	d.style="display:none";
}
var xmlhttp;
function ajax(){
	var data=document.getElementById("sourc").value;
	var inf=document.getElementById("inf").value;
	var url="/dzh/toushu.do?sendto="+data+"&information="+inf;
	
	 xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function(){
		
		if (xmlhttp.readyState==4&&xmlhttp.status==200)
		  {
			alert("ok");
			hiden();
		  }
	};
	
	xmlhttp.open("get",url , true);
	xmlhttp.send();
	
	
}
</script>
</head>
  
  
  <% ArrayList<order> list=(ArrayList<order>)request.getAttribute("list"); %>
  <body onload="onload()">
  <table><tr><td>施工队编号</td><td>估价</td><td>日期</td><td>状态</td></tr>
   <%for (order o:list) {%>
  <tr><td><%=o.getCid() %></td><td><%=o.getCost() %></td><td><%=o.getDate() %></td>
  <%if(o.getAction()!=2) {%>
  <td><a href="p3-1.do?id=<%=o.getId() %>">确认订单</a></td><td> <button type="button" onclick="displ(<%=o.getCid() %>)">投诉</button></td>
  <%}else{%>
	 <td>已确认</td> <td><button type="button" onclick="displ(<%=o.getCid() %>)">投诉</button> </td>
 <% } %></tr>
  <%} %>
  </table>
 <div id="hidendiv"><img src="img/close.png" onclick="hiden()"/>
 <form id="form" action="respon.do">
     <input id="sourc" name="sendto" style="display: none"/>
     
     <input id="inf" name="information" type="text" />
 <button type="button" onclick="ajax()"> 确定</button>
 </form>
 </div>
  </body>
</html>