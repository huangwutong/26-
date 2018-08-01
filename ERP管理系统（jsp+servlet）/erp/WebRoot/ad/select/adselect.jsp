<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>查询客户</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
var v_sort;
function sendSort()
{
	if(form1.sort.value!="")
	{
    	v_sort=new ActiveXObject("Msxml2.XMLHTTP");
    	v_sort.onreadystatechange=getSort;
    	//确定url
    	var url="bills?a="+form1.sort.value;
    	v_sort.open("GET",url,true);
    	v_sort.setRequestHeader("If-Modified-Since","0");
    	//发送请求
    	v_sort.send(null);
    }
}
function getSort()
{
    if(v_sort.readyState==4)//如果结束
    {
        if(v_sort.status==200) //如果成功
        {
            document.getElementById('main').innerHTML=v_sort.responseText;
        }
    }
}

var v_request;
function sendRequest()
{
	if(form1.industry.value!="")
	{
    	v_request=new ActiveXObject("Msxml2.XMLHTTP");
    	v_request.onreadystatechange=getResult;
    	//确定url
    	var url="sorts?a="+form1.industry.value;
    	v_request.open("GET",url,true);
    	v_request.setRequestHeader("If-Modified-Since","0");
    	//发送请求
    	v_request.send(null);
    }
}
function getResult()
{
    if(v_request.readyState==4)//如果结束
    {
        if(v_request.status==200) //如果成功
        {
            document.getElementById('sorts').innerHTML='<select name="sort" onchange="sendSort();"><option value="">--请选择--</option>'+v_request.responseText+'</select>';
        }
    }
}
</script>
	</head>
	<body>
	<div class="title">
<h2>广告位查询</h2>
</div>
		<form action="fCompany" name="form1" method="post">
			<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
				<tr>
					<td class="searchBar">
						导航网
						<select name="industry" id="industry" onchange="sendRequest();">
							<option value="" selected="selected">
								--请选择--
							</option>
							<c:forEach items="${applicationScope.industry}" var="industr">
								<option value="${industr.industryid }">
									${industr.industry }
								</option>
							</c:forEach>
						</select>
						子页面
						<span id="sorts">
							<select name="sort" id="sort" onchange="sendSort();">
								<option value="" selected="selected">
									--请选择--
								</option>
							</select> 
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span id="main"></span>
					</td>
				</tr>
				<tr>
    <td class="contentList">
    <table id="tablecompany" width="100%" border="0" cellpadding="8" cellspacing="1" class="contentListTable">
      <tr class="contentListTable2">
      	<td><span id="sortlist"></span></td>
      </tr>
    </table></td>
  </tr>
</table>
		</form>
<div id="helpContent">
  <div class="title">温馨提示：</div>
  <div class="Content"></div>
</div>
	</body>
</html>