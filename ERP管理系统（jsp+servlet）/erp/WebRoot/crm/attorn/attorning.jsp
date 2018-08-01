<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>转让中的客户</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/crm.js"></script>
<script language="javascript" type="text/javascript">
	var formObj = new dean.form(document.form1);
</script>
<script language="javascript" type="text/javascript">
var ids = "";
function cencelattorn()
{
    for(var i = tablecompany.rows.length - 1; i > 0; i--)
	{		
		if(tablecompany.rows(i).getElementsByTagName("input").item(0).checked)
		{
           ids = ids + tablecompany.rows(i).getElementsByTagName("input").item(0).value + ",";
		}
	}
	ids = ids.substr(0,ids.length - 1);
	form1.action = "cancelAttorn?cleintids="+ids;
	if(ids != "")
	{
		document.form1.submit();
	}
}
</script>
</head>
<body>
<div class="title">
  <h2>正在转让中的客户</h2>
</div>
<form id="form1" name="form1" method="post" action="#">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="searchBar"><a href="javascript:cencelattorn();" class="pagenum">取消转让</a></td>
  </tr>
  <tr>
    <td class="contentList">
    <table id="tablecompany" width="100%" border="0" cellpadding="8" cellspacing="1" class="contentListTable">
      <tr class="contentListTable2">
        <td width="4%">&nbsp;</td>
        <td width="25%">公司名</td>
        <td width="30%">地址</td>
        <td width="16%">添加时间</td>
        <td width="10%">拜访次数</td>
        <td width="15%">最后拜访时间</td>
      </tr>      
<c:forEach items="${requestScope.cleints}" var="cleint">
      <tr class="contentListTd">
        <td><input type="checkbox" name="idnum" value="${cleint.companyid }"/></td>
        <td>&nbsp;${cleint.nameparticular }</td>
        <td>&nbsp;${cleint.companyaddress }</td>
        <td>&nbsp;${cleint.indate }</td>
        <td>&nbsp;${cleint.visitcount }</td>
      	<td>&nbsp;${cleint.lastvisitdate }</td>
      </tr>
</c:forEach>
    </table>
    </td>
  </tr>
</table>
</form>
<div id="helpContent">
  <div class="title">温馨提示：</div>
  <div class="Content">在取消转让之前，请先通知你的同事。告诉他不再进行转让的事情</div>
</div>
</body>
</html>