<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加客户-1</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="title">
  <h2>添加客户</h2>
</div>
<script language="javascript" type="text/javascript">
function chick()
{
    var a = true;
    if(key.keyword.value=="")
    {
        document.getElementById("error").innerHTML="<font color='#ff0000'>关键字不可以为空</font>";
        key.keyword.focus();
        a = false;
    }
    else if(key.keyword.value.length<1)
    {
        document.getElementById("error").innerHTML="<font color='#ff0000'>关键字不可以少于一个汉字</font>";
        key.keyword.focus();
        a = false;
    }
    if(a)
    {
        document.key.submit();
    }
}
</script>
<form method="post" name="key" action="keywordSelect">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="contentList"><table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
          <td width="16%" class="contentListTdColName">客户关键字</td>          
          <td width="84%" class="contentListTd"><input name="keyword" type="text" id="keyword" value="" size="20" maxlength="20" />*[关键字不可以为空,最少要一个字]
          		<span id="error" />
	      </td>
        </tr>
        <tr>
          <td height="37" class="contentListTdColName">&nbsp;</td>
          <td class="contentListTd">
          <a href="javascript:chick();" class="pagenum">查询</a>
		  </td>
        </tr>
    </table>
    </td>
  </tr>
</table>
</form>
  <div id="helpContent"> 
  	<div class="title">关键字输入提示:</div>
  	<div class="Content">例:深圳市和鼎科技发展有限公司,关键字:和鼎科技。</div>
  </div>
</body>
</html>
