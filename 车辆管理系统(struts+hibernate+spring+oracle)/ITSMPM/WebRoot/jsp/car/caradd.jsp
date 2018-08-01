<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		 

		<title>添加新车辆</title>
 	 
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			添加新车辆
		</div>
		<s:form  method="post"
			action="saveCar" theme="simple">
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					<tr>
						<td class="left" width="20%">
							车牌号：
						</td>
						<td class="right">
							<s:textfield name="carnum" value="" maxlength="8"></s:textfield>
						</td>
					
						<td class="left" width="20%">
							品牌：
						</td>
						<td class="right">

							<s:textfield name="brand" value="" maxlength="10"></s:textfield>

						</td>
				
						<td class="left" width="20%">
							型号：
						</td>
						<td class="right">
							<s:textfield name="cmode" value="" maxlength="10"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							车辆类别：
						</td>
						<td class="right">
							<s:textfield name="carkind" value="" maxlength="10"></s:textfield>
						</td>
					
						<td class="left" width="20%">
							耗油量：
						</td>
						<td class="right">
							<s:textfield name="fconsu" value="" maxlength="10"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							发动机号：
						</td>
						<td class="right">
							<s:textfield name="enginum" value="" maxlength="10"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							车架号：
						</td>
						<td class="right">
							<s:textfield name="framenum" value="" maxlength="20"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							载重：
						</td>
						<td class="right">
							<s:textfield name="carload" value="" maxlength="10"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							座位数：
						</td>
						<td class="right">
							<s:textfield name="seatnum" value="" maxlength="10"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							驾驶员：
						</td>
						<td class="right">
							<s:textfield name="driver" value="" maxlength="10"></s:textfield>
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
							<s:textfield name="buyunit" value="" maxlength="15"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							购买价格：
						</td>
						<td class="right">
							<s:textfield name="buyprice" value="" maxlength="10"></s:textfield>元
						</td>
					
						<td class="left" width="20%">
							初始里程数：
						</td>
						<td class="right">
							<s:textfield name="initmile" value="" maxlength="10"></s:textfield>公里
						</td>
					
						<td class="left" width="20%">
							保养间隔里程：
						</td>
						<td class="right">
							<s:textfield name="mainmile" value="" maxlength="10"></s:textfield>公里
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							保养周期：
						</td>
						<td class="right">
							<s:textfield name="maincycle" value="" maxlength="10"></s:textfield>月
						</td>
				
						<td class="left" width="20%">
							所属部门：
						</td>
						<td class="right">
							<s:textfield name="departm" value="" maxlength="10"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							当前状态：
						</td>
						<td class="right">
						    <s:select   list="#{'可用':'可用','出车':'出车','维修':'维修'}"  name="carstats" /> 
						</td>
					</tr>
					 <tr>
						<td class="left" width="20%">
							备注：
						</td>
						<td class="right">
							<s:textfield name="cardes" value="" maxlength="100"></s:textfield>
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
