<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center><font color="red" size="5" >管理员界面</font></center>
  	<p>
  	<hr size="2" color="pink">
  
 <c:if test="${sessionScope.struts==null}">
  <jsp:forward page="index.jsp?page=administer.jsp"></jsp:forward>
  </c:if>
 
 <a href="index.jsp?page=catagoryinfo.jsp"><img src="tupian/leibie.bmp" ></a>
 <a href="index.jsp?page=bookinfo.jsp"><img src="tupian/xinxi.bmp" ></a>
 <a href="index.jsp?page=zhuce.jsp"><img src="tupian/yonghu.bmp"></a>
 
  </body>
</html>
