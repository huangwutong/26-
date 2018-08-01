<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>改密码</title>
<link href="../../css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="title">
  <h2>添加新行业</h2>
</div>
<script language="javascript" type="text/javascript">
function chick()
{
    var a = true;
    if(form1.industry.value=="")
    {
        document.getElementById("olderror").innerHTML="<font color='#ff0000'>新行业不可以为空</font>";
        form1.industry.focus();
        a = false;
    }
    if(a)
    {
        document.form1.submit();
    }
}
</script>
<form name="form1" method="post" action="../../addIndustry">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="contentList"><table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
          <td width="16%" class="contentListTdColName">新行业</td>          
          <td width="84%" class="contentListTd"><input name="industry" type="text" id="industry" value="" size="20" maxlength="20" />*
          <span id="olderror" />
	      </td>
        </tr>
        <tr>
          <td height="37" class="contentListTdColName">&nbsp;</td>
          <td class="contentListTd">
          <a href="javascript:chick();" class="pagenum">添加</a>
          <a href="javascript:document.personnelForm.reset();" class="pagenum">重填</a>
		  </td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
  <div id="helpContent"> 
  	<div class="title">温馨提示:</div>
  	<div class="Content">&nbsp;</div>
  </div>
</body>
</html>
