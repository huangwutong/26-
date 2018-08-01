<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加客户简介</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script language="javascript" type="text/javascript">
function chick()
{
	if(form1.narrate.value.length<=0)
	{
		document.getElementById("error").innerHTML="<font color='#ff0000'>添加的记录不可以为空</font>";
		form1.narrate.focus();
		return false;
	}
	document.form1.submit();
}
</script>
<div class="title">
  <h2>添加客户简介</h2>
</div>
<form name="form1" method="post" action="addNarrateb?companyid=${sessionScope.info.companyid}">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">操作：
    	<a href="select" class="pagenum" >返回B库</a>&nbsp;&nbsp;&nbsp;<a href="turn?type=bi" class="pagenum" >返回客户信息</a>
    </td>
  </tr>
  <tr>
    <td class="contentList">
    <table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
          <td class="contentListTdColName">公司简介</td>
          <td class="contentListTd">
          	<textarea name="narrate" cols="40" rows="6" maxlength="${(4000-requestScope.size)/2 }"></textarea>*[还可以增加${(4000-requestScope.size)/2 }字的简介]<span id="error"/>
          </td>
        </tr>
        <tr>
          <td height="37" class="contentListTdColName">&nbsp;</td>
          <td class="contentListTd">
          <a href="javascript:void chick();" class="pagenum">添加</a>
          <a href="javascript:document.form1.reset();" class="pagenum">重填</a>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
  <div id="helpContent">
  <div class="title">温馨提示:</div>
  <div class="Content">
  	不可以添加空的客户简介
  </div>
  </div>
</body>
</html>
