<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
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
			<h2>
				欢迎光临
			</h2>
		</center>
		<hr />
		<a href="showuserinfo">查看用户信息</a>|
		<a href="index.jsp?page=userRegist.jsp">注册用户</a>|
		<a href="invalidateUser">注销</a>
		<c:if test="${sessionScope.userInfoList!=null}">
			<table width="600" border="1" bgcolor="pink">
				<tr>
					<th>
						用户id
					</th>
					<th>
						用户名
					</th>
					<th>
						密码
					</th>
					<th>
						确认密码
					</th>
					<th>
						性别
					</th>
					<th>
						爱好
					</th>
					<th>
						E-mail
					</th>
					<th>
						修改
					</th>
					<th>
						删除
					</th>
				</tr>

				<c:forEach var="userInfo" items="${sessionScope.userInfoList}">
					<tr>
						<td>
							${userInfo.id}
						</td>
						<td>
							${userInfo.username}
						</td>
						<td>
							${userInfo.password1}
						</td>
						<td>
							${userInfo.password2}
						</td>
						<td>
							${userInfo.usersex}
						</td>
						<td>
							${userInfo.useraihao}
						</td>
						<td>
							${userInfo.usermail}
						</td>
						<td>
							<a
								href="index.jsp?page=updateUserinfo.jsp?userid=${userInfo.id}&userName=${userInfo.username}&userPassword=${userInfo.password1}">修改</a>
						</td>
						<td>
							<a href="index.jsp?page=delUser?userid=${userInfo.id}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>

		</c:if>
	</body>
</html>
