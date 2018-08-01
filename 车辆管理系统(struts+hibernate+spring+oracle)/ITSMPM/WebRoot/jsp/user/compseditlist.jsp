<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		 

		<title>修改权限</title>
 	 
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			修改权限
		</div>
		<s:form  method="post"
			action="upComps" theme="simple">
			<s:iterator value="message">
			<input type="hidden" name="compsid" value="<s:property value="compsid"/>">
		
		
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					<tr>
						<td class="left" width="20%">
							权限名：
						</td>
						<td class="right">
							<s:textfield name="comname" value="%{comname}" maxlength="10"></s:textfield>
						</td>
					</tr>
					<tr>
						<td class="left" width="20%">
							描述：
						</td>
						<td class="right">
							<s:textfield name="comdes" value="%{comdes}" maxlength="100"></s:textfield>
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
			</s:iterator>
		</s:form>
	</body>
</html>
