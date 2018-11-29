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
	
	table, td, th
  {
  border:1px solid green;
  
  }
  table{
  width:80%;
  }
	td{
	width:20%;
	}
	</style>
<script>
var	ajax;
function query(){
ajax=new XMLHttpRequest();
var id=document.getElementById("gcdid");
var url="/dzh/m3_3.do?id="+id.value;
ajax.onreadystatechange=stateChange;
ajax.open("get", url, true);
ajax.send();
}
function stateChange(){

	if (ajax.readyState==4&&ajax.status==200)
	  {
	 var data=ajax.responseText;
	 alert(data);
	 }

	}

</script>
</head>
  
  <body onload="onload()">
<form action="m3_3.do">
工程队ID<input id="gcdid"/>
<button type="button" onclick="query()">查询投诉率</button>
</form>
  <table>
 
  <% ArrayList<toushu> list=(ArrayList<toushu>)request.getAttribute("lsit"); 
  if(list!=null){
	  
	  if(list.size()==0){%>
		  <div>
	  无记录
	 </div>
 <%} else{%>
	  <tr>
 <td>投诉用户</td><td>内容 </td><td>工程队</td><td>日期</td><td>操作</td>
  </tr><% 
	  for(int i=0;i<list.size();i++){
		  toushu o=list.get(i);
		  %>
		  
		  <tr><td><%=o.getFrom() %> / <%=o.getFromname() %></td><td><%=o.getInfo() %></td><td><%=o.getCid() %>/<%=o.getTarname() %></td><td><%=o.getTime() %></td>
		  <td><a href="m3_1.do?id1=<%=o.getFrom() %>&id2=<%=o.getCid() %>">处理</a>|<a href="m3_2.do?id1=<%=o.getFrom() %>&id2=<%=o.getCid() %>">查看记录</a></td>
		  </tr>
		  <% 
	  
	   }}}else{%>
  <div>
  无记录
 </div>
  <%}%>
  
  </table>
  

  </body>
</html>
