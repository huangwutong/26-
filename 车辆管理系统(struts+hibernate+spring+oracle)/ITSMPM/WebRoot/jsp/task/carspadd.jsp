<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		 

		<title>添加用车申请审批信息</title>
 	 
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			添加用车申请审批信息
		</div>
		<s:form  method="post"
			action="saveCarsp" theme="simple">
			<s:iterator value="message">
			<input type="hidden" name="ucapliid" value="<s:property value="ucapliid"/>">
			
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					<tr>
						<td class="left" width="20%">
							用车部门：
						</td>
						<td class="right">
						     <s:property value="ucdep" />
						</td>
					
						<td class="left" width="20%">
							用车人：
						</td>
						<td class="right">
                             <s:property value="ucempnm" />

						</td>
				
						<td class="left" width="20%">
							联系电话：
						</td>
						<td class="right">
						 <s:property value="phonum" />
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							出发地点：
						</td>
						<td class="right">
						 <s:property value="ucloca" />
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
						    <s:property value="thing" />
						</td>
				
						<td class="left" width="20%">
							目的地：
						</td>
						<td class="right">
						    <s:property value="dtation" />
						</td>
				
						<td class="left" width="20%">
							审批状态：
						</td>
						<td class="right">
							 <s:select   list="#{'通过':'通过','未通过':'未通过'}"  name="appstats" /> 
						</td>
					</tr>
					  <tr>
						<td class="left" width="20%">
							审批意见：
						</td>
						<td class="right">
							<s:textarea name="appdes" value="" ></s:textarea>
						</td>
						<td class="left" width="20%">
							审批人：
						</td>
						<td class="right">
							<s:textfield name="appnm" value="" maxlength="10"></s:textfield>
						</td>
						<td class="left" width="20%">
							备注：
						</td>
						<td class="right">
						    <s:property value="ucdes" />
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
			</s:iterator>
			
		</s:form>
	</body>
</html>
