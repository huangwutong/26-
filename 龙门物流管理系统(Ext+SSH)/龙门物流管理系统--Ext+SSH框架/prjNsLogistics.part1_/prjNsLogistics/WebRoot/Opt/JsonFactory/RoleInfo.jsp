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
    
    <title>My JSP 'RoleInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  	<%
    	Vector rolevc = (Vector)application.getAttribute("Optrolevc");
    	
    	String roleJson = "[";
    	for(int i=0;i<rolevc.size();i++){
    		OptRoleInfoForm rf=(OptRoleInfoForm)rolevc.get(i); 
    		roleJson+="{'RoleID':'"+rf.getRoleid()+"','RoleName':'"+rf.getRolename()+"'}";
    		if(i!=rolevc.size()-1){
    			roleJson+=",";
    		}
    	}
    	roleJson+="]";
    
    	response.getWriter().write(roleJson);
    	response.getWriter().close();
     %>
  <body>
    
  </body>
</html>
