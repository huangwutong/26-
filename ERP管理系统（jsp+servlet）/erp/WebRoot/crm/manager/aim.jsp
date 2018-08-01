<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>制定目标</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<form name="form1" action="aim" method="post">
			<table width="100%" border="0" cellpadding="8" cellspacing="1"
				class="contentArea">
				<tr>
					<td class="attachMenu">
						制定目标
					</td>
				</tr>
				<tr>
					<td class="contentList">
						<table width="100%" border="0" cellspacing="1" cellpadding="8"
							class="contentListTable2">
							<tr>
								<td class="contentListTdColName" width="10%">
									本月目标金额
								</td>
								<td class="contentListTd">
									<div class="error">
										<select name="aim">
											<option value="5">
												5万
											</option>
											<option value="6">
												6万
											</option>
											<option value="7">
												7万
											</option>
											<option value="8">
												8万
											</option>
											<option value="9">
												9万
											</option>
											<option value="10">
												10万
											</option>
											<option value="11">
												11万
											</option>
											<option value="12">
												12万
											</option>
											<option value="13">
												13万
											</option>
											<option value="14">
												14万
											</option>
											<option value="15">
												15万
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="37" class="contentListTdColName">
									&nbsp;
								</td>
								<td class="contentListTd">
									<a href="javascript:document.form1.submit();"
										class="pagenum">制定</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		<div id="helpContent">
			<div class="title">
				温馨提示：
			</div>
			<div class="Content">
				祝你达成你定的目标
			</div>
		</div>
	</body>
</html>
