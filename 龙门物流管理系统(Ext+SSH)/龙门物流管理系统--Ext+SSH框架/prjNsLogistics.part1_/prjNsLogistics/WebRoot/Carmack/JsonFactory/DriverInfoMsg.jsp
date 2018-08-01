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
    
    <title>My JSP 'UserInfoByBranchID.jsp' starting page</title>
    
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

			//获取后台传来的信息集合
			Vector vc = (Vector) request.getAttribute("driverInfovc");

			String json = "{totalProperty:" + vc.size() + ",root:[";
			
			if (vc.size() - index < pageSize) {
				for (int i = index; i < vc.size(); i++) {
					CarmackDriverInfoForm cdif = (CarmackDriverInfoForm)vc.get(i);
					
					json += "{DriverID:'"+ cdif.getDriverID() +"',";
					json += "BranchID:'"+ cdif.getBranchID()  +"',";
					json += "DriverName:'"+ cdif.getDriverName()  +"',";
					json += "DriverAge:'"+ cdif.getDriverAge()  +"',";
					json += "DriverSex:'"+ cdif.getDriverSex()  +"',";
					json += "DriverDriveCardID:'"+ cdif.getDriverDriveCardID()  +"',";
					json += "DriverCardID:'"+ cdif.getDriverCardID()  +"',";
					json += "DriverPhone:'"+ cdif.getDriverPhone()  +"',";
					json += "DriverMemo:'"+ cdif.getDriverMemo()  +"',";			
					json += "DriverIsVacancy:'"+ cdif.getDriverIsVacancy() +"'}";
					
					if (i != vc.size() - 1) {
						json += ",";
					}
				}
				json += "]}";
			}else{
				for (int i = index; i < pageSize + index; i++) {
					CarmackDriverInfoForm cdif = (CarmackDriverInfoForm)vc.get(i);
					
					json += "{DriverID:'"+ cdif.getDriverID() +"',";
					json += "BranchID:'"+ cdif.getBranchID()  +"',";
					json += "DriverName:'"+ cdif.getDriverName()  +"',";
					json += "DriverAge:'"+ cdif.getDriverAge()  +"',";
					json += "DriverSex:'"+ cdif.getDriverSex()  +"',";
					json += "DriverDriveCardID:'"+ cdif.getDriverDriveCardID()  +"',";
					json += "DriverCardID:'"+ cdif.getDriverCardID()  +"',";
					json += "DriverPhone:'"+ cdif.getDriverPhone()  +"',";
					json += "DriverMemo:'"+ cdif.getDriverMemo()  +"',";			
					json += "DriverIsVacancy:'"+ cdif.getDriverIsVacancy() +"'}";
					
					if (i != pageSize + index - 1) {
						json += ",";
					}
				}
				json += "]}";
			}
			
			System.out.println("UserInfoJSON in JSP=========="+json);
			
			response.getWriter().write(json);
			response.getWriter().close();
     %>
  </body>
</html>
