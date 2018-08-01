<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatebookinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor=#eeffff>
  <form action="saveUpdateBookInfo" method="post">类别ID:${bookinfo.crono}<br><br>
  类别名称:<input type="text" name="cname" value="${bookinfo.cname}" /><br><br>
  类别摘要:<input type="text" name="xeplain" value="${bookinfo.xeplain}" /> <br>
  <input type="hidden" name="crono" value="${bookinfo.crono}" /><br><br>
  <input type="submit" value="更新" />
  </form>
    
   
   
  </body>
</html>
