<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户列表</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/crm.js"></script>
<script language="javascript" type="text/javascript">
var ids = "";
function updateClient()
{
	var j = 0;
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
	form1.action = "cToa?cleintids="+ids+"&i="+j; 
	if(ids != "")
	{
		document.form1.submit();
	}
}
</script>
</head>
<body>



<div class="title">
  <h2>公共库</h2>
</div>
<form id="form1" name="form1" method="post" action="#">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">
    选择：<a href="javascript:formObj.chooseAll(true);" class="pagenum">全选</a>&nbsp;&nbsp;
    <a href="javascript:formObj.chooseAll(false);" class="pagenum">取消</a>&nbsp;&nbsp;
    操作： <a href="chick" class="pagenum">添加客户</a>&nbsp;&nbsp;
    <a href="javascript:updateClient()" class="pagenum">收藏</a>&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.csize }</td>
  </tr>
  <tr>
    <td class="contentList"><table id="tablecompany" width="100%" border="0" cellpadding="8" cellspacing="1" class="contentListTable">
      <tr class="contentListTable2">
        <td width="4%">&nbsp;</td>
        <td width="25%">客户公司名</td>
        <td width="10%">添加客户日期</td>        
        <td width="10%">拜访次数</td>
        <td width="10%">客户等级</td>
        <td width="10%">最后拜访日期</td>
        <td width="10%">放弃人</td>
        <td width="10%">所在行业</td>
        <td width="10%">客户详情</td>
      </tr>
<c:forEach items="${requestScope.pageRows}" var="company">
      <tr class="contentListTd">
        <td><input type="checkbox" name="idnum" value="${company.companyid}"/></td>        
        <td>&nbsp;${company.nameparticular } </td>
        <td>&nbsp;${company.adddate } </td>
        <td>&nbsp;${company.visitcount }</td>
        <td>&nbsp;${company.type }</td>
        <td>&nbsp;${company.lastvisitdate }</td>
		<td>&nbsp;${company.lastPersonnel.realname }</td>
		<td>&nbsp;${company.industry.industry }</td>
        <td><a href="cinfo?companyid=${company.companyid}"><img src="images/btn_01.gif" width="15" height="15" border="0" /></a></td>
      </tr>
</c:forEach>
      <tr class="contentListTd">
        <td colspan="10"> ${requestScope.htmlPage }</td>
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
  如果您要查看客户的详细资料，请点击<img src="images/btn_01.gif" width="15" height="15" border="0" />进入。
  <br/>客户的等级分类是按照“拜访制度”进行分类的;
  </div>
</div>
</body>
</html>