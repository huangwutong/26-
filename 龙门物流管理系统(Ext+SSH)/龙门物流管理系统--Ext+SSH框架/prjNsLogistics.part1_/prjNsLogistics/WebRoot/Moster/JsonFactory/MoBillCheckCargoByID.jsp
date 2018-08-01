<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.struts.form.*"%>
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

		<title>My JSP 'CargoByID.jsp' starting page</title>

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
			//获取后台传来的货物信息
			Vector cgvc = (Vector) request.getAttribute("mobillcheckcargo");

			String json = "{totalProperty:1,root:[";

			for (int i = 0; i < cgvc.size(); i++) {

				MosterCargoInfoForm cg = (MosterCargoInfoForm) cgvc.get(i);

				json += "{CargoID:'" + cg.getCargoID() + "',";
				json += "CargoName:'" + cg.getCargoName() + "',";
				json += "CargoWeight:'" + cg.getCargoWeight() + "',";
				json += "CargoBulk:'" + cg.getCargoBulk() + "',";
				json += "CargoNum:'" + cg.getCargoNum() + "',";
				json += "CargoUnit:'" + cg.getCargoUnit() + "',";
				json += "CargoValue:'" + cg.getCargoValue() + "',";
				json += "CargoFreight:'" + cg.getCargoFreight() + "',";
				json += "CargoAmend:'" + cg.getCargoAmends() + "',";
				json += "CargoMemo:'" + cg.getCargoMemo() + "',";
				json += "CargoState:'" + cg.getCargoState() + "',";
				json += "BranchID:'" + cg.getBranchID() + "',";
				json += "BranchName:'" + cg.getBranchName() + "',";
				json += "CargoStartData:'" + cg.getCargoStartData() + "',";
				json += "CargoEndData:'" + cg.getCargoEndData() + "'}";

				if (i != cgvc.size() - 1) {
					json += ",";
				}
			}
			json += "]}";

			response.getWriter().write(json);
			response.getWriter().close();
		%>
	</body>
</html>
