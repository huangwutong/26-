<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加拜访记录</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="title">
  <h2>添加导航网子页面</h2>
</div>
<script language="javascript" type="text/javascript">
function inserthtml()
{
	document.getElementById("t").innerHTML=document.form1.img.value;
}
function chick()
{
	if(document.form1.industry.value=='')
	{
		document.getElementById("ierror").innerHTML='请选择所属的导航网';
		return false;
	}
	else
	{
		document.getElementById("ierror").innerHTML='';
	}
	if(document.form1.curl.value=='')
	{
		document.getElementById("cerror").innerHTML='请填写导航网的中文路径';
		return false;
	}
	else
	{
		document.getElementById("cerror").innerHTML='';
	}
	if(document.form1.img.value=='')
	{
		document.getElementById("t").innerHTML='请选择这个导航网的图片';
		return false;
	}
    document.form1.submit();
}
</script>
<form name="form1" method="post" action="addSort" enctype="multipart/form-data">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">操作：</td>
  </tr>
  <tr>
    <td class="contentList">
    <table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
      	<tr>
          <td width="16%" class="contentListTdColName">所属导行网</td>
          <td width="84%" class="contentListTd">
			<select id="0" name="industry">
         	<option value="" selected="selected">请选择...</option>
			<c:forEach items="${applicationScope.industry}" var="industr">
				<option value="${industr.industryid }">${industr.industry }</option>
			</c:forEach>
		</select><span id="ierror"/>
			</td>
        </tr>
        <tr>
          <td width="16%" class="contentListTdColName">子面页中文路径</td>
          <td width="84%" class="contentListTd">
			<input name="curl" type="text" id="curl" value="" size="40" maxlength="25" />[可以为空,最多输入25个字]<span id="cerror"/>
		  </td>
        </tr>
        <tr> 
          <td width="16%" class="contentListTdColName">子面页图片</td>
          <td width="84%" class="contentListTd">
          	&nbsp;
			<input name="img" type="file" style="position:absolute;clip:rect(auto auto auto 155px)" onchange="inserthtml();" />
			<br/>
			<br/>
			<span id="t"/>
			</td>
        </tr>
        <tr>
          <td class="contentListTd" colspan=2 align="center">
          <a href="javascript:void chick();" class="pagenum">添加</a>
          <a href="javascript:document.form1.reset();" class="pagenum">重填</a>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
		<div id="helpContent">
			<div class="title">
				温馨提示:
			</div>
			<div class="Content">
				<br/>
				<br/>
			</div>
		</div>

</body>
</html>
