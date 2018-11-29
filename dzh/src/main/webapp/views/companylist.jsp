<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="entiy.company"
    %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% ArrayList<company> list=(ArrayList<company>)request.getAttribute("list"); %>
<% %>

<%=list.get(5).getId()%>
<br/>
<%=list.size() %>
</body>
</html>