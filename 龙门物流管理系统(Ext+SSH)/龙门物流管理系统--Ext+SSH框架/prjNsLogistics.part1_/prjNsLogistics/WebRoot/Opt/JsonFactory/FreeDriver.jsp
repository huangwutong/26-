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

		<title>My JSP 'FreeDriver.jsp' starting page</title>

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
		//获取当前登陆用户所在分公司的编号
		OptUserInfoForm uif = (OptUserInfoForm)request.getSession(true).getAttribute("loginer");
	
		String branchid = uif.getBranchid();	
	
		//获取司机信息集合
	    Vector drivervc = (Vector)application.getAttribute("Optdrivervc");
	    
		String driverJson = "[";
		for(int i=0;i<drivervc.size();i++){
			OptDriverInfoForm df=(OptDriverInfoForm)drivervc.get(i); 
			
			//条件判断：如果司机状态为空闲并且该司机属于当前登陆公司，则加入到JSON数组
			if(df.getDriverisvacancy().equals("0")&&df.getBranchid().equals(branchid)){
				driverJson+="{'DriverID':'"+df.getDriverid()+"','DriverName':'"+df.getDrivername()+"'}";
				if(i!=drivervc.size()-1){
					driverJson+=",";
				}
			}
		}
		driverJson+="]";

		response.getWriter().write(driverJson);
		response.getWriter().close();
    %>
	</body>
</html>
