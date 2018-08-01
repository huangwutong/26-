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
    
    <title>My JSP 'DepartmentInfo.jsp' starting page</title>
    
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
    	Vector depvc = (Vector)application.getAttribute("Optdepvc");
    
    	String depJson = "[";
    	for(int i=0;i<depvc.size();i++){
    		OptDepartmentInfoForm df=(OptDepartmentInfoForm)depvc.get(i); 
    		depJson+="{'DepartmentID':'"+df.getDepartmentid()+"','DepartmentName':'"+df.getDepartmentname()+"'}";
    		if(i!=depvc.size()-1){
    			depJson+=",";
    		}
    	}
    	depJson+="]";
    
    	response.getWriter().write(depJson);
    	response.getWriter().close();
     %>
  </body>
</html>
