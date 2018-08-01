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
			保养记录信息
		</div>
		 <div align="left">
			<p>
				<img src="<%=request.getContextPath()%>/img/dyzd.gif" width="16"
					height="16" />
				<a href="<%=request.getContextPath()%>/jsp/print/byprinta.action" target=_blank>打印预览</a>
				<a href="<%=request.getContextPath()%>/jsp/print/byprint.action">返回</a>
			</p>
		</div>
		<p></p>

		<ec:table items="message" var="mainm" 
			action="${pageContext.request.contextPath}/jsp/selectmainm.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:exportXls fileName="repar.xls" tooltip="到出 excel"></ec:exportXls>
			<ec:row>
			 <ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="carbstb.carnum" title="用牌号" />
				<ec:column property="maindate" title="保养日期" cell="date" format="yyyy-MM-dd" />
				<ec:column property="mainkind" title="保养类别"  />
				<ec:column property="mainemp" title="经办人"  />
				<ec:column property="mloca" title="保养点"  />
				<ec:column property="mje" title="金额(元)"  />
				<ec:column property="mamile" title="保养里程(公里)"   />
				<ec:column property="maxm" title="保养项目"   />
				<ec:column property="mades" title="备注"    />
			</ec:row>
		</ec:table>

	</body>
</html>
 