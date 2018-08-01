<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>添加用车申请信息</title>
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			添加用车申请信息
		</div>
		<s:form  method="post"
			action="saveUsecarsq" theme="simple">
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					<tr>
						<td class="left" width="20%">
							用车部门：
						</td>
						<td class="right">
							<s:textfield name="ucdep" value="" maxlength="20"></s:textfield>
						</td>
					
						<td class="left" width="20%">
							用车人：
						</td>
						<td class="right">

							<s:textfield name="ucempnm" value="" maxlength="20"></s:textfield>

						</td>
				
						<td class="left" width="20%">
							联系电话：
						</td>
						<td class="right">
							<s:textfield name="phonum" value="" maxlength="13"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							出发地点：
						</td>
						<td class="right">
							<s:textfield name="ucloca" value="" maxlength="50"></s:textfield>
						</td>
					
						<td class="left" width="20%">
							用车时间：
						</td>
						<td class="right">
							<s:datetimepicker name="ucdate" displayFormat="yyyy-MM-dd" /><br><br>
						</td>
				
						<td class="left" width="20%">
							预计收车时间：
						</td>
						<td class="right">
							<s:datetimepicker name="indate" displayFormat="yyyy-MM-dd" /><br><br>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							事由：
						</td>
						<td class="right">
							<s:textfield name="thing" value="" maxlength="100"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							目的地：
						</td>
						<td class="right">
							<s:textfield name="dtation" value="" maxlength="100"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							审批状态：
						</td>
						<td class="right">
							 <s:select   list="#{'未审批':'未审批'}"  name="appstats" /> 
						</td>
					</tr>
					
					  <tr>
						<td class="left" width="20%">
							备注：
						</td>
						<td class="right">
							<s:textarea name="ucdes" value="" ></s:textarea>
						</td>
					</tr>
					 
					 
					 
					<tr>
					
					
					    <td></td>
					    <td></td>
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
