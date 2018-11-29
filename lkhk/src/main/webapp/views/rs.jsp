<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" import="dao.entiy"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>幽鬼1000型</title>
</head>
<body>
<div style="height: 100%;width: 50%">
<a href="/lkhk/">
<img src="img/logo.jpg" style="position: relative;left:20%;width: 50% ;height: 50px"/><br/>
</a>
<form action="search.do" style="width: 100% ;height: 50px;">

<input style="width: 85% " name="word" /><button style="width: 10% ">搜索</button>
</form>

<%List<entiy> list=(List<entiy>)request.getAttribute("List"); %>
<% for(entiy e:list){ %>
<table style="border: 1px solid blue; margin: 1px;width: 100%;">
<tr>
<td><a href="<%=e.getURL()%>"><%=e.getTitle() %></a></td>
</tr>
<tr><td><p><%=e.getText()==null?"":e.getText() %></p></td>
</tr>
</table>

<% }%>

</div>

</body>
</html>