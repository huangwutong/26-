<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>所有车的基本信息</title>
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
			车辆基本信息
		</div>
		<div align="left">
			<p>
				<img src="<%=request.getContextPath()%>/img/new.gif" width="16"
					height="16" />
				<a href="<%=request.getContextPath()%>/jsp/car/caradd.jsp">添加新车辆</a>
			</p>
		</div>
		<p></p>
		<ec:table items="message" var="carbstb" 
			action="${pageContext.request.contextPath}/jsp/carmessage.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif"  filterable="true" >
			<ec:row>
			 	<ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="carnum" title="车牌号" />
				<ec:column property="driver" title="驾驶员" filterable="false"/>
				<ec:column property="departm" title="所属部门" filterable="false"/>
				<ec:column property="carstats" title="当前状态" />		
				<ec:column property="sele" title="查看详细" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 16%">
					<a	href="<c:url value="/ITSMPM/carsele.action?method=edit&Id=${carbstb.carbstbid} " />">查看详细</a>
				</ec:column>
				<ec:column property="edit" title="修改" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 6%">
					<a	href="<c:url value="/ITSMPM/caredit.action?method=edit&Id=${carbstb.carbstbid} " />"><img
							border="0" src="<%=request.getContextPath()%>/img/modify.gif"
							width="14" height="14" /></a>
				</ec:column>
				<ec:column property="dele" title="删除" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 6%">
					<a href="<c:url value="/ITSMPM/cardele.action?Id=${carbstb.carbstbid}" />"><img
							border="0" src="<%=request.getContextPath()%>/img/delete.gif"
							width="16" height="16" /> </a>
				</ec:column> 
			</ec:row>
		</ec:table>
	</body>
</html>
 