<%@ page language="java" import="entiy.*" import="java.util.ArrayList" contentType="text/html; charset=UTF-8"
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
	
	</script>

</head>
  <% ArrayList<order> ol=(ArrayList<order>)request.getAttribute("list"); 
  ArrayList<wanna> wl=(ArrayList<wanna>)request.getAttribute("wannas"); %>
  <body onload="onload()">
  <!--  <p>正在进行的订单</p>
   <table>
   <tr> 
<td> 客户id</td><td>地址</td><td>电话</td><td>设计方案</td>
 </tr>
 <%--
   <% for(wanna w:wl){ %>
   <tr> 
<td> <%=w.getPid() %></td><td><%=w.getAddress() %></td><td><%=w.getPhone()%></td><td><%=w.getDid()%></td>
 </tr>
 <%} %>--%>
   </table>
  -->
 <p>订单</p>
  <table  >
<tr> 
<td>客户 </td><td>金额</td><td>日期</td>
 </tr>
 <%for(order m:ol) {%>
<tr> 
<td> <%=m.getPid() %></td><td><%=m.getCost() %></td><td><%=m.getDate()%></td>
 </tr>
 <%} %>
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