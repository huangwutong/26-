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
			Vector cgvc = (Vector) request.getAttribute("cargoByID");

			String json = "{totalProperty:1,root:[";

			for (int i = 0; i < cgvc.size(); i++) {

				OptCargoInfoForm cg = (OptCargoInfoForm) cgvc.get(i);

				json += "{CargoID:'" + cg.getCargoid() + "',";
				json += "CargoName:'" + cg.getCargoname() + "',";
				json += "CargoWeight:'" + cg.getCargoweight() + "',";
				json += "CargoBulk:'" + cg.getCargobulk() + "',";
				json += "CargoNum:'" + cg.getCargonum() + "',";
				json += "CargoUnit:'" + cg.getCargounit() + "',";
				json += "CargoValue:'" + cg.getCargovalue() + "',";
				json += "CargoFreight:'" + cg.getCargofreight() + "',";
				json += "CargoAmend:'" + cg.getCargoamend() + "',";
				json += "CargoMemo:'" + cg.getCargomemo() + "',";
				json += "CargoState:'" + cg.getCargostate() + "',";
				json += "BranchID:'" + cg.getBranchid() + "',";
				json += "BranchName:'" + cg.getBranchname() + "',";
				json += "CargoStartData:'" + cg.getCargostartdata() + "',";
				json += "CargoEndData:'" + cg.getCargoenddata() + "'}";

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
