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
			<h2>客户统计</h2>
		</div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1"
			class="contentArea">
			<tr>
				<td class="contentList">
					<table width="100%" border="0" cellspacing="1" cellpadding="8"
						class="contentListTable2">
						<tr class="contentListTd">
							<td width="16%" class="contentListTdColName1" align="center">
								<h2>${requestScope.all }</h2>
							</td>
						</tr>
						<c:if test="${requestScope.alltype!=null}">
						<tr class="contentListTd">
							<td width="16%" class="contentListTdColName1">
							<h4>
							&nbsp;
								<c:forEach items="${requestScope.alltype }" var="type">
									${type }&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
							</h4>
							</td>
						</tr>
						</c:if>
						<c:forEach items="${requestScope.user }" var="us">
						<tr class="contentListTd">
							<td width="16%" class="contentListTdColName1">
							<h5>
									${us }
							</h5>
							</td>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
