<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>单位信息管理</title>

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
    <script type="text/javascript" src="dwr/interface/UnitService.js"></script>
    <script type="text/javascript" src="scripts/addUnit.js"></script>
		
	</head>

	<body class="bodycolor" topmargin="5">
		<form action="toAddUnitManage.do" method="post">
			<h3 align="center">添加单位信息&nbsp;<a href="./WebRoot/WEB-INF/myoffice/main.jsp">首页</a></h3>
			<table border="0" cellspacing="1" class="small"
				bgcolor="#CCFFFF" cellpadding="3" align="center">
				<tr>
					<td>
						单位名称：
					</td>
					<td nowrap class="TableData">
						<input type="text" name="unitName" class="BigInput" size="25"
							maxlength="50" value="">
						&nbsp;
					</td>
				<tr>
					<td nowrap class="TableData">
						电 &nbsp;&nbsp; 话：
					</td>
					<td nowrap class="TableData">
						<input type="text" name="unitPhone" class="BigInput" size="25"
							maxlength="50" value="">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td nowrap class="TableData">
						传 &nbsp;&nbsp; 真：
					</td>
					<td nowrap class="TableData">
						<input type="text" name="unitFax" class="BigInput" size="25"
							maxlength="50" value="">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td nowrap class="TableData" bordercolor="#c0c0c0">
						邮 &nbsp;&nbsp; 编：
					</td>
					<td nowrap class="TableData">
						<input type="text" name="unitPost" class="BigInput" size="25"
							maxlength="25" value="">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td nowrap class="TableData">
						地&nbsp;&nbsp;&nbsp; 址：
					</td>
					<td nowrap class="TableData">
						<input type="text" name="unitAddress" class="BigInput" size="25"
							maxlength="100" value="">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td nowrap class="TableData">
						网&nbsp;&nbsp;&nbsp; 站：
					</td>
					<td nowrap class="TableData">
						<input type="text" name="unitNet" class="BigInput" size="25"
							maxlength="100" value="">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td nowrap class="TableData">
						电子信箱：
					</td>
					<td nowrap class="TableData">
						<input type="text" name="unitEmail" id="unitEmail" class="BigInput" size="25"
							maxlength="100" value="">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td nowrap class="TableData">
						开 户 行：
					</td>
					<td nowrap class="TableData">
						<input type="text" name="unitBank" class="BigInput" size="25"
							maxlength="100" value="">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						银行账号：
					</td>
					<td>
						<input type="text" name="nuitBankNo" class="BigInput" size="25"
							maxlength="100" value="">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td nowrap class="TableControl" colspan="2" align="center">
						<input type="button" id="btnSave" value="保存" >
					</td>
				</tr>
			</table>
		</form>
		<p><label id="message"></label></p>
	</body>
</html>
