<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户搜索</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script language="JavaScript" type="text/javascript" src="js/changedate.js"></script>
<script language="JavaScript" type="text/javascript" src="js/crm.js"></script>
<script type="text/javascript" language="JavaScript">
var ids = "";
function deleteCompany()
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
	if(ids != "")
	{
		form1.action = "mdelectcompany?cleintids="+ids;
		form1.method="post"; 
		document.form1.submit();
	}
}
function attornCleint()
{
    for(var i = tablecompany.rows.length - 2; i > 0; i--)
	{
		if(tablecompany.rows(i).getElementsByTagName("input").item(0).checked)
		{
           ids = ids + tablecompany.rows(i).getElementsByTagName("input").item(0).value + ",";
		}
	}
	ids = ids.substr(0,ids.length - 1);
	if(ids != "")
	{
		form1.action = "turn?type=ma&cleintids="+ids;
		form1.method="post"; 
		document.form1.submit();
	}
}
</script>
<div class="title">
  <h2>查询的客户</h2>
</div>
<form action="mCompany" name="form1" method="post">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="searchBar">
		员工名:<select name="personnelid" id="personnelid">
				<option value="" selected="selected">--请选择--</option>
				<c:forEach items="${sessionScope.user.dept.personnels}" var="personnel">
					<c:if test="${personnel.outdate == null }">
 						<option value="${personnel.personnelid }">${personnel.realname }</option>
 					</c:if>
 					<!--<option value="${personnel.personnelid }">${personnel.realname }</option>-->
 				</c:forEach>
 			 </select>
 			 搜索类型
	<select name="stype">
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
		</select><br/>
		所在库<select name="state" id="state">
				<option value="" selected="selected">--请选择--</option>
 				<option value="A">A</option>
				<option value="B">B</option>
 			 </select>
		  客户类型
 			<select name="type" id="type">
 				<option value="" selected="selected">--请选择--</option>
 				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
				<option value="D">D</option>
				<option value="E">E</option>
 			</select> 			
 			起始时间<input id="gotime" name="gotime" readonly="readonly" size=10 onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>
 			结束时间<input id="endtime" name="endtime" readonly="readonly" size=10 onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>
 			<a href="javascript:document.form1.submit();" class="pagenum">搜索</a><br/>
 			${requestScope.xls }
 			<a href="javascript:formObj.chooseAll(true);" class="pagenum">全选</a>
 			<a href="javascript:attornCleint();" class="pagenum">转让客户</a>
 			 <a href="javascript:deleteCompany();" class="pagenum">转入公共库</a>&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.csize }
    </td>
  </tr>
  <tr>
    <td class="contentList"><table id="tablecompany" width="100%" border="0" cellpadding="8" cellspacing="1" class="contentListTable">
      <tr class="contentListTable2">
        <td width="4%">&nbsp;</td>
        <td width="25%">客户公司名</td>
        <td width="10%">添加客户日期</td>        
        <td width="10%">拜访次数</td>
        <td width="10%">客户等级</td>
        <td width="10%">业务员</td>
        <td width="10%">最后拜访日期</td>
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
        <td>&nbsp;${company.personnel.realname }</td>
        <td>&nbsp;${company.lastvisitdate }</td>
        <td>&nbsp;${company.industry.industry }</td>
        <td><a href="minfo?companyid=${company.companyid}"><img src="images/btn_01.gif" width="15" height="15" border="0" /></a></td>
      </tr>
	</c:forEach>
	<tr class="contentListTd">
        <td colspan="9">&nbsp; ${requestScope.htmlPage }</td>
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
  <div class="Content">请详细填写搜索内容，这样可以更加准确的搜索到您要的客户</div>
</div>
</body>
</html>