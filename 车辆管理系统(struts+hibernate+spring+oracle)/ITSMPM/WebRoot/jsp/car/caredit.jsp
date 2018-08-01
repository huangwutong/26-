<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		 

		<title>修改新车辆</title>
 	 
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/styles/admin.css"
			type="text/css"></link>
			<s:head/>
	</head>
	<body>
		<div class="pageTitle">
			修改新车辆
		</div>
		<s:form  method="post"
			action="upCar" theme="simple">
			<s:iterator value="message">
			<input type="hidden" name="carbstbid" value="<s:property value="carbstbid"/>">
			
			<div id="left" style="float: left; width: 100%">
				<table class="border" width=100% cellSpacing=0 cellPadding=2
					align="center">
					<tr>
						<td class="left" width="20%">
							车牌号：
						</td>
						<td class="right">
							<s:textfield name="carnum" value="%{carnum}" maxlength="8"></s:textfield>
						</td>
					
						<td class="left" width="20%">
							品牌：
						</td>
						<td class="right">

							<s:textfield name="brand" value="%{brand}" maxlength="10"></s:textfield>

						</td>
				
						<td class="left" width="20%">
							型号：
						</td>
						<td class="right">
							<s:textfield name="cmode" value="%{cmode}" maxlength="10"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							车辆类别：
						</td>
						<td class="right">
							<s:textfield name="carkind" value="%{carkind}" maxlength="10"></s:textfield>
						</td>
					
						<td class="left" width="20%">
							耗油量：
						</td>
						<td class="right">
							<s:textfield name="fconsu" value="%{fconsu}" maxlength="10"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							发动机号：
						</td>
						<td class="right">
							<s:textfield name="enginum" value="%{enginum}" maxlength="10"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							车架号：
						</td>
						<td class="right">
							<s:textfield name="framenum" value="%{framenum}" maxlength="20"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							载重：
						</td>
						<td class="right">
							<s:textfield name="carload" value="%{carload}" maxlength="10"></s:textfield>
						</td>
				
						<td class="left" width="20%">
							座位数：
						</td>
						<td class="right">
							<s:textfield name="seatnum" value="%{seatnum}" maxlength="10"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							驾驶员：
						</td>
						<td class="right">
							<s:textfield name="driver" value="%{driver}" maxlength="10"></s:textfield>
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
							<s:textfield name="buyunit" value="%{buyunit}" maxlength="15"></s:textfield>
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							购买价格：
						</td>
						<td class="right">
							<s:textfield name="buyprice" value="%{buyprice}" maxlength="10"></s:textfield>元
						</td>
					
						<td class="left" width="20%">
							初始里程数：
						</td>
						<td class="right">
							<s:textfield name="initmile" value="%{initmile}" maxlength="10"></s:textfield>公里
						</td>
					
						<td class="left" width="20%">
							保养间隔里程：
						</td>
						<td class="right">
							<s:textfield name="mainmile" value="%{mainmile}" maxlength="10"></s:textfield>公里
						</td>
					</tr>
					 
					<tr>
						<td class="left" width="20%">
							保养周期：
						</td>
						<td class="right">
							<s:textfield name="maincycle" value="%{maincycle}" maxlength="10"></s:textfield>月
						</td>
				
						<td class="left" width="20%">
							所属部门：
						</td>
						<td class="right">
							<s:textfield name="departm" value="%{departm}" maxlength="10"></s:textfield>
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
							<s:textfield name="cardes" value="%{cardes}" maxlength="100"></s:textfield>
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
