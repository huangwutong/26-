<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		 

		<title>添加出车信息</title>
 	 
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			选择要打印车牌号
		</div>
		<s:form  method="post"
			action="%{selectAction}" theme="simple">
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					  <tr>
						<td class="left" width="20%">
							选择车牌号：
						</td>
						<td class="right">
						  <s:select name="carbstbid" list="carselect" listKey="carbstbid"
						    listValue="carnum"  headerKey="" headerValue="--所有--"/>
						</td>
					</tr>
			 	     <tr>
						<td align="right">
							<label>
								<input type="submit" name="Submit" value="查询"  
									class="submitButton" />
							</label>
							<label></label>
						</td>
					</tr>
				</table>
			</div>
		</s:form>
	</body>
</html>
