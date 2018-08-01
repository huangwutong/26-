<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="com.struts.form.MosterCargoInfoForm"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MoBillList.jsp' starting page</title>
    
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
			Vector vc = (Vector) request.getAttribute("mocargovc");

			String json = "{totalProperty:" + vc.size() + ",root:[";

			if (vc.size() - index < pageSize) {
				for (int i = index; i < vc.size(); i++) {
					MosterCargoInfoForm ci = (MosterCargoInfoForm) vc.get(i);
					json += "{CargoID:'" + ci.getCargoID() + "',CargoName:'"
							+ ci.getCargoName() + "',CargoWeight:'"
							+ ci.getCargoWeight() + "',CargoBulk:'"
							+ ci.getCargoBulk() + "',CargoNum:'"
							+ ci.getCargoNum() + "',CargoUnit:'"
							+ ci.getCargoUnit()  + "',CargoValue:'"
							+ ci.getCargoValue()+ "',CargoFreight:'"
							+ ci.getCargoFreight() + "',CargoAmends:'"
							+ ci.getCargoAmends() + "',CargoMemo:'"
							+ ci.getCargoMemo() + "',CargoState:'"
							+ ci.getCargoState() + "',BranchID:'"
							+ ci.getBranchID() + "',CargoStartData:'"
							+ ci.getCargoStartData() + "',BranchName:'"
							+ ci.getBranchName()+ "',CargoEndData:'"
							+ ci.getCargoEndData()+ "'";

					json += "}";
					if (i != vc.size() - 1) {
						json += ",";
					}
				}
				json += "]}";
				
			} else {
				for (int i = index; i < pageSize + index; i++) {
					MosterCargoInfoForm ci = (MosterCargoInfoForm) vc.get(i);
					json += "{CargoID:'" + ci.getCargoID() + "',CargoName:'"
							+ ci.getCargoName() + "',CargoWeight:'"
							+ ci.getCargoWeight() + "',CargoBulk:'"
							+ ci.getCargoBulk() + "',CargoNum:'"
							+ ci.getCargoNum() + "',CargoUnit:'"
							+ ci.getCargoUnit()  + "',CargoValue:'"
							+ ci.getCargoValue()+ "',CargoFreight:'"
							+ ci.getCargoFreight() + "',CargoAmends:'"
							+ ci.getCargoAmends() + "',CargoMemo:'"
							+ ci.getCargoMemo() + "',CargoState:'"
							+ ci.getCargoState() + "',BranchID:'"
							+ ci.getBranchID() + "',CargoStartData:'"
							+ ci.getCargoStartData() + "',BranchName:'"
							+ ci.getBranchName()+ "',CargoEndData:'"
							+ ci.getCargoEndData()+ "'";

					json += "}";
					if (i != vc.size() - 1) {
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
