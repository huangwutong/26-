<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html >
	<head>
	<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
	</head>

	<body>
	 <div style="position: absolute;top: 0px;left:0px" >
	   <img src="<%=request.getContextPath()%>/img/wsw.jpg" width="1100px" height="98px"/>
	 </div>
	 
	 <div style="position: absolute;top: 65px;left: 950px">
	  <a style="cursor: pointer;" onclick="window.parent.location.href='exitlogin.action'"> <font color="blue" >退出登录</font> </a> 
	 </div>
</body>
</html>
