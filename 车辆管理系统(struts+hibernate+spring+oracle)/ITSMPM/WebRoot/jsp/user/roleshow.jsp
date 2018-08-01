<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>所有角色</title>
 
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
			角色管理
		</div>
		<div align="left">
			<p>
				<img src="<%=request.getContextPath()%>/img/new.gif" width="16"
					height="16" />
				<a href="<%=request.getContextPath()%>/jsp/user/roleadd.jsp">添加新角色</a>
				<a href="<%=request.getContextPath()%>/jsp/user/rpshow.action">角色权限关系</a>
			</p>
		</div>
		<p></p>

		<ec:table items="message" var="roletb"
			action="${pageContext.request.contextPath}/jsp/roleShow.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:row>
			    <ec:column property="rolename" title="角色名" />
				<ec:column property="roledes" title="描述" />
				<ec:column property="edit" title="修改" sortable="false"
					viewsAllowed="html" style="width: 6%">
					<a	href="<c:url value="/ITSMPM/roleedit.action?method=edit&Id=${roletb.roletbid} " />"><img
							border="0" src="<%=request.getContextPath()%>/img/modify.gif"
							width="14" height="14" /></a>
				</ec:column>
				
				<ec:column property="dele" title="删除" sortable="false"
					viewsAllowed="html" style="width: 6%">
					<a href="<c:url value="/ITSMPM/roledele.action?Id=${roletb.roletbid}" />"><img
							border="0" src="<%=request.getContextPath()%>/img/delete.gif"
							width="16" height="16" /> </a>
				</ec:column> 
			</ec:row>
		</ec:table>

	</body>
</html>
 