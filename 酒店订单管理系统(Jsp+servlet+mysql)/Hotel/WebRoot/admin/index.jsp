<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>E——Hotel后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <frameset rows="80,*" cols="*" frameborder="no" border="0" framespacing="0">
             <frame  src="top.jsp"  name="topFrame" scrolling="No" noresize="noresize" id="topFrame"/>
             <frameset cols="180,*" frameborder="yes" border="1" framespacing="0">
                 <frame src="left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
                 <frame src="Center.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />       
             </frameset>
  </frameset>
  <body>
      
  </body>
</html>
