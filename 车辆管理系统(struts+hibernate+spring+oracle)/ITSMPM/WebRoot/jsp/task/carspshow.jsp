<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>所有信息</title>
 
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
			未审批信息
		</div>
		<div align="left">
			<p>
				<img src="<%=request.getContextPath()%>/img/new.gif" width="16"
					height="16" />
				<a href="<%=request.getContextPath()%>/jsp/user/carspAll.action">查看所有审批信息</a>
			</p>
		</div>
		<p></p>

		<ec:table items="message" var="ucapli" filterable="true"
			action="${pageContext.request.contextPath}/jsp/carsp.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:row>
			 <ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="ucdep" title="用车部门" filterable="false" />
				<ec:column property="ucempnm" title="用车人" filterable="false"/>
				<ec:column property="ucdate" title="用车时间" filterable="false" cell="date" format="yyyy-MM-dd"/>
				<ec:column property="dtation" title="目的地" filterable="false" />
				<ec:column property="appstats" title="审批状态" />
				<ec:column property="whcar" title="是否派车" />
				<ec:column property="appdes" title="审批意见" filterable="false" />
				<ec:column property="appnm" title="审批人" filterable="false" />
				<ec:column property="dele" title="审批" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 6%">
					<a href="<c:url value="/ITSMPM/carspsele.action?Id=${ucapli.ucapliid}" />">审批</a>
				</ec:column> 
			</ec:row>
		</ec:table>

	</body>
</html>
 