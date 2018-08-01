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
			维修记录信息
		</div>
		 <div align="left">
			<p>
				<img src="<%=request.getContextPath()%>/img/dyzd.gif" width="16"
					height="16" />
				<a href="<%=request.getContextPath()%>/jsp/print/wxprinta.action" target=_blank>打印预览</a>
				<a href="<%=request.getContextPath()%>/jsp/print/wxprint.action">返回</a>
			</p>
		</div>
		<p></p>

		<ec:table items="message" var="serm" 
			action="${pageContext.request.contextPath}/jsp/selectrepar.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:exportXls fileName="repar.xls" tooltip="到出 excel"></ec:exportXls>
			<ec:row>
			 <ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="carbstb.carnum" title="用牌号" />
				<ec:column property="sershop" title="修理厂" />
				<ec:column property="seremp" title="经办人"  />
				<ec:column property="serdate" title="送修日期" cell="date" format="yyyy-MM-dd" />
				<ec:column property="serje" title="金额"  />
				<ec:column property="serron" title="送修原因"  />
				<ec:column property="ytake" title="预计取车时间"  cell="date" format="yyyy-MM-dd" />
				<ec:column property="sjtake" title="实际取车时间"   cell="date" format="yyyy-MM-dd" />
			</ec:row>
		</ec:table>

	</body>
</html>
 