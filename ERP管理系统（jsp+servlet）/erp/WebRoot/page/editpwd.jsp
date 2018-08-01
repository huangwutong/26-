<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>改密码</title>
<link href="../css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="title">
  <h2>修改密码</h2>
</div>
<script language="javascript" type="text/javascript">
function chick()
{
    var a = true;
    if(form1.oldpwd.value=="")
    {
        document.getElementById("olderror").innerHTML="旧密码不可以为空";
        a = false;
    }
    if(form1.newpwd.value.length<6)
    {
        document.getElementById("newerror").innerHTML="新密码长度不可以少于6";
        a = false;
    }
    if(form1.newpwd.value != form1.newpwd2.value)
    {
        document.getElementById("new2error").innerHTML="新密码和确认密码不一致";
        a = false;
    }
    if(a)
    {
        document.form1.submit();
    }
}
</script>
<form name="form1" method="post" action="../editpwd">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="contentList"><table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
          <td width="16%" class="contentListTdColName">旧密码</td>          
          <td width="84%" class="contentListTd"><input name="oldpwd" type="password" id="oldpwd" value="" size="20" maxlength="20" />*
          <span id="olderror" />
	      </td>
        </tr>
        <tr>
          <td width="16%" class="contentListTdColName">新密码</td>          
          <td width="84%" class="contentListTd"><input name="newpwd" type="password" id="newpwd" value="" size="20" maxlength="20" />*
          		<span id="newerror" />
	      </td>
        </tr>
        <tr>
          <td width="16%" class="contentListTdColName">确认密码</td>          
          <td width="84%" class="contentListTd"><input name="newpwd2" type="password" id="newpwd2" value="" size="20" maxlength="20" />*
          		<span id="new2error" />
	      </td>
        </tr>
        <tr>
          <td height="37" class="contentListTdColName">&nbsp;</td>
          <td class="contentListTd">
          <a href="javascript:chick();" class="pagenum">修改</a>
          <a href="javascript:document.form1.reset();" class="pagenum">重填</a>
		  </td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
  <div id="helpContent"> 
  	<div class="title">温馨提示:</div>
  	<div class="Content">新密码不可以少于6位数字，密码最好采用数字加字母的方式</div>
  </div>
</body>
</html>
