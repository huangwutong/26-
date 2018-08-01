<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		 

		<title>收车</title>
 	 
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			收车
		</div>
		<s:form  method="post"
			action="saveIncar" theme="simple">
			<s:iterator value="message">
			<input type="hidden" name="carbstbid" value="<s:property value="carbstb.carbstbid"/>">
			<input type="hidden" name="drivermid" value="<s:property value="driverm.drivermid"/>">
			<input type="hidden" name="ucapliid" value="<s:property value="ucapli.ucapliid"/>">
			<input type="hidden" name="outcmid" value="<s:property value="outcmid"/>">
			
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					
					  <tr>
						<td class="left" width="20%">
							车牌号：
						</td>
						<td class="right">
						   <s:property value="carbstb.carnum"/>
						</td>
						<td class="left" width="20%">
							驾驶员：
						</td>
						<td class="right">
							<s:property value="driverm.drivnm"/>
						</td>
						
				
						<td class="left" width="20%">
							出车时间：
						</td>
						<td class="right">
						     <s:datetimepicker name="ucapli.ucdate" displayFormat="yyyy-MM-dd" /><br><br>
						</td>
					</tr>
					<tr>
						<td class="left" width="20%">
							用车人：
						</td>
						<td class="right">
						  <s:property value="ucapli.ucempnm"/>
						</td>
				
						<td class="left" width="20%">
							目的地：
						</td>
						<td class="right">
						 <s:property value="ucapli.dtation"/>
						</td>
					
						<td class="left" width="20%">
							预计返回时间：
						</td>
						<td class="right">
						   <s:datetimepicker name="ucapli.indate" displayFormat="yyyy-MM-dd" /><br><br>
						</td>
					</tr>
					<tr>
						<td class="left" width="20%">
							出车原因：
						</td>
						<td class="right">
						      <s:property value="ucapli.thing"/>
						</td>
				       <td class="left" width="20%">
							实际收车时间：
						</td>
						<td class="right">
						   <s:datetimepicker name="sjincomdate" displayFormat="yyyy-MM-dd" /><br><br>
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
