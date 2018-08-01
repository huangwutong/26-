<%@ page contentType="text/html;charset=utf-8"
	errorPage="../../error.jsp"%>
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
			<h2>
				添加导航网子页面
			</h2>
		</div>
		<script language="javascript" type="text/javascript">
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
function chick()
{
	if(document.form1.sort.value=='')
	{
		document.getElementById("ierror").innerHTML='请选择所属的子页面';
		return false;
	}
	else
	{
		document.getElementById("ierror").innerHTML='';
	}
	if(document.form1.billNo.value=='')
	{
		document.getElementById("bnerror").innerHTML='请输入广告位编号';
		return false;
	}
	else
	{
		document.getElementById("bnerror").innerHTML='';
	}
	if(document.form1.billType.value=='')
	{
		document.getElementById("bterror").innerHTML='请选择广告位类型';
		return false;
	}
	else
	{
		document.getElementById("bterror").innerHTML='';
	}
	if(document.form1.billPrice.value=='')
	{
		document.getElementById("bperror").innerHTML='请输这个广告位的报价';
		return false;
	}
	else
	{
		document.getElementById("bterror").innerHTML='';
	}
	if(document.form1.billRemark.value=='')
	{
		document.getElementById("brerror").innerHTML='请输这个广告位的简介好让广告部的同事介绍它';
		return false;
	}
	else
	{
		document.getElementById("brerror").innerHTML='';
	}
    document.form1.submit();
}
function info()
{
	document.form1.billNo.value='';
	document.all("billType").selectedIndex=0;
	document.form1.billPrice.value='';
	document.form1.billRemark.value='';
	document.form1.action="addBill";
	document.getElementById("update").innerHTML='';
}
function update(a,b,c,d,e)
{
	document.form1.billNo.value=a;
	document.all("billType").selectedIndex=b;
	document.form1.billPrice.value=c;
	document.form1.billRemark.value=d;
	document.form1.action="updateBill?id="+e;
	document.getElementById("update").innerHTML='<a href="javascript:void info();" class="pagenum">取消修改</a>';
	
}
</script>
		<form name="form1" method="post" action="addBill">
			<span id="billidhidden"/>
			<table width="100%" border="0" cellpadding="8" cellspacing="1"
				class="contentArea">
				<tr>
					<td class="attachMenu">
						操作：z
					</td>
				</tr>
				<tr>
					<td class="contentList">
							<table width="100%" border="0" cellspacing="1" cellpadding="8"
								class="contentListTable2">
								<tr>
									<td width="16%" class="contentListTdColName">
										所属导行网
									</td>
									<td width="84%" class="contentListTd">
										<select name="industry" id="industry"
											onchange="sendRequest();">
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
										<span id="sorts"> <select name="sort" id="sort"
												onchange="sendSort();">
												<option value="" selected="selected">
													--请选择--
												</option>
											</select> </span>
										<span id="ierror" />
									</td>
								</tr>
								<tr>
									<td width="16%" class="contentListTdColName">
										广告位编号
									</td>
									<td width="84%" class="contentListTd">
										<input name="billNo" type="text" id="billNo" size="10"
											maxlength="10" />
										[不可以为空]
										<span id="bnerror" />
									</td>
								</tr>
								<tr>
									<td width="16%" class="contentListTdColName">
										广告位类型
									</td>
									<td width="84%" class="contentListTd">
										<select name="billType" id="billType"">
											<option value="" selected="selected">
												--请选择--
											</option>
											<c:forEach items="${applicationScope.billType}"
												var="billType">
												<option value="${billType.billTypeId }">
													${billType.billTypeName }
												</option>
											</c:forEach>
										</select>
										<span id="bterror" />
									</td>
								</tr>
								<tr>
									<td width="16%" class="contentListTdColName">
										广告位报价
									</td>
									<td width="84%" class="contentListTd">
										<input name="billPrice" type="text" id="billPrice" value=""
											size="10" maxlength="6" />
										/月 [不可以为空]
										<span id="bperror" />
									</td>
								</tr>
								<tr>
									<td width="16%" class="contentListTdColName">
										广告位简介
									</td>
									<td width="84%" class="contentListTd">
										<textarea name="billRemark" cols="40" rows="6" maxlength="200"></textarea>
										[不可以为空]
										<span id="brerror" />
									</td>
								</tr>
								<tr>
									<td class="contentListTd" colspan=2 align="center">
										<a href="javascript:void chick();" class="pagenum">提交</a>
										<a href="javascript:document.form1.reset();" class="pagenum">重填</a>
										<span id="update"/>
									</td>
								</tr>
							</table>
					</td>
				</tr>
				<tr>
					<td>
						<span id="main"></span>
					</td>
				</tr>
			</table>
		</form>
		<div id="helpContent">
			<div class="title">
				温馨提示:
			</div>
			<div class="Content">
				<br />
				<br />
			</div>
		</div>

	</body>
</html>
