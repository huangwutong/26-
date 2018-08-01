<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

<!--收车页面  -->
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
			所有收车信息
		</div>
		
		<p></p>

		<ec:table items="message" var="outcm" filterable="true"
			action="${pageContext.request.contextPath}/jsp/seleoutcar.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:row>
			 <ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="carbstb.carnum" title="车牌号" filterable="false" />
				<ec:column property="ucapli.ucempnm" title="用车人" filterable="false"/>
				<ec:column property="driverm.drivnm" title="驾驶员" filterable="false"/>
				<ec:column property="ucapli.thing" title="出车原因" filterable="false"/>
				<ec:column property="ucapli.ucdate" title="出车时间" filterable="false" cell="date" format="yyyy-MM-dd"/>
				<ec:column property="ucapli.indate" title="预计返回时间" filterable="false" cell="date" format="yyyy-MM-dd"/>
				<ec:column property="ucapli.dtation" title="目的地" filterable="false" />
				<ec:column property="sjincomdate" title="实际收车时间" cell="date" format="yyyy-MM-dd" filterable="false"/>
				<ec:column property="whincom" title="是否收车" />
				<ec:column property="outdes" title="备注" filterable="false" />
				<ec:column property="dele" title="删除" sortable="false" filterable="false"
					viewsAllowed="html" style="width: 6%">
					<a href="<c:url value="/ITSMPM/incmdele.action?Id=${outcm.outcmid}" />"><img
							border="0" src="<%=request.getContextPath()%>/img/delete.gif"
							width="16" height="16" /> </a>
				</ec:column> 
			</ec:row>
		</ec:table>

	</body>
</html>
 