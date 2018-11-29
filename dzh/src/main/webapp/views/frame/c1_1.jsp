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
	div{border: 1px solid;
		border-color: black;
		display: inline-block;
		width: 200px;
		
	}
	</style>
<script>
function sbm(){
	var n=document.getElementById("f_n");
	var j=document.getElementById("f_j");
	var p=document.getElementById("f_p");
	if(n.value!=""&&j.value!=""&&p.value!="")
		{
		var form=document.getElementById("f");
		form.submit();
		}
	else{
		alert();
	}
}
</script>
</head>
  
  <body onload="onload()">
  <% company p=(company)session.getAttribute("user"); 
  		List<worker> list =(List<worker>)request.getAttribute("list");%>
    
    
    <% for(worker w:list) {%>
   <div><img src="<%=w.getPhoto() %>" height="200px" width="180px"/>
   <p>name:<%=w.getName() %></p>
   <p>job:<%=w.getJob() %></p>
   <a href="c1_1_d.do?id=<%=w.getId() %>">删除</a>
   </div>
    <%} %>
    <br/>
    <p>新增队员</p>
    <form id="f" action="c1_1_a.do" method="post" enctype="multipart/form-data" >
    name:<input id="f_n" name="name"/>
    job:<input id="f_j" name="job"/>
    照片：<input id="f_p" name="file" type="file"/>
    <button type="button" onclick="sbm()">添加</button>
    </form>
  </body>
</html>
