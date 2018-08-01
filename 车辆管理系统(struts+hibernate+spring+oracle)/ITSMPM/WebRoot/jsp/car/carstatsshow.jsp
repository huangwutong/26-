<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>所有车的状态</title>
 
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
			车辆状态
		</div>
		<p></p>

		<ec:table items="message" var="carbstb" filterable="true"
			action="${pageContext.request.contextPath}/jsp/carstats.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:row>
			 <ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="carnum" title="车牌号" />
				<ec:column property="carstats" title="当前状态" />
				 
				
				<ec:column property="sele" title="出车记录" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 16%">
					<a	href="<c:url value="/ITSMPM/carout.action?method=out&Id=${carbstb.carbstbid} " />">出车记录</a>
				</ec:column>
				
				<ec:column property="edit" title="加油记录" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 16%">
					<a	href="<c:url value="/ITSMPM/oil.action?method=oil&Id=${carbstb.carbstbid} " />">加油记录</a>
				</ec:column>
				<ec:column property="dele" title="维修记录" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 16%">
					<a href="<c:url value="/ITSMPM/wx.action?method=wx&Id=${carbstb.carbstbid}" />">维修记录</a>
				</ec:column> 
				<ec:column property="dele" title="规费记录" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 16%">
					<a href="<c:url value="/ITSMPM/gf.action?method=gf&Id=${carbstb.carbstbid}" />">规费记录 </a>
				</ec:column> 
			</ec:row>
		</ec:table>

	</body>
</html>
 