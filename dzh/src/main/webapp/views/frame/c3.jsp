<%@ page language="java" import="entiy.design" import="java.util.List" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="entiy.Page"%>
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
	div a{
	cursor: pointer;
	}
	</style>
<script>
function display(){
	var tar=document.getElementById("tar");
	tar.style="diplay:inline";
	var btn=document.getElementById("btn");
	btn.style="diplay:inline";
}
</script>
</head>
  
  <body onload="onload()">
  <% Page p=(Page)request.getAttribute("page"); 
	List<design> list=(List<design>)request.getAttribute("list");
int next=p.getTotal()==p.getPage()? p.getPage():p.getPage()+1;
int back=p.getPage()==1?1:p.getPage()-1; %>
 
    
    
    
   <div class="design">
     <%for(design d: list) 
     {
     
     %>
  
    <a href="designInfo.do?id=<%=d.getId() %>&userType=comp"> <p><%=d.getName() %></p></a>
     <% }%>
    </div>
    <div class="comp">
    	<a href="designList2C.do?page=<%=back %>"><button>上一页</button></a><%=p.getPage() %><a href="designList2C.do?page=<%=next %>"><button>下一页</button></a>
  </div>
  
    <a href="views/frame/addDesign.jsp">添加设计</a>
    <form>
    </form>
  </body>
</html>
