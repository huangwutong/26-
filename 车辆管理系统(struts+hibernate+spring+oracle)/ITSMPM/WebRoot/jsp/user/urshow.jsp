<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>所有用户</title>
 
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/css/styles/extremecomponents.css"
			type="text/css" rel="stylesheet">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
	</head>

	<body>
		<div class="pageTitle">
			系统用户角色
		</div>
		<div align="left">
			<p>
				<img src="<%=request.getContextPath()%>/img/new.gif" width="16"
					height="16" />
				<a href="<%=request.getContextPath()%>/jsp/user/selectur.action">添加新用户角色关系</a>
				<a href="<%=request.getContextPath()%>/jsp/user/usermanger.action">返回</a>
			</p>
		</div>
		<p></p>

		<ec:table items="message" var="ur"
			action="${pageContext.request.contextPath}/jsp/urshow.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:row>
			    <ec:column property="xxuser.name" title="用户名" />
				<ec:column property="roletb.rolename" title="角色" />
				<ec:column property="dele" title="删除" sortable="false"
					viewsAllowed="html" style="width: 6%">
					<a href="<c:url value="/ITSMPM/urdele.action?Id=${ur.urid}" />"><img
							border="0" src="<%=request.getContextPath()%>/img/delete.gif"
							width="16" height="16" /> </a>
				</ec:column> 
			</ec:row>
		</ec:table>

	</body>
</html>
 