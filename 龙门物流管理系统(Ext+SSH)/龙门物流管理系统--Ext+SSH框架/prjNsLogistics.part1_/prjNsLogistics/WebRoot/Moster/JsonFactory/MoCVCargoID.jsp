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

		<title>My JSP 'BranchInfo.jsp' starting page</title>

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
    	Vector cargoinfos = (Vector)request.getAttribute("vccargo");
    	
    	String cargosJson = "[";
    	for(int i=0;i<cargoinfos.size();i++){
    		MosterCargoInfoForm bf=(MosterCargoInfoForm)cargoinfos.get(i); 
    		cargosJson+="{'CargoID':'"+bf.getCargoID()+"','CargoName':'"+bf.getCargoID()+","+bf.getCargoName()+"'}";
    		if(i!=cargoinfos.size()-1){
    			cargosJson+=",";
    		}
    	}
    	cargosJson+="]";
    
    	response.getWriter().write(cargosJson);
    	response.getWriter().close();
     %>
	</body>
</html>
