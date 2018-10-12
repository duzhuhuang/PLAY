<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList" import="entiy.user"
    %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% ArrayList<user> list=(ArrayList<user>)request.getAttribute("list"); %>
<% for(user u: list){%>

<%=u.getName() %>
<br/>
<%} %>
<table>


</table>
</body>
</html>