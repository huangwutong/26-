<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>添加用户角色关系</title>
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			添加用户角色关系
		</div>
		<s:form  method="post"
			action="saveXxuser" theme="simple">
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					<tr>
						<td class="left" width="20%">
							选择用户：
						</td>
						<td class="right">
							<s:select name="userid" list="userselect" listKey="id"
						listValue="name" headerKey="" headerValue="--请选择用户--" /> 
						</td>
					</tr>
					<tr>
						<td class="left" width="20%">
							选择角色：
						</td>
						<td class="right">

							<s:select name="roletbid" list="roleselect" listKey="roletbid"
						listValue="rolename" headerKey="" headerValue="--请选择角色--" />

						</td>
					</tr>
					 
					<tr>
						<td align="right">
							<label>
								<input type="submit" name="Submit" value="保存"  
									class="submitButton" />
							</label>
							<label></label>
						</td>
						<td align="left">
							<input type="button" onclick="history.back();" value="返回"
								class="submitButton" />
						</td>
					</tr>
				</table>
			</div>
		</s:form>
	</body>
</html>
