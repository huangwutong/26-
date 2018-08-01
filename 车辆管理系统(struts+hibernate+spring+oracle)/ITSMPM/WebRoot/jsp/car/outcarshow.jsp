<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>所有出车信息</title>
 
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
			出车基本信息
		</div>
		<div align="left" style="position: absolute;left: 10px">
		 <p>
		   <a href="<%=request.getContextPath()%>/jsp/print/carstats.action">返回</a>
		 </p>
		</div>
		<p></p>

		<ec:table items="message" var="outcm" filterable="true"
			action="${pageContext.request.contextPath}/jsp/outcar.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:row>
			 <ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="carbstb.carnum" title="车牌号" />
				<ec:column property="driverm.drivnm" title="驾驶员" filterable="false"/>
				<ec:column property="ucapli.ucempnm" title="用车人" filterable="false"/>
				<ec:column property="ucapli.dtation" title="目的地" filterable="false"/>
				<ec:column property="ucapli.ucdate" title="出车时间" filterable="false" cell="date"  format="yyyy-MM-dd"/>
				<ec:column property="sjincomdate" title="实际收车时间" filterable="false" cell="date"  format="yyyy-MM-dd"/>
				<ec:column property="whincom" title="是否收车" />
			</ec:row>
		</ec:table>

	</body>
</html>
 