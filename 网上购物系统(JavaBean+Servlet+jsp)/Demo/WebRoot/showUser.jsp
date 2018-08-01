<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
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

		<title>My JSP 'showUser.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<center>
			<font size=5 color=red>当前在线人员</font>
			<hr size="2" color="blue">
			<table border="1" width="100%">
				<c:forEach var="name" items="${requestScope.userlist}">
					<tr>
						<td width="50%">
							在线人员姓名
						</td>
						<td>
							${name}
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2">
						<center>
							<font size=3 color=red>在线人数：${sessionScope.count}</font>
						</center>
					</td>
				</tr>
			</table>
			<hr size="2" color="blue">
		</center>
	</body>
</html>
