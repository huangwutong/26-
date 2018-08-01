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

		<title>My JSP 'addPartPopedom.jsp' starting page</title>

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
		<script type="text/javascript"
			src="dwr/interface/DeptPositionService.js"></script>
		<script type="text/javascript" src="scripts/addDeptPosition.js"></script>
	</head>

	<body>
		<form action="toAddDeptPosition.do" name="deptPositionform" method="post">
			<h3>
				新角色的添加
			</h3>
			部门:
			<select id="term">
				<option value="0">
					-请选择-
				</option>
			</select>
			职位:
			<select id="course">
				<option value="0">
					-请选择-
				</option>
			</select>
			<input type="button" id="btnSave" value="确定">
		</form>
	</body>
</html>
