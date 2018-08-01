<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'messageInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link href="css/show.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
         <table class="table1" align="center" width="100%">
               <tr>
                   <td width="30%" align="right"><strong>发布日期:</strong></td>
                   <td width="70%">${requestScope.m.date }</td>
               </tr>
               <tr>
                   <td align="right"><strong>类型:</strong></td>
                   <td>${requestScope.m.type }</td>
               </tr>
               <tr>
                   <td align="right"><strong>主题:</strong></td>
                   <td>${requestScope.m.topic }</td>
               </tr>
               <tr>
                   <td align="right"><strong>内容:</strong></td>
                   <td>${requestScope.m.content}</td>
               </tr>
            
         </table>
  </body>
</html>
