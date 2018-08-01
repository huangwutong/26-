<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body bgcolor="wheat">
  <h1 align="center"><font color="cyan">售后服务</font></h1>
  <table border="1" width=400 height=200><tr height="60">
  <td colspan="2">
    <font color="#FF0000">
    <marquee scrollamount="3">感谢你对本产品的使用</marquee>
    </font>
    </td></tr>
    <tr height="35" ><td>一月包换</td><td>一年免修</td></tr>
    <tr height="35"><td>产品维修</td><td>产品检查</td></tr>
     <tr height="35"><td>诚信服务</td><td>免费咨询</td></tr>
      <tr height="35"><td>上门服务</td><td>免费派送</td></tr>
</table>
<h2 align="center"><a href="index.jsp">返回</a></h2>
  </body>
</html>
