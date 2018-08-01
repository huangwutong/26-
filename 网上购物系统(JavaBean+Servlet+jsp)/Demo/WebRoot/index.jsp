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
  
  <body bgcolor="#eeffff" >
   <table width="800" height="800" >
   
   <tr height="150" ><td colspan="2"><jsp:include page="heat.jsp" /></td></tr>
   
   <tr height="550">
   <td width="150"><jsp:include page="menu.jsp"></jsp:include></td>
   <td>
    <c:if test="${param.page!=null}">
  <jsp:include page="${param.page}" ></jsp:include>
  </c:if>
  <c:if test="${param.page==null}">
  <marquee bgcolor="#00ff00" scrollamount="3" >欢迎大家的光临！</marquee>
  <a href="index.jsp?page=chanpin.jsp" >
  <img  src="tupian/dsfdf.jpg"  width="600" height="380" align="top"/></a>
  </c:if>
 
   </td>
   </tr>
   
   <tr height="100"  bordercolor="red" ><td colspan="2" bordercolor="red"><jsp:include page="foot.jsp"></jsp:include></td></tr>
   
   </table>
  </body>
</html>
