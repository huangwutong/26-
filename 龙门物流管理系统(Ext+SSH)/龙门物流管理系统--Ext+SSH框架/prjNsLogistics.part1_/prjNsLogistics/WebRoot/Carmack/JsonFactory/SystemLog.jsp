<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.struts.form.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'SystemLogList.jsp' starting page</title>

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
		<%
			//获取分页参数
			String start = request.getAttribute("start").toString();
			String limit = request.getAttribute("limit").toString();

			int index = Integer.parseInt(start);
			int pageSize = Integer.parseInt(limit);

			//获取后台传来的货票信息集合
			Vector vc = (Vector) request.getAttribute("SystemLogvc");

			String json = "{totalProperty:" + vc.size() + ",root:[";

			if (vc.size() - index < pageSize) {
				for (int i = index; i < vc.size(); i++) {
					CarmackSystemLogForm tm =  (CarmackSystemLogForm)vc.get(i);

					json += "{SystemLogID:'" + tm.getSystemLogID() + "',";
					json += "UserID:'" + tm.getUserID() + "',";
					json += "SystemLogMemo:'" + tm.getSystemLogMemo() + "',";
					json += "BranchID:'" + tm.getBranchID() + "'}";

					if (i != vc.size() - 1) {
						json += ",";
					}
				}
				json += "]}";
			} else {
				for (int i = index; i < pageSize + index; i++) {
					CarmackSystemLogForm tm = (CarmackSystemLogForm) vc.get(i);

					json += "{SystemLogID:'" + tm.getSystemLogID() + "',";
					json += "UserID:'" + tm.getUserID() + "',";
					json += "SystemLogMemo:'" + tm.getSystemLogMemo() + "',";
					json += "BranchID:'" + tm.getBranchID() + "'}";

					if (i != pageSize + index - 1) {
						json += ",";
					}
				}
				json += "]}";
			}
			response.getWriter().write(json);
			response.getWriter().close();
		%>
	</body>
</html>
