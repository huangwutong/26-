<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
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

		<title>My JSP 'main.jsp' starting page</title>

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
		<table border="1">
			<tr>
				<td>
					�û���
				</td>
				<td>
					����
				</td>
			</tr>
			<logic:iterate id="userInfo" name="list">
				<tr>
					<td>
						${userInfo.userName }
					</td>
					<td>
						${userInfo.age }
					</td>
				</tr>
			</logic:iterate>

		</table>
	</body>
</html>
