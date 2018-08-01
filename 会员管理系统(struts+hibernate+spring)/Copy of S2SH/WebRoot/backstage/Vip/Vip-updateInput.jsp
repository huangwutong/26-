<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<STYLE type=text/css>
body {
	background-color: #708090;
}
</style>
	</head>
	<body>
		<h2>
			编辑会员
		</h2>
		<hr>
		<form
			action="backstage/Vip/Vip-update?id=<s:property value="vip.id"/>"
			method="post">
			学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:
			<input name="vip.id" value="${vip.id}" />
			<br />
			姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:
			<input name="vip.name" value="${vip.name}" />
			<br />
			登录密码:
			<input name="vip.password" value="${vip.password}" />
			<br />
			性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:
			<input name="vip.sex" value="${vip.sex}" />
			<br />
			电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:
			<input name="vip.telephone" value="${vip.telephone}" />
			<br />
			Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q:
			<input name="vip.qq" value="${vip.qq}" />
			<br />
			状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:
			<input name="vip.status" value="${vip.status}" />
			<br />
			<hr>
			<input type="submit" value="提交" />
		</form>

	</body>
</html>