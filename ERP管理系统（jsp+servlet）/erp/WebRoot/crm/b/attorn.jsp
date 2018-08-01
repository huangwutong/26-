<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>请选择接受转让的人</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
<script type="text/javascript" language="JavaScript">
function chack()
{
	if(form1.personnel.value!="")
	{
		document.form1.submit();
	}
	else
	{
		document.getElementById('error').innerHTML="请选择一个员工"
	}
}
</script>
<form id="form1" name="form1" method="post" action="attornb?cleintids=${requestScope.cleintids}">
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">请选择接受转让的人</td>
  </tr>
  <tr>
    <td class="contentList">
    <table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
          <td class="contentListTdColName" width="10%">接收转让人</td>
          <td class="contentListTd">
          <select name="personnel">
          <option value="" selected="selected">请选择..</option>
          <c:forEach items="${sessionScope.user.dept.personnels}" var="per">
          		<c:if test="${per.personnelid != sessionScope.user.personnelid }">
 					<option value="${per.personnelid }">${per.realname }</option>
 				</c:if>
 			</c:forEach>
		  </select>
		  <span id="error"></span>
         </td>
        </tr>
        <tr>
          <td class="contentListTd" colspan="2">
          <a href="javascript:chack();" class="pagenum">转让</a>
		</td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
<div id="helpContent">
  <div class="title">温馨提示：</div>
  <div class="Content">转让客户前，请先告之你的同事，让他进行接收。
  </div>
</div>
	</body>
</html>
