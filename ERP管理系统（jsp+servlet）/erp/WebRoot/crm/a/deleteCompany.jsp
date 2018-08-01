<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>放弃客户</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="title">
  <h2>放弃客户</h2>
</div>
 <form name="form1" method="post" action="deleteCompany?cleintids=${requestScope.cleintids}">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">操作：<a href="selectA" class="pagenum" >返回A库</a></td>
  </tr>
  <tr>
    <td class="contentList"><table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
          <td class="contentListTdColName">放弃理由</td>
          <td class="contentListTd">        
			<input name="delectSake" id="delectSake" type="radio" value="客户已与竞争对手合作" />客户已与竞争对手合作
			<input name="delectSake" id="delectSake" type="radio" value="客户暂时没有预算" checked="checked"/>客户暂时没有预算<br/>
			<input name="delectSake" id="delectSake" type="radio" value="客户不认同我们的产品"  />客户不认同我们的产品
			<input name="delectSake" id="delectSake" type="radio" value="客户没有广告需求"  />客户没有广告需求
          </td>
        </tr>
        <tr>
          <td height="37" class="contentListTdColName">&nbsp;</td>
          <td class="contentListTd">
          <div class="error">
          <a href="javascript:document.form1.submit();" class="pagenum">放弃</a>
          </div></td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
  <div id="helpContent">
  <div class="title">温馨提示：</div>
  <div class="Content">请确定！您真的要放弃这个客户了吗？？？</div>
</div>

</body>
</html>
