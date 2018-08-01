<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>员工列表</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/crm.js"></script>
<script language="javascript" type="text/javascript">
var ids = "";
function getid(page)
{
    for(var i = tablecompany.rows.length - 2; i > 0; i--)
	{
		if(tablecompany.rows(i).getElementsByTagName("input").length!=0)
		{
			if(tablecompany.rows(i).getElementsByTagName("input").item(0).checked)
			{
           		ids = ids + tablecompany.rows(i).getElementsByTagName("input").item(0).value + ",";
			}
		}
	}
	ids = ids.substr(0,ids.length - 1);
	form1.action = "pass?size="+page+"&cleintids="+ids;
	if(ids != "")
	{
		document.form1.submit();
	}
}
function out(page)
{
    for(var i = tablecompany.rows.length - 2; i > 0; i--)
	{
		if(tablecompany.rows(i).getElementsByTagName("input").length!=0)
		{
			if(tablecompany.rows(i).getElementsByTagName("input").item(0).checked)
			{
           		ids = ids + tablecompany.rows(i).getElementsByTagName("input").item(0).value + ",";
			}
		}
	}
	ids = ids.substr(0,ids.length - 1);
	form1.action = "out?size="+page+"&cleintids="+ids;
	if(ids != "")
	{
		document.form1.submit();
	}
}
function rout(page)
{
    for(var i = tablecompany.rows.length - 2; i > 0; i--)
	{
		if(tablecompany.rows(i).getElementsByTagName("input").length!=0)
		{
			if(tablecompany.rows(i).getElementsByTagName("input").item(0).checked)
			{
           		ids = ids + tablecompany.rows(i).getElementsByTagName("input").item(0).value + ",";
			}
		}
	}
	ids = ids.substr(0,ids.length - 1);
	form1.action = "rout?size="+page+"&cleintids="+ids;
	if(ids != "")
	{
		document.form1.submit();
	}
}
</script>
</head>
<body>
<div class="title">
<h2>员工列表</h2>
</div>
<form id="form1" name="form1" method="post" action="#">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">
    选择：<a href="javascript:formObj.chooseAll(true);" class="pagenum">全选</a>&nbsp;&nbsp;
    <a href="javascript:formObj.chooseAll(false);" class="pagenum">取消</a>&nbsp;&nbsp;
    操作： <a href="turn?type=ap" class="pagenum">添加员工</a>&nbsp;&nbsp;
    <a href="javascript:getid(${requestScope.size });" class="pagenum">转正</a>&nbsp;&nbsp;
    <a href="javascript:rout(${requestScope.size });" class="pagenum">申请离职</a>&nbsp;&nbsp;
    <a href="javascript:out(${requestScope.size });" class="pagenum">离职</a>&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;${requestScope.csize }</td>
  </tr>
  <tr>
    <td class="contentList"><table id="tablecompany" width="100%" border="0" cellpadding="8" cellspacing="1" class="contentListTable">
      <tr class="contentListTable2">
        <td width="4%">&nbsp;</td>
        <td width="10%">员工名</td>
        <td width="6%">工号</td>
        <td width="14%">所属公司</td>
        <td width="14%">所在部门</td>
        <td width="12%">职位</td> 
        <td width="10%">性别</td>
        <td width="10%">学历</td>
        <td width="10%">员工状态</td>
        <td width="10%">详细</td>
      </tr>
<c:forEach items="${requestScope.pageRows}" var="personnel">
    <tr class="contentListTd">
      <td>&nbsp;<input type="checkbox" name="idnum" value="${personnel.personnelid}"/></td>        
      <td>&nbsp;${personnel.realname } </td>
      <td>&nbsp;${personnel.jobid } </td>
      <td>&nbsp;${personnel.dept.grade.deptname }</td>
      <td>&nbsp;${personnel.dept.deptname }</td>
      <td>&nbsp;${personnel.position.job }</td>
      <td>&nbsp;<c:if test="${personnel.sex == 0 }">女</c:if><c:if test="${personnel.sex == 1 }">男</c:if></td>
      <td>&nbsp;
      	<c:if test="${personnel.academic == 'C'}">高中(中专)</c:if>
		<c:if test="${personnel.academic == 'D'}">大专</c:if>
		<c:if test="${personnel.academic == 'E'}">本科</c:if>
		<c:if test="${personnel.academic == 'F'}">研究生</c:if>
		<c:if test="${personnel.academic == 'G'}">博士</c:if>
		<c:if test="${personnel.academic == 'H'}">博士后</c:if>
      </td>
      <td>&nbsp;
      <c:if test="${personnel.outdate!=null }">已离职</c:if>
      <c:if test="${personnel.outdate==null&&personnel.passdate!=null }">已转正</c:if>
      <c:if test="${personnel.outdate==null&&personnel.passdate==null }">试用期</c:if>
      </td>
      <td><a href="personnelInfo?personnelid=${personnel.personnelid}&size=${requestScope.size }"><img src="images/btn_01.gif" width="15" height="15" border="0" /></a></td>
    </tr>
</c:forEach>
      <tr class="contentListTd">
        <td colspan="11"> ${requestScope.htmlPage }</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<script language="javascript" type="text/javascript">
	var formObj = new dean.form(document.form1);
</script>
<div id="helpContent">
  <div class="title">温馨提示：</div>
  <div class="Content">

  </div>
</div>
</body>
</html>