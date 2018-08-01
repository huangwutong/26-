<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>角色和权限管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="dwr/engine.js"></script>
    <script type="text/javascript" src="dwr/util.js"></script>
    <script type="text/javascript" src="dwr/interface/DeptPositionService.js"></script>
    <script type="text/javascript" src="scripts/partPopedomList.js"></script>
  </head>
  
  <body onload="init(${param.page})">
    <form action="" name="partPopedomform" method="post">
    	
    	<p id="header" style="color:blue"></p>
    	<table align="center">
    		<a href="positionPopedom.do?operate=toAddPositionPopedom">添加新角色</a>

    		<h3 align="center">权限信息管理</h3>
    		<tr>
    			<th>部门</th><th>职位</th><th>编辑</th>
    		</tr>
    		<tbody id="partPopedomBody">
      			</tbody>
    	</table>
    	<center ><p id="links"></p></center>
    </form>
  </body>
</html>
