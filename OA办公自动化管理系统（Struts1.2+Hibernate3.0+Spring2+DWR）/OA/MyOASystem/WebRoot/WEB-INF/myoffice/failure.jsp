<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'emailsuccess.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
.STYLE1 {
	font-family: "宋体";
	font-size: 16px;
}
.STYLE5 {
	font-family: "宋体";
	font-size: 18px;
	font-weight: bold;
	color: #99CC66;
}
-->
</style>
  </head>
  
  <body>
	<table id="__01" width="412" height="178" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="4">
			<img src="image/info_01.jpg" width="17" height="178" alt=""></td>
		<td colspan="3" width="395" height="49" background="image/info_02.jpg"><span class="STYLE1">提示信息</span>			</td>
	</tr>
	<tr>
		<td  ><img src="image/info_03.jpg"></td>
		<td background="image/info_04.jpg" width="302" height="64" >
          <span class="STYLE5">${info }  </span></td>
		<td rowspan="3">
			<img src="image/info_05.jpg" width="41" height="129" alt=""></td>
	</tr>
	<tr>
		<td width="354" height="41" colspan="2" align="right" background="image/info_06.jpg">	
        <input type="button" onClick="javascript:location='${url }'" value="${value }">
        </td>
  </tr>
	<tr>
		<td colspan="2">
			<img src="image/info_07.jpg" width="354" height="24" alt=""></td>
	</tr>
</table>

  </body>
</html>
