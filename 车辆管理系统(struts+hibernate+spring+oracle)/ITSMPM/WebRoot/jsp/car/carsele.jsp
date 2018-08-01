<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		 

		<title>车辆</title>
 	 
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			 车辆信息
		</div>
		<s:form  method="post"
			action="saveCar" theme="simple">
			<s:iterator value="message">
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					<tr>
						<td class="left" width="20%">
							车牌号：
						</td>
						<td class="right">
						 <s:property value="carnum"/>
						</td>
					
						<td class="left" width="20%">
							品牌：
						</td>
						<td class="right">
                           <s:property value="brand"/>

						</td>
					
						<td class="left" width="20%">
							型号：
						</td>
						<td class="right">
						<s:property value="cmode"/>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							车辆类别：
						</td>
						<td class="right">
						<s:property value="carkind"/>
						</td>
					
						<td class="left" width="20%">
							耗油量：
						</td>
						<td class="right">
						<s:property value="fconsu"/>
						</td>
				
						<td class="left" width="20%">
							发动机号：
						</td>
						<td class="right">
						<s:property value="enginum"/>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							车架号：
						</td>
						<td class="right">
						 <s:property value="framenum"/>
						</td>
				
						<td class="left" width="20%">
							载重：
						</td>
						<td class="right">
						   <s:property value="carload"/>
						</td>
				
						<td class="left" width="20%">
							座位数：
						</td>
						<td class="right">
						   <s:property value="seatnum"/>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							驾驶员：
						</td>
						<td class="right">
						   <s:property value="driver"/>
						</td>
					
						<td class="left" width="20%">
							购入日期：
						</td>
						<td class="right">
							 <s:datetimepicker name="buydate" displayFormat="yyyy-MM-dd" /><br><br>
						</td>
				
						<td class="left" width="20%">
							购入单位：
						</td>
						<td class="right">
						     <s:property value="buyunit"/>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							购买价格：
						</td>
						<td class="right">
						  <s:property value="buyprice"/>元
						</td>
				
						<td class="left" width="20%">
							初始里程数：
						</td>
						<td class="right">
						    <s:property value="initmile"/>公里
						</td>
				
						<td class="left" width="20%">
							保养间隔里程：
						</td>
						<td class="right">
						     <s:property value="mainmile"/>公里
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							保养周期：
						</td>
						<td class="right">
						    <s:property value="maincycle"/>
						</td>
					
						<td class="left" width="20%">
							所属部门：
						</td>
						<td class="right">
						    <s:property value="departm"/>
						</td>
					
						<td class="left" width="20%">
							当前状态：
						</td>
						<td class="right">
						    <s:property value="carstats"/>
						</td>
					</tr>
					 <tr>
						<td class="left" width="20%">
							备注：
						</td>
						<td class="right">
							<s:property value="cardes"/>
						</td>
					</tr>
					 
					 
					 
					 
					<tr>
					   <td></td>
					   <td></td>
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
