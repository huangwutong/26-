<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加客户-2</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="title">
			<h2>
				关键字查询结果
			</h2>
		</div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
			<tr>
				<td class="attachMenu">
				你输入的关键字是:${sessionScope.keyword }
					<a href="chick" class="pagenum">重新输入</a>
					<a href="turn?type=add" class="pagenum">继续添加</a>
				</td>
			</tr>
			<tr>
				<td class="contentList">
					<table width="100%" border="0" cellpadding="8" cellspacing="1"
						class="contentListTable">
						<tr class="contentListTable2">
							<td width="17%">
								客户关键字
							</td>
							<td width="37%">
								客户公司名
							</td>
							<td width="13%">
								添加客户日期
							</td>
							<td width="10%">
								跟进人
							</td>
							<td width="9%">
								加入A库
							</td>
							<td width="9%">
								详细信息
							</td>
						</tr>
						<c:forEach items="${sessionScope.keywords}" var="company">
								<tr class="contentListTd">
									<td>
										&nbsp;
										${company.namekeywords }
									</td>
									<td>
										&nbsp;
										${company.nameparticular }
									</td>
									<td>
										&nbsp;
										${company.adddate }
									</td>
									<td>
										&nbsp;${company.personnel.realname }
									</td>
									<td>
										<c:if test="${company.personnel == null}">
										<a href="cToa?cleintids=${company.companyid}&i=1"><img src="images/btn_01.gif" width="15" height="15"	border="0" /></a>
										</c:if>
									</td>
									<td>
									<c:if test="${company.personnel == null}">
										<a href="cinfo?companyid=${company.companyid}"><img src="images/btn_01.gif" width="15" height="15"	border="0" /></a>
									</c:if>
									</td>
								</tr>
								</c:forEach>
					</table>
				</td>
			</tr>
		</table>
		<div id="helpContent">
			<div class="title">
				操作提示:
			</div>
			<div class="Content">
				如果在这里出现的客户有您好要的客户，请点击
				<img src="images/btn_01.gif" width="15" height="15" border="0" />
				加入到您的A库。如果没有您要的客户，请点击继续添加客户信息。
			</div>
		</div>
	</body>
</html>
