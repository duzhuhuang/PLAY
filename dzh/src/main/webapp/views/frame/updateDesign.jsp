<%@ page language="java" import="entiy.design" import="entiy.company" contentType="text/html; charset=UTF-8"
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
	
	</style>
<script>
function delImg(obj){
	 var ajax=new XMLHttpRequest();
	 var fa=obj.parentNode;
		ajax.onreadystatechange=function(){
			if (ajax.readyState==4&&ajax.status==200){
			fa.removeChild(fa.childNodes[0]);
			fa.removeChild(fa.childNodes[1]);}
		}
	
	var url="/dzh/deletepicture.do?id="+obj.value;
	
	ajax.open("get",url,true);
	ajax.send();
}
</script>
</head>
  
  <body onload="onload()">
 
  <% design d=(design)request.getAttribute("design"); %>
   <form action="updateDesign.do"  method="post"  enctype="multipart/form-data" >
方案名：<input name="name"  type="text" value="<%=d.getName() %>"/><br/>
风格：<input name="style"  type="text" value="<%=d.getStyle() %>"/><br/>
描述：<input name="word" type="text" value="<%=d.getword() %>"/><br/>
造价：<input name="cost"  type="number" value="<%=d.getCost() %>"/><br/>
面积：<input name="area"  type="number" value="<%=d.getArea() %>"/><br/>

<button type="submit">提交修改</button>
预览图片编辑<br/>
<input name="id" value="<%=d.getId() %>"  style="display:none">
</form>
 <% for(int i=0;i<d.getPictures().size();i++){ %>
 <div>
     <img   class="imge" src="<%=d.getPictures().get(i).getPath()%>" />  
     <button value="<%=d.getPictures().get(i).getId()%>" onclick="delImg(this)" type="button">删除</button><br/>
     </div>
 <%} %> 
 添加图片<br/>
   <form action="addpicture.do"  enctype="multipart/form-data" method="post">
   <input name="designID" value="<%=d.getId() %>"  style="display:none">
   <input name="file" type="file"/>
   <input name="userType" value="com" style="display:none"/>
   <button type="submit" onclick="addimg()">增加图片</button>
   
   </form>
</body>
</html>
