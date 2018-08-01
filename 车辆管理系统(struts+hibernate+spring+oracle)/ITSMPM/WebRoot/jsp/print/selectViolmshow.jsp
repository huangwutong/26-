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
			违章记录信息
		</div>
		 <div align="left">
			<p>
				<img src="<%=request.getContextPath()%>/img/dyzd.gif" width="16"
					height="16" />
				<a href="<%=request.getContextPath()%>/jsp/print/wzprinta.action" target=_blank>打印预览</a>
				<a href="<%=request.getContextPath()%>/jsp/print/wzprint.action">返回</a>
			</p>
		</div>
		<p></p>

		<ec:table items="message" var="violm" 
			action="${pageContext.request.contextPath}/jsp/selectviolm.action"
			imagePath="${pageContext.request.contextPath}/img/table/compact/*.gif" >
			<ec:exportXls fileName="violm.xls" tooltip="到出 excel"></ec:exportXls>
			<ec:row>
			 <ec:column property="rowcount" cell="rowCount" title="序号" sortable="false" filterable="false"></ec:column>
			    <ec:column property="carbstb.carnum" title="用牌号" />
				<ec:column property="violdate" title="违章日期" cell="date" format="yyyy-MM-dd" />
				<ec:column property="violkind" title="违章类别"  />
				<ec:column property="driver" title="驾驶员"  />
				<ec:column property="points" title="扣分"  />
				<ec:column property="fineje" title="罚款金额"  />
				<ec:column property="violloca" title="违章地点"   />
				<ec:column property="violemp" title="经办人"    />
				<ec:column property="violdes" title="备注"    />
			</ec:row>
		</ec:table>

	</body>
</html>
 