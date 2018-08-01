<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>搜索公共库的客户</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/crm.js"></script>
<script language="JavaScript" type="text/javascript" src="js/changedate.js"></script>
</head>
<body>
<div class="title">
  <h2>搜索公共库的客户</h2>
</div>
<script language="javascript" type="text/javascript">
var ids = "";
function updateClient()
{
	var j = 0;
    for(var i = tablecompany.rows.length - 2; i > 0; i--)
	{
		if(tablecompany.rows(i).getElementsByTagName("input").item(0).checked)
		{
           ids = ids + tablecompany.rows(i).getElementsByTagName("input").item(0).value + ",";
           ++j;
		}
	}
	ids = ids.substr(0,ids.length - 1);
	if(ids != "")
	{
		search.action = "fdelectcompany?cleintids="+ids+"&i="+j+"&s=1";
		search.method = "post";
		document.search.submit();
	}
}
var v_request;
function sendRequest()
{
    v_request=new ActiveXObject("Msxml2.XMLHTTP");
    v_request.onreadystatechange=getResult;
    //确定url
    var url="districtAjax?a="+search.province.value;
    v_request.open("GET",url,true);
    v_request.setRequestHeader("If-Modified-Since","0");
    //发送请求
    v_request.send(null);   
}
function getResult()
{
    if(v_request.readyState==4)//如果结束
    {
        if(v_request.status==200) //如果成功
        {
            document.getElementById('os1').innerHTML='<select name="district"><option value="">请选择...</option>'+v_request.responseText+'</select>'
        }
    }
}
</script>
<form name="search" method="post" action="fscarchc">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="searchBar">
	关键字:	<input id="keywords" name="keywords" size=12 />
		地区
		 <select name="province" onchange="sendRequest();">
         	<option value="" selected="selected">请选择...</option>
         	<c:forEach items="${applicationScope.district}" var="province">
				<option value="${province.districtid }">${province.district }</option>
			</c:forEach>
		</select>
		<span id=os1><select name="district"><option value="">请选择...</option></select></span>
		  行业
 			<select name="industry">
         	<option value="" selected="selected">请选择...</option>
         	<c:forEach items="${applicationScope.industrys}" var="ind">
				<option value="${ind.industryid }">${ind.industry }</option>
			</c:forEach>
			</select><br/>		
 			起始时间<input id="gotime" name="gotime" size=10 readonly="readonly" onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>结束时间<input id="endtime" name="endtime" size=10 readonly="readonly" onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>
 			<a href="javascript:document.search.submit();" class="pagenum">搜索</a>
 			<c:if test="${sessionScope.pos==null}">
 			<a href="javascript:updateClient()" class="pagenum">删除</a>&nbsp;
 			</c:if>
 			<span id="searcherror"/>
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
        <td width="10%">最后拜访日期</td>
        <td width="10%">放弃人</td>
         <td width="10%">所在行业</td>
        <td width="10%">客户详情</td>
      </tr>
<c:forEach items="${requestScope.search}" var="company">
      <tr class="contentListTd">
      	<td><input type="checkbox" name="idnum" value="${company.companyid}"/></td>
        <td>&nbsp;${company.nameparticular } </td>
        <td>&nbsp;${company.adddate } </td>
        <td>&nbsp;${company.visitcount }</td>
        <td>&nbsp;${company.type }</td>
        <td>&nbsp;${company.lastvisitdate }</td>
        <td>&nbsp;${company.lastPersonnel.realname }</td>
        <td>&nbsp;${company.industry.industry }</td>
        <td><a href="finfo?companyid=${company.companyid}&s=1"><img src="images/btn_01.gif" width="15" height="15" border="0" /></a></td>
      </tr>
</c:forEach>
	<tr class="contentListTd">
        <td colspan="10"> &nbsp;${requestScope.htmlPage }</td>
      </tr>
    </table></td>
  </tr>
</table>
  </form>
 <script language="javascript" type="text/javascript">
	var formObj = new dean.form(document.search);
</script>
<div id="helpContent">
  <div class="title">搜索提示：</div>
  <div class="Content">请详细填写搜索内容，这样可以更加准确的搜索到您要的客户,关键字可以进行模糊搜索</div>
</div>
</body>
</html>