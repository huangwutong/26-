<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>OA系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="page/css.css">


  </head>
  
  
  <frameset  rows="115,*"  frameborder="0" framespacing="0" border="0">
  	<frame name="top" src="top.jsp"  frameborder="0" noresize marginhight=0 marginwidth="0" scrolling="no" >
    <frameset id="below" rows="*" cols="175,8,*" frameborder="0" framespacing="0" border="0">
    	<frame name="left" src="left.jsp" frameborder="0" scrolling="no" 	noresize marginhight=0 marginwidth="0">
        <frame name="controlleft" src="controlleft.jsp" frameborder="0" noresize marginhight=0 marginwidth="0" scrolling="no">
        <frame name="main" src="main.jsp" frameborder="0" noresize marginhight=0 marginwidth="0" scrolling="auto" >
    </frameset>
  </frameset><noframes></noframes>
  
</html>
