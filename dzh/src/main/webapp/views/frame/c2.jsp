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
	
	</style>
	<script type="text/javascript">
function ordersbm(obj1,obj2,obj3){
	var id1=document.getElementById("hid1");
	var id2=document.getElementById("hid2");
	var id3=document.getElementById("hid3");
	id1.value=obj1;
	id2.value=obj2;
	id3.value=obj3;
	var a=document.getElementById("hidend");
	a.style=("display:block");
	
}
	</script>

</head>

 
   <body onload="onload()">
<%Page p=(Page)request.getAttribute("page");
  ArrayList<wanna> list=(ArrayList<wanna>)request.getAttribute("list");
  HashMap<Integer,design> map=(HashMap<Integer,design>)request.getAttribute("map");
  int next=p.getTotal()==p.getPage()? p.getPage():p.getPage()+1;
  int back=p.getPage()==1?1:p.getPage()-1;
%>
<table >
<tr><th></th><th></th><th></th></tr>
<% for(wanna w:list) {
design d=map.get(w.getDid());%>
 <tr><td><%=w.getPid()%></td><td><%=w.getAddress()%></td><td><%=w.getArea()%></td><td><%=d.getStyle()%></td><td><%=d.getName()%></td><td>
 <%=w.getPhone()%></td><td><button onclick="ordersbm(<%=w.getPid() %>,<%=w.getDid() %>,<%=w.getId() %>)" >受理</button></td></tr>
 <%} %>
</table>
<a href="c2_1.do?page=<%=back %>"><button>上一页</button></a><%=p.getPage() %><a href="c2_1.do?page=<%=next %>"><button>下一页</button></a>
  <div id="hidend" style="display:none">
  下订单
  <form  action="c2_2.do">
  <input id="hid1" name="pid" value="" style="display:none">
  价格：<input name="cost">
  <input  id="hid2" name="did" style="display:none">
  <input  id="hid3" name="wannaid" style="display:none">
  <button>提交</button>
  </form>
  </div>
  
  </body>
 
</html>