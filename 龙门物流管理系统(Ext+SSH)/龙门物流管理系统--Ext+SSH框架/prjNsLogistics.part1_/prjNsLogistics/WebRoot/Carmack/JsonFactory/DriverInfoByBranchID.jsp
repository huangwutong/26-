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
    
    <title>My JSP 'DriverInfoByBranchID.jsp' starting page</title>
    
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
			Vector vc = (Vector) request.getAttribute("driverInfovc");

			String json = "{totalProperty:" + vc.size() + ",root:[";
			
			if (vc.size() - index < pageSize) {
				for (int i = index; i < vc.size(); i++) {
					OptDriverInfoForm ui = (OptDriverInfoForm)vc.get(i);
					
					json += "{DriverID:'"+ ui.getDriverid() +"',";
					json += "BranchID:'"+ ui.getBranchid() +"',";
					json += "BranchName:'"+ ui.getBranchname() +"',";
					json += "DriverName:'"+ ui.getDrivername() +"',";
					json += "DriverAge:'"+ ui.getDriverage() +"',";
					json += "DriverSex:'"+ ui.getDriversex() +"',";
					json += "DriverPhoto:'"+ ui.getDriverphoto() +"',";
					json += "DriverDriveCardID:'"+ ui.getDriverdrivecardid() +"',";
					json += "DriverCardID:'"+ ui.getDrivercardid() +"',";
					json += "DriverPhone:'"+ ui.getDriverphone() +"',";
					json += "DriverMemo:'"+ ui.getDrivermemo() +"',";
					json += "DriverIsVacancy:'"+ ui.getDriverisvacancy() +"'}";
					
					if (i != vc.size() - 1) {
						json += ",";
					}
				}
				json += "]}";
			}else{
				for (int i = index; i < pageSize + index; i++) {
					OptDriverInfoForm ui = (OptDriverInfoForm)vc.get(i);
					
					json += "{DriverID:'"+ ui.getDriverid() +"',";
					json += "BranchID:'"+ ui.getBranchid() +"',";
					json += "BranchName:'"+ ui.getBranchname() +"',";
					json += "DriverName:'"+ ui.getDrivername() +"',";
					json += "DriverAge:'"+ ui.getDriverage() +"',";
					json += "DriverSex:'"+ ui.getDriversex() +"',";
					json += "DriverPhoto:'"+ ui.getDriverphoto() +"',";
					json += "DriverDriveCardID:'"+ ui.getDriverdrivecardid() +"',";
					json += "DriverCardID:'"+ ui.getDrivercardid() +"',";
					json += "DriverPhone:'"+ ui.getDriverphone() +"',";
					json += "DriverMemo:'"+ ui.getDrivermemo() +"',";
					json += "DriverIsVacancy:'"+ ui.getDriverisvacancy() +"'}";
					
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
