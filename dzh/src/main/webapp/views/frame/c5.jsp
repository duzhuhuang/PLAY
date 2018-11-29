<%@ page language="java" import="entiy.message" import="java.util.ArrayList" contentType="text/html; charset=UTF-8"
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
	table, td, th
  {
  border:1px solid green;
  
  }
  table{
  width:80%;
  }
	td{
	width:70%;
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
	<script type="text/javascript">
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
		var url="/dzh/respon.do?type=2c&sendto="+data+"&information="+inf;
		
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
  <% ArrayList<message> msl=(ArrayList<message>)request.getAttribute("list"); %>
  <body onload="onload()">
  <table  >
  <tr><th>消息</th><th>来源</th></tr>
 <%for(message m:msl) {%>
<tr> 
<td> <%=m.getInformation() %></td><td><%=m.getName() %></td><td><button onclick="displ(<%=m.getSource() %>)">回复</button></td>
 </tr>
 <% }%>
 </table>
 
  <div id="hidendiv"><img src="img/close.png" onclick="hiden()"/>
 <form action="">
     <input id="sourc" name="sendto" style="display: none"/>
     <input id="inf" name="information" type="text" />
    
 <button type="button" onclick="ajax()"> 确定</button>
 </form>
 </div>
  </body>
</html>