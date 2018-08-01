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
    
    <title>My JSP 'heat.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#eeffff">
   <table width="800" height="150" >
       <tr><td colspan="5" align="center"><font color="red" size=10 face="楷体_GB2312, 仿宋_GB2312">当当网图书城</font></td></tr>
       <tr><td colspan="5" ><font color="red" size=6 face="楷体_GB2312, 仿宋_GB2312">站内图书搜索</font></td></tr>
       <tr><td colspan="5"><form action="searchBooks" method="post"> 
        <label>
        <input name="bookname" type="text" size="16" maxlength="16" />
        </label>
       	<input type="submit" value="查找图书" />(请输入书名)
      </form></td></tr>
       <tr align="center">
           <td><a href="index.jsp?page=jieshao.jsp">公司简介</a></td>
           <td><a href="index.jsp?page=yehu.jsp">公司业务</a></td>
           <td><a href="index.jsp?page=chanpin.jsp">产品类种</a></td>
           <td><a href="index.jsp?page=huankui.jsp">客户反馈</a></td>
           <td><a href="index.jsp?page=liuyan.jsp">留&nbsp;&nbsp; 言</a></td>
       </tr>
   </table>
  </body>
</html>
