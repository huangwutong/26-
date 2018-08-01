<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'Vip-updateById.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
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
		<form action="backstage/Vip/Vip-updateInput" method="post">
			请输入要编辑的ID：
			<input type="text" name="id" id="input">
			<input type="submit" value="提交">
		</form>

	</body>
</html>
