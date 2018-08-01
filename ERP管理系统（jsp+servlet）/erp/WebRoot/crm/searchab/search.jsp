<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户搜索</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/crm.js"></script>
<script language="JavaScript" type="text/javascript" src="js/changedate.js"></script>
<script language="javascript" type="text/javascript">
	var formObj = new dean.form(document.form1);
</script>
<script type="text/javascript" language="JavaScript">
function search(par,content)
{
	form1.content.value=content;
	form1.action=form1.action+par;
	form1.submit();
}
var ids = "";
function getid()
{
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
	form1.action = "turn?type=adc&cleintids="+ids;
	if(ids != "")
	{
		document.form1.submit();
	}
}
function attornCleint()
{
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
	
	form1.action = "turn?type=aa&cleintids="+ids; 
	if(ids != "")
	{
		document.form1.submit();
	}
}
</script>
</head>
<body>
<div class="title">
  <h2>搜索我的客户</h2>
</div>
<form name="form1" method="post" action="searchab">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="searchBar">搜索类型
	<select name="type">
		<option value="1">按公司名称</option>
		<option value="2">按公司地址</option>
		<option value="3">按联系人手机号码</option>
		<option value="4">按联系人电话</option>
		<option value="5">按联系人邮箱</option>
	</select>
	搜索内容:
		<input type="text" name="content" id="content" maxlength="50" />
	行业
 			<select name="industry">
         	<option value="" selected="selected">请选择...</option>
         	<c:if test="${sessionScope.d == 1}">
         	<c:forEach items="${applicationScope.industrys}" var="industry">
				<option value="${industry.industryid }">${industry.industry }</option>
			</c:forEach>
			</c:if>
			<c:if test="${sessionScope.d == 0}">
			<c:forEach items="${applicationScope.industry}" var="industr">
				<option value="${industr.industryid }">${industr.industry }</option>
			</c:forEach>
			</c:if>
		</select>		
 			起始时间<input id="gotime" name="gotime" readonly="readonly" size=10 onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>结束时间<input id="endtime" name="endtime" readonly="readonly" size=10 onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>
		<a href="javascript:document.form1.submit();" class="pagenum">搜索</a><span id="searcherror"/><br/>
		 操作： <a href="chick" class="pagenum">添加客户</a>&nbsp;&nbsp;
    <a href="javascript:getid();" class="pagenum">放弃客户</a>&nbsp;
    <a href="javascript:attornCleint();" class="pagenum">转让客户</a>&nbsp;
    </td>
  </tr>
  <tr>
    <td class="contentList"><table id="tablecompany" width="100%" border="0" cellpadding="8" cellspacing="1" class="contentListTable">
      <tr class="contentListTable2">
      	<td width="4%">&nbsp;</td>
        <td width="35%">客户公司名</td>
        <td width="10%">添加客户日期</td>        
        <td width="10%">拜访次数</td>
        <td width="10%">客户等级</td>
        <td width="10%">最后拜访日期</td>
        <td width="10%">所在行业</td>
        <td width="10%">客户详情</td>
      </tr>      
	<c:forEach items="${requestScope.search}" var="company">
      <tr class="contentListTd">
      	<td>&nbsp;<c:if test="${company.visitcount>0 }"><input type="checkbox" name="idnum" value="${company.companyid}"/></c:if></td>
        <td>&nbsp;${company.nameparticular } </td>
        <td>&nbsp;${company.indate } </td>
        <td>&nbsp;${company.visitcount }</td>
        <td>&nbsp;${company.type }</td>
        <td>&nbsp;${company.lastvisitdate }</td>
        <td>&nbsp;${company.industry.industry }</td>
        <td><a href="infoA?companyid=${company.companyid}&${requestScope.page }"><img src="images/btn_01.gif" width="15" height="15" border="0" /></a></td>
      </tr>
      </c:forEach>
      	<tr class="contentListTd">
        <td colspan="9"> &nbsp;${requestScope.htmlPage }</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<script language="javascript" type="text/javascript">
	var formObj = new dean.form(document.form1);
</script>
<div id="helpContent">
  <div class="title">搜索提示：</div>
  <div class="Content">请详细填写搜索内容，这样可以更加准确的搜索到您要的客户,公司名称与公司地址可以进行模糊搜索</div>
</div>
</body>
</html>