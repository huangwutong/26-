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
			保险记录信息
		</div>
		 <div align="left">
			<p>
				<img src="<%=request.getContextPath()%>/img/dyzd.gif" width="16"
					height="16" />
				<a href="<%=request.getContextPath()%>/jsp/print/bxprinta.action" target=_blank>打印预览</a>
				<a href="<%=request.getContextPath()%>/jsp/print/bxprint.action">返回</a>
			</p>
		</div>
		<p></p>

		<ec:table items="message" var="insrm" 
			action="${pageContext.request.contextPath}/jsp/selectinsrm.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:exportXls fileName="insrm.xls" tooltip="到出 excel"></ec:exportXls>
			<ec:row>
			 <ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="carbstb.carnum" title="用牌号" />
				<ec:column property="insrmdate" title="保险日期" cell="date" format="yyyy-MM-dd" />
				<ec:column property="inskind" title="保险类别"  />
				<ec:column property="insnum" title="保单号"  />
				<ec:column property="insfy" title="保险费"  />
				<ec:column property="insemp" title="经办人"  />
				<ec:column property="inscompy" title="保险公司"   />
				<ec:column property="insend" title="有效期限"  cell="date" format="yyyy-MM-dd"  />
				<ec:column property="insxm" title="保险项目"    />
				<ec:column property="des" title="描述"    />
			</ec:row>
		</ec:table>

	</body>
</html>
 