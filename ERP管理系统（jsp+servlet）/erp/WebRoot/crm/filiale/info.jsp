<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>客户信息</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="title">
			<h2>客户信息</h2>
		</div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
			<tr>
				<td class="attachMenu"><strong>基本资料</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				一共拜访了这个客户:${requestScope.info.visitcount }次</td>
			</tr>
			<tr>
				<td class="contentList">
					<table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
						<tr>
							<td width="16%" class="contentListTdColName">关键字</td>
							<td width="84%" class="contentListTd">&nbsp;${requestScope.info.namekeywords}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">公司名</td>
							<td class="contentListTd">&nbsp;${requestScope.info.nameparticular}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">公司地址</td>
							<td class="contentListTd">&nbsp;${requestScope.info.companyaddress}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">网址</td>
							<td class="contentListTd">&nbsp;${requestScope.info.neturl}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">所在城市</td>
							<td class="contentListTd">&nbsp;${requestScope.info.district.district }</td>
						</tr>
						<tr>
							<td class="contentListTdColName">客户等级</td>
								<td class="levelA">&nbsp;${requestScope.info.type}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">所在行业</td>
							<td class="contentListTd">&nbsp;${requestScope.info.industry.industry }</td>
						</tr>
						<tr>
							<td class="contentListTdColName">介绍</td>
							<td class="contentListTd">&nbsp;${requestScope.info.companynarrate}</td>
						</tr>
						<tr>
							<td class="contentListTd contentListTdAlign" colspan="2">操作
							<c:if test="${requestScope.c!=null}">
								<a href="fcList?page=${sessionScope.page }" class="pagenum" >返回</a>&nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${requestScope.s!=null}">
								<a href="fscarchc?${sessionScope.pp }" class="pagenum" >返回</a>&nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${requestScope.f!=null}">
								<a href="fCompany?${sessionScope.p }" class="pagenum" >返回</a>&nbsp;&nbsp;&nbsp;
							</c:if>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div class="lineSpace"></div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
			<tr>
				<td class="attachMenu"><strong>联系人信息/拜访记录户</strong></td>
			</tr>
			<c:forEach items="${requestScope.info.linkmans}" var="linkman">
			<tr>
				<td class="contentList">
						<table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2 spaceBottom">
							<tr>
							<c:if test="${requestScope.c!=null}">
								<td width="100" class="contentListTdColName">姓名:</td>
								<td width="40%" class="contentListTdColName3">&nbsp;${linkman.linkmanname }</td>
								<td width="100" class="contentListTdColName">职位: </td>
          						<td width="40%" class="contentListTdColName3">&nbsp;${linkman.job }</td>
							</c:if>
							<c:if test="${requestScope.s!=null}">
								<td width="100" class="contentListTdColName">姓名:</td>
								<td width="40%" class="contentListTdColName3">&nbsp;${linkman.linkmanname }</td>
								<td width="100" class="contentListTdColName">职位: </td>
          						<td width="4%" class="contentListTdColName3">&nbsp;${linkman.job }</td>
							</c:if>
							<c:if test="${requestScope.f!=null}">
								<td width="50" class="contentListTdColName">姓名:</td>
								<td width="14%" class="contentListTdColName3">&nbsp;${linkman.linkmanname }</td>
								<td width="50" class="contentListTdColName">职位: </td>
          						<td width="12%" class="contentListTdColName3">&nbsp;${linkman.job }</td>
								<td width="50" class="contentListTdColName">电话:</td>
								<td width="12%" class="contentListTdColName3">&nbsp;${linkman.linkmanphone }</td>
								<td width="50" class="contentListTdColName">Email:</td>
								<td width="12%" class="contentListTdColName3">&nbsp;${linkman.linkmanemail }</td>
								<td width="50" class="contentListTdColName">手机:</td>
								<td class="contentListTdColName3">&nbsp;${linkman.linkmanmoblie }</td>
							</c:if>
							</tr>
						<c:forEach items="${linkman.visits}" var="visit">
						<tr>
							<td class="contentListTd" colspan="10">[${visit.visittime }]-[
										<c:if test="${visit.visittype=='A'}">
											电话
										</c:if>
										<c:if test="${visit.visittype=='B'}">
											上门
										</c:if>
										]:${visit.visitlog }</td>
						</tr>
						<c:if test="${linkman.visits == '[]' }">
						<tr>
							<td class="contentListTd" colspan="10">没有拜访</td>
						</tr>
						</c:if>
						</c:forEach>
						</table>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>
