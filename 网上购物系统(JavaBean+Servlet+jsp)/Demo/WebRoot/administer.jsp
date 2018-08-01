<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'administer.jsp' starting page</title>
    
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
  <center><font color="red" size="5">后台管理</font></center>	
  <p><hr size="2" color="pink">
  ${requestScope.error}
    <form action="adminLogin" method="post">
    	管理员姓名：<input type="text" name="adminName" /><br><br>
    	管理员密码：<input type="password" name="adminPass" /><br><br>
    	 验证码 <input type="text" name="random" maxlength="4">
    	   <a href="index.jsp?page=administer.jsp"><img src="imgcode"></a><br><br>
    	<input type="submit" value="进入" />
    	<input type="reset" value="重置">
    </form>
  </body>
</html>
