<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<title>部门信息管理</title>

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
		<script type="text/javascript" src="dwr/interface/DeptService.js"></script>
		<script type="text/javascript" src="scripts/addDept.js"></script>
	</head>

	<body>

		<form action="toAddDeptManage.do" name="deptform" method="post">
			<h3 align="center"> 
				添加部门信息&nbsp; 
				<a href="/WEB-INF/page/main.jsp">首页</a>
			</h3>
			<table align="center">
				<tr>
					<td>
						部门名称：
					</td>
					<td>
						<input type="text" name="deptName" class="BigInput" size="25"
							maxlength="50" value="">
					</td>
				</tr>
				<tr>
					<td>
						部门电话：
					</td>
					<td>
						<input type="text" name="deptPhone" class="BigInput" size="25"
							maxlength="50" value="">
					</td>
				</tr>
				<tr>
					<td>
						传真：
					</td>
					<td>
						<input type="text" name="deptFax" class="BigInput" size="25"
							maxlength="50" value="">
					</td>
				</tr>
				<tr>
					<td>
						备注：
					</td>
					<td>
						<input type="text" name="deptRemark" class="BigInput" size="25"
							maxlength="50" value="">
					</td>
				</tr>
				<tr>
					<td nowrap class="TableControl" colspan="2" align="center">
						<input type="button" id="btnSave" value="确定">
					</td>
				</tr>
			</table>
			<h3 align="center">部门信息 
			</h3>
			<table border="1" align="center">
				<thead>
					<tr>
						<th>
							部门名称
						</th>
						<th>
							部门电话
						</th>
						<th>
							传真
						</th>
						<th>
							备注
						</th>
					</tr>
				</thead>
				<tbody id="deptbody">
				</tbody>
			</table>
		</form>
		<p>
			<label id="message"></label>
		</p>
	</body>
</html>
