<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=fun();
function fun() {
    var rq = new XMLHttpRequest();
    rq.onreadystatechange = function () {
        alert(rq.readyState+" "+rq.status);
        alert(rq.responseText);
       


    }
    rq.open("get", "/s1/s1", true);
    rq.send();
   
}
</script>
</head>
<body>

</body>
</html>