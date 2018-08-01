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
			添加出车单
		</div>
		<s:form  method="post"
			action="saveTakecar" theme="simple">
			<s:iterator value="message">
			<input type="hidden" name="ucapliid" value="<s:property value="ucapliid"/>">
			
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					
					  <tr>
						<td class="left" width="20%">
							选择车辆：
						</td>
						<td class="right">
						  <s:select name="carbstbid" list="carselect" listKey="carbstbid"
						    listValue="carnum" />
						</td>
						<td class="left" width="20%">
							选择驾驶员：
						</td>
						<td class="right">
							<s:select name="drivermid" list="driverselect" listKey="drivermid"
						    listValue="drivnm"  />
						</td>
						
				
						<td class="left" width="20%">
							出车时间：
						</td>
						<td class="right">
						     <s:datetimepicker name="ucdate" displayFormat="yyyy-MM-dd" /><br><br>
						</td>
					</tr>
					<tr>
						<td class="left" width="20%">
							用车人：
						</td>
						<td class="right">
						     <s:textfield name="ucempnm" value="%{ucempnm}" maxlength="10" readonly="true"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							目的地：
						</td>
						<td class="right">
						 <s:textfield name="dtation" value="%{dtation}" maxlength="50" readonly="true"></s:textfield>
						</td>
					
						<td class="left" width="20%">
							预计返回时间：
						</td>
						<td class="right">
						   <s:datetimepicker name="indate" displayFormat="yyyy-MM-dd" /><br><br>
						</td>
					</tr>
					<tr>
						<td class="left" width="20%">
							出车原因：
						</td>
						<td class="right">
						     <s:textfield name="thing" value="%{thing}" maxlength="50" readonly="true"></s:textfield>
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
