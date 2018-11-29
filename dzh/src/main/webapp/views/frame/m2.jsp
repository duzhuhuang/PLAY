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
function check(obj){
	if(obj.value!="")
		obj.name=obj.id;
}

</script>
</head>
  
  <body onload="onload()">
  <form action="m2.do">
 时间 ：<input id="date1"  type="date" value=""  onchange="check(this)"/>-
  <input id="date2"  type="date" value="" onchange="check(this)" />
  <br/>
 价格 ：<input id="cost1"  value="" onchange="check(this)"/>-
  <input id="cost2"  value="" onchange="check(this)" />
  <br/>
  用户id:<input id="pid"  value="" onchange="check(this)" />
  <br/>
 关键字： <input id="keyword" value="" onchange="check(this)"/>
  <button type="submit">查询</button>
  <table>
  <tr>
 <td>id</td> <td>用户</td><td>工程队</td><td>日期</td><td>金额</td><td>方案id</td>
  </tr>
  <% ArrayList<order> list=(ArrayList<order>)request.getAttribute("list"); 
  if(list!=null){
	  for(int i=0;i<list.size();i++){
		  order o=list.get(i);
		  %>
		  <tr><td><%=o.getId() %></td><td><%=o.getPname() %></td><td><%=o.getCname() %></td><td><%=o.getDate() %></td>
		  <td><%=o.getCost() %></td><td><%=o.getDid()%></td>
		  </tr>
		  <% 
	  }
	  
  }
  %>
  
  </table>
  <%
  int cout=0;
  if(list!=null){
	  cout=list.size();
  }%>
  <div>总计<%=cout %></div>
  </form>
  </body>
</html>
