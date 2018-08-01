<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp" %>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广告位详细信息</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="title">
			<h2>广告位详细信息</h2>
		</div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
			<tr>
				<td class="attachMenu"><strong>广告位信息</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td class="contentList">
					<table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
						<tr>
							<td width="16%" class="contentListTdColName">广告位所在子面页</td>
							<td width="84%" class="contentListTd">&nbsp;${requestScope.bill.sort.sortName}</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位编号</td>
							<td width="84%" class="contentListTd">&nbsp;${requestScope.bill.billNo}</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位类型</td>
							<td width="84%" class="contentListTd">&nbsp;${requestScope.bill.billType.billTypeName}
							</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位报价</td>
							<td width="84%" class="contentListTd">&nbsp;${requestScope.bill.billPrice}</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位状态</td>
							<td width="84%" class="contentListTd">&nbsp;
							<c:if test="${requestScope.bill.billState=='A'}">闲置</c:if>
							<c:if test="${requestScope.bill.billState=='B'}">已预定</c:if>
							<c:if test="${requestScope.bill.billState=='C'}">已售出</c:if>
							</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位已售出价格</td>
							<td width="84%" class="contentListTd">&nbsp;
							${requestScope.bill.billBargainMoney}元
							</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位已售出时间</td>
							<td width="84%" class="contentListTd">&nbsp;
							${requestScope.bill.billBargainTime}个月
							</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位说明</td>
							<td width="84%" class="contentListTd">&nbsp;
							${requestScope.bill.billRemark}
							</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位所属业务员</td>
							<td width="84%" class="contentListTd">&nbsp;
							${requestScope.bill.personnel.realname}
							</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">广告位所属客户</td>
							<td width="84%" class="contentListTd">&nbsp;
							${requestScope.bill.company.nameparticular}
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div class="lineSpace"></div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
			<tr>
				<td class="attachMenu"><strong>该广告位的订单</strong></td>
			</tr>
			<tr>
				<td class="contentList">
						<table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2 spaceBottom">
						<c:forEach items="${requestScope.bill.destineNote}" var="destine">
							<tr>
								<td width="100" class="contentListTdColName">预定人</td>
								<td width="40%" class="contentListTdColName3">&nbsp;${destine.personnel.realname }</td>
								<td width="100" class="contentListTdColName">预定客户: </td>
          						<td width="40%" class="contentListTdColName3">&nbsp;${destine.company.nameparticular }</td>
          						<td width="100" class="contentListTdColName">预定日期 </td>
          						<td width="40%" class="contentListTdColName3">&nbsp;${destine.destineDate }</td>
          						<td width="100" class="contentListTdColName">续定日期 </td>
          						<td width="40%" class="contentListTdColName3">&nbsp;${destine.postponeDate }</td>
							</tr>
							<tr>
								<td width="100" class="contentListTdColName">总时长 </td>
          						<td width="40%" class="contentListTdColName3">&nbsp;${destine.destime }</td>
          						<td width="100" class="contentListTdColName">结束状态 </td>
          						<td width="40%" class="contentListTdColName3">&nbsp;${destine.ending }</td>
          						<td width="100" class="contentListTdColName">结束原因 </td>
          						<td width="40%" class="contentListTdColName3">&nbsp;${destine.whys }</td>
          						<td width="100" class="contentListTdColName">结束日期 </td>
          						<td width="40%" class="contentListTdColName3">&nbsp;${destine.endingDate }</td>
							</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
		</table>
	</body>
</html>
