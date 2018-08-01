<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户搜索</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script language="JavaScript" type="text/javascript" src="js/changedate.js"></script>
<div class="title">
  <h2>查询拜访</h2>
</div>
<form action="vList" name="form1">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="searchBar">
	员工名:	<select name="personnelid">
				<option value="" selected="selected">--请选择--</option>
				<c:forEach items="${sessionScope.user.dept.personnels}" var="personn">
 						<c:if test="${personn.outdate == null }">
 							<option value="${personn.personnelid }">${personn.realname }</option>
 						</c:if>
 				</c:forEach>
 			 </select>
 			起始时间<input id="gotime" name="gotime" readonly="readonly" size=10 onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>
 			结束时间<input id="endtime" name="endtime" readonly="readonly" size=10 onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>
 			拜访类型<select name="visittype">
				<option value="" selected="selected">--请选择--</option>
				<option value="A">电话</option>
				<option value="B">上门</option>
 			 	</select>
 			<a href="javascript:document.form1.submit();" class="pagenum">搜索</a>&nbsp;${requestScope.csize }
    </td>
  </tr>
  <tr>
    <td class="contentList">
    <table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2 spaceBottom">
    <c:forEach items="${requestScope.pageRows}" var="visit">
		<tr>
			<td width="30" class="contentListTdColName">公司:</td>
			<td width="200" class="contentListTdColName3">&nbsp;${visit.company.nameparticular }</td>
			<td width="50" class="contentListTdColName">业务员:</td>
			<td width="40" class="contentListTdColName3">&nbsp;${visit.personnel.realname }</td>
			<td width="50" class="contentListTdColName">联系人:</td>
			<td width="50" class="contentListTdColName3">&nbsp;${visit.linkman.linkmanname }</td>
			<td width="30" class="contentListTdColName">职位: </td>
          	<td width="50" class="contentListTdColName3">&nbsp;${visit.linkman.job }</td>
          	<td width="30" class="contentListTdColName">电话: </td>
          	<td width="50" class="contentListTdColName3">&nbsp;${visit.linkman.linkmanphone }</td>
          	<td width="30" class="contentListTdColName">手机: </td>
          	<td width="40" class="contentListTdColName3">&nbsp;${visit.linkman.linkmanmoblie }</td>
		</tr>
		<tr>
			<td class="contentListTd" colspan="12">[${visit.visittime }]-[
										<c:if test="${visit.visittype=='A'}">
											电话
										</c:if>
										<c:if test="${visit.visittype=='B'}">
											上门
										</c:if>
										]:${visit.visitlog }</td>
		</tr>
	</c:forEach>
	</table>
	${requestScope.htmlPage }
	</td>
  </tr>
</table>
</form>
<div id="helpContent">
  <div class="title">搜索提示：</div>
  <div class="Content">请详细填写搜索内容，这样可以更加准确的搜索到您要的客户</div>
</div>
</body>
</html>