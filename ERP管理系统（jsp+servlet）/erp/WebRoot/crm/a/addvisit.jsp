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
  <h2>添加拜访记录</h2>
</div>
<script language="javascript" type="text/javascript">
function chick()
{
    if(form1.delectSake.value.length<20)
    {
        document.getElementById("delectSakeError").innerHTML="<font color='#ff0000'>日志不够详细</font>";
        form1.delectSake.focus();
        return false;
    }
    else
    {
    	var bool = 0;
    	for(var i = 0;i<20;i++)
    	{
    		if(/^[\r]/.test(form1.delectSake.value))
    		{
    			bool = bool+1;
    		}
    	}
    	if(bool>0)
    	{
    		document.getElementById("delectSakeError").innerHTML="<font color='#ff0000'>日志里要这么多的换行吗??</font>";
        	form1.delectSake.focus();
    		return false;
    	}
    }
    if(form1.visittype[0].checked==false && form1.visittype[1].checked==false)
    {
        document.getElementById("visittypeerror").innerHTML="<font color='#ff0000'>请正确的选择你的拜访方式</font>";
        return false;
    }
    if(form1.type[0].checked==false && form1.type[1].checked==false && form1.type[2].checked==false && form1.type[3].checked==false && form1.type[4].checked==false)
    {
        document.getElementById("typeerror").innerHTML="<font color='#ff0000'>请正确的选择你的客户现在的级别</font>";
        return false;
    }
    document.form1.submit();
}
</script>
<form name="form1" method="post" action="addVisit?linkmanid=${requestScope.linkman}">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">操作：<a href="selectA" class="pagenum" >返回A库</a>&nbsp;&nbsp;&nbsp;<a href="turn?type=ai" class="pagenum" >返回客户信息</a></td>
  </tr>
  <tr>
    <td class="contentList">
    <table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
      	<tr>
          <td width="16%" class="contentListTdColName">客户级别</td>
          <td width="84%" class="contentListTd">
			<input name="type" id="type" type="radio" value="A" /><strong><font size="6">A级</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input name="type" id="type" type="radio" value="B" /><strong><font size="6">B级</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="type" id="type" type="radio" value="C" /><strong><font size="6">C级</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="type" id="type" type="radio" value="D" /><strong><font size="6">D级</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="type" id="type" type="radio" value="E" /><strong><font size="6">E级</font></strong><span id="typeerror"></span>
			</td>
        </tr>
        <tr>
          <td width="16%" class="contentListTdColName">拜访类型</td>
          <td width="84%" class="contentListTd">
			<!-- <input name="visittype" id="visittype" type="radio" value="C" />Email -->
			<input name="visittype" type="radio" value="A" /><strong><font size="6">电话</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="visittype" type="radio" value="B" /><strong><font size="6">上门</font></strong><span id="visittypeerror"></span>
		  </td>
        </tr>
        <tr>
          <td class="contentListTdColName">拜访日志</td>
          <td class="contentListTd">
          	<textarea name="delectSake" cols="40" rows="6" maxlength=2000></textarea>*[最少20个字,最长2000字]<span id="delectSakeError"/>
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
				拜访记录是不可以修改的，请确认您添加信息的准确性！<br/>
				同时提醒您，请详细填写你的拜访记录，这个是您的经理考核您的指标之一<br/>
			</div>
		</div>
</body>
</html>
