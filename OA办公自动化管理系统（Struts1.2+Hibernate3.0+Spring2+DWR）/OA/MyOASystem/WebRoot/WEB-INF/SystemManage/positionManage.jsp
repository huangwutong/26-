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
    
    <title>职位信息管理</title>
    
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
    <script type="text/javascript" src="dwr/interface/PositionService.js"></script>
    <script type="text/javascript" src="scripts/addPosition.js"></script>
  </head>
  
  <body>
    <form action="toAddDeptManage.do" name="positionform" method="post">
    	<h3 align="center">添加职位信息&nbsp;<a href="./WebRoot/WEB-INF/myoffice/main.jsp">首页</a></h3>
    	<table align="center">
    		<tr>
    			<td>职位名称：</td>
    			<td>
    				<input type="text" name="positionName" class="BigInput" size="25"
							maxlength="50" value="">
    			</td>
    		</tr>
    		<tr>
    			<td>备注：</td>
    			<td>
    				<input type="text" name="positionRemark" class="BigInput" size="25"
							maxlength="50" value="">
    			</td>
    		</tr>
    		<tr>
    			<td nowrap class="TableControl" colspan="2" align="center">
						<input type="button" id="btnSave" value="确定" class="BigButton">
				</td>
    		</tr>
    	</table>
    	<h3 align="center">职位信息 
			</h3>
			<table border="1" align="center">
				<thead>
					<tr>
						<th>
							职位名称
						</th>
						<th>
							备注
						</th>
					</tr>
				</thead>
				<tbody id="positionbody">
				</tbody>
			</table>
    </form>
    <p><label id="message"></label></p>
  </body>
</html>
