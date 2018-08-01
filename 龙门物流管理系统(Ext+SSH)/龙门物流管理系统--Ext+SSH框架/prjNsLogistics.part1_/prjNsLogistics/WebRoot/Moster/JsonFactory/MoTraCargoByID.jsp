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
			Vector cgvc = (Vector) request.getAttribute("motracargoinfo");

			String json = "{totalProperty:1,root:[";

				for(int j = 0;j<cgvc.size();j++){
					MosterCargoInfoForm mc = (MosterCargoInfoForm)cgvc.get(j);
					
					json += "{CargoID:'" + mc.getCargoID() + "',";
					json += "CargoName:'" + mc.getCargoName() + "',";
					json += "CargoWeight:'" + mc.getCargoWeight() + "',";
					json += "CargoBulk:'" + mc.getCargoBulk() + "',";
					json += "CargoNum:'" + mc.getCargoNum() + "',";
					json += "CargoUnit:'" + mc.getCargoUnit() + "',";
					json += "CargoValue:'" + mc.getCargoValue() + "',";
					json += "CargoFreight:'" + mc.getCargoFreight() + "',";
					json += "CargoAmend:'" + mc.getCargoAmends() + "',";
					json += "CargoMemo:'" + mc.getCargoMemo() + "',";
					json += "CargoState:'" + mc.getCargoState() + "',";
					json += "BranchID:'" + mc.getBranchID() + "',";
					json += "BranchName:'" + mc.getBranchName() + "',";
					json += "CargoStartData:'" + mc.getCargoStartData() + "',";
					json += "CargoEndData:'" + mc.getCargoEndData() + "'}";

					if (j != cgvc.size() - 1) {
						json += ",";
					}
				
				}
				

			json += "]}";
			
			response.getWriter().write(json);
			response.getWriter().close();
		%>
	</body>
</html>
