<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加客户</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body onload="sendRequest();">
<div class="title">
  <h2>添加客户</h2>
</div>
<script language="javascript" type="text/javascript">
function chick()
{
    if(addCompany.nameParticular.value.length<4)
    {
        document.getElementById("nameParticularError").innerHTML="<font color='#ff0000'>公司名最少要四个字</font>";
        addCompany.nameParticular.focus();
        return false;
    }
    else
    {
    	document.getElementById("nameParticularError").innerHTML="";
    }
    if(addCompany.companyAddress.value.length<5)
    {
        document.getElementById("companyAddressError").innerHTML="<font color='#ff0000'>公司地址最少要五个字</font>";
        addCompany.companyAddress.focus();
        return false;
    }
    else
    {
    	document.getElementById("companyAddressError").innerHTML="";
    }
	if(addCompany.linkmanName.value == "")
	{
		document.getElementById("lname").innerHTML="<font color='#ff0000'>联系人名字不可以为空</font>";
		addCompany.linkmanName.focus();
	    return false;
	}
	else
	{
		document.getElementById("lname").innerHTML="";
	}
	if(addCompany.job.value == "")
	{
		document.getElementById("joberror").innerHTML="<font color='#ff0000'>联系人职位不可以为空</font>";
		addCompany.job.focus();
	    return false;
	}
	else
	{
		document.getElementById("joberror").innerHTML="";
	}
	var reg=/(^[0-9]{3,4}-[0-9]{7,8}$)/
	if((addCompany.linkmanPhone.value == "")&&(addCompany.linkmanMoblie.value==""))
	{
		document.getElementById("phone").innerHTML="<font color='#ff0000'>最少要留一个联系电话</font>";
		document.getElementById("moblie").innerHTML="<font color='#ff0000'>最少要留一个联系电话</font>";
		addCompany.linkmanPhone.focus();
	    return false;
	}
	else
	{
		document.getElementById("phone").innerHTML="";
		document.getElementById("moblie").innerHTML="";
	}
	if(addCompany.linkmanPhone.value!="")
	{
		if(!reg.test(addCompany.linkmanPhone.value))
		{
			 document.getElementById("phone").innerHTML="<font color='#ff0000'>电话号码不合法</font>";
			 addCompany.linkmanPhone.focus();
		     return false;
		}
		else
		{
			document.getElementById("phone").innerHTML="";
		}
	}
	if(addCompany.linkmanMoblie.value!="")
	{
		reg=/^13\d{9}|15\d{9}|18\d{9}$/
		if(!reg.test(addCompany.linkmanMoblie.value))
		{
			 document.getElementById("moblie").innerHTML="<font color='#ff0000'>手机号码不合法</font>";
			 addCompany.linkmanMoblie.focus();
		     return false;
		}
		else
		{
			document.getElementById("moblie").innerHTML="";
		}
	}
	if(addCompany.linkmanEmail.value != "")
	{
		if(!(new RegExp(/^[A-Za-z0-9]*@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+)*.[A-Za-z0-9]+$/).test(addCompany.linkmanEmail.value)))
		{
			 document.getElementById("email").innerHTML="<font color='#ff0000'>电子邮箱不正确</font>";
			 addCompany.linkmanEmail.focus();
		     return false;
		}
		else
		{
			document.getElementById("email").innerHTML="";
		}
	}
	if(addCompany.district.value == "")
	{
		document.getElementById("districterror").innerHTML="<font color='#ff0000'>所在城市不可以为空</font>";
		addCompany.district.focus();
		return false;
	}
	else
	{
		document.getElementById("districterror").innerHTML="";
	}
	if(addCompany.industry.value == "")
	{
		document.getElementById("industryerror").innerHTML="<font color='#ff0000'>行业不可以为空</font>";
		addCompany.industry.focus();
		return false;
	}
	else
	{
		document.getElementById("industryerror").innerHTML="";
	}
	if(addCompany.companyNarrate.value.length<=0)
	{
		document.getElementById("companyNarrateError").innerHTML="<font color='#ff0000'>公司简介不可以为空</font>";
		addCompany.companyNarrate.focus();
		return false;
	}
    document.addCompany.submit();
}
var v_request;
function sendRequest()
{
	if(addCompany.province.value!="")
	{
    	v_request=new ActiveXObject("Msxml2.XMLHTTP");
    	v_request.onreadystatechange=getResult;
    	//确定url
    	var url="districtAjax?a="+addCompany.province.value;
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
            document.getElementById('os1').innerHTML='<select name="district"><option value="">请选择...</option>'+v_request.responseText+'</select>'
        }
    }
}
var indu;
function ind()
{
	if(document.getElementsByName("industry")[0].id==0)
	{
		document.getElementById('industr').innerHTML='<input name="industry" type="text" id="1" />'
		document.getElementById('add').innerHTML='<a href="javascript: void ind();" class="pagenum">选择行业</a>'
	}
	else
	{
		indu=new ActiveXObject("Msxml2.XMLHTTP");
    	indu.onreadystatechange=indus;
    	//确定url
    	var url="IndustryAjax";
    	indu.open("GET",url,true);
    	indu.setRequestHeader("If-Modified-Since","0");
    	//发送请求
    	indu.send(null);
	}
}
function indus()
{
    if(indu.readyState==4)//如果结束
    {
        if(indu.status==200) //如果成功
        {
            document.getElementById('industr').innerHTML='<select id="0" name="industry"><option value="" selected="selected">请选择...</option>'+indu.responseText+'</select>'
            document.getElementById('add').innerHTML='<a href="javascript: void ind();" class="pagenum">添加行业</a>'
        }
    }
}
</script>
<form name="addCompany" method="post" action="addCompany">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">操作：<a href="chick" class="pagenum">重新输入</a></td>
  </tr>
  <tr>
    <td class="contentList"><table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
          <td width="16%" class="contentListTdColName">关键字</td>
          <td width="84%" class="contentListTd">
          	<input name="nameKeywords" type="text" id="nameKeywords" value="${sessionScope.keyword }" readonly="readonly" />*[不可修改,不可以为空]&nbsp;<span id="nameKeywordsError" />
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">公司名</td>
          <td class="contentListTd">
          	<input name="nameParticular" type="text" id="nameParticular" value="" size="20" maxlength="40" />*[最少输入4个字,最多输入40个字]&nbsp;<span id="nameParticularError" />
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">公司地址</td>
          <td class="contentListTd">
          	<input name="companyAddress" type="text" id="companyAddress" value="" size="40" maxlength="100" />[不可以为空,最多可输入100个字]&nbsp;<span id="companyAddressError" />
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">网址</td>
          <td class="contentListTd">
          	<input name="neturl" type="text" id="neturl" value="" size="40" maxlength="100" />[可以为空,最多输入100个字]
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">客户所在城市</td>
          <td class="contentListTd">
         <select name="province" onchange="sendRequest();">
         	<option value="" selected="selected">请选择...</option>
         	<c:forEach items="${applicationScope.district}" var="province">
				<option value="${province.districtid }">${province.district }</option>
			</c:forEach>
		</select>
		<span id=os1><select name="district"><option value="" selected="selected">请选择...</option></select></span>*[必须选择所在的城市]
		<span id="districterror"/>
		  </td>
        </tr>
        <tr>
          <td class="contentListTdColName">行业</td>
          <td class="contentListTd">
          <span id="industr">
          <select id="0" name="industry">
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
		</span>
          *[必选项]<c:if test="${sessionScope.d == 1}"><span id="add"><a href="javascript: void ind();" class="pagenum">添加行业</a></span></c:if>
          <span id="industryerror"/>
		  </td>
        </tr>
        <tr>
          <td class="contentListTdColName">公司介绍</td>
          <td class="contentListTd">
          <div class="error">
          	<textarea name="companyNarrate" cols="40" rows="6" maxlength="2000"></textarea>[可以为空,最多输入2000个字]<span id="companyNarrateError"/>
          	<br/><font color="red">请不要把拜访记录填在此处</font>
          	</div>
          </td>
        </tr>
        <tr>
        	<td class="contentListTd" colspan=2>联系人信息</td>
        </tr>
        <tr>
			<td width="16%" class="contentListTdColName">姓名</td>
			<td width="84%" class="contentListTd">
				<input name="linkmanName" type="text" id="linkmanName" size="20" maxlength="10" />*[不可以为空,最多10个字]&nbsp;<span id="lname" />
			</td>
		</tr>
		<tr>
			<td class="contentListTdColName">电话</td>
			<td class="contentListTd">
				<input name="linkmanPhone" type="text" id="linkmanPhone" value="" size="20" maxlength="20" />&nbsp;[可以为空,但电话与手机最少要填一个,例:0755-87654321]&nbsp;<span id="phone" />
			</td>
		</tr>
		<tr>
			<td class="contentListTdColName">手机</td>
			<td class="contentListTd">
				<input name="linkmanMoblie" type="text" id="linkmanMoblie" value="" size="20" maxlength="20" />&nbsp;[可以为空,但电话与手机最少要填一个,例:13456789876]&nbsp;<span id="moblie" />
			</td>
		</tr>
		<tr>
			<td class="contentListTdColName">联系人E-mail</td>
			<td class="contentListTd">
				<input name="linkmanEmail" type="text" id="linkmanEmail" value="" size="20" maxlength="30" />&nbsp;[可以为空,最多输入30个字]&nbsp;<span id="email" />
			</td>
		</tr>
		<tr>
			<td class="contentListTdColName">联系人职位</td>
			<td class="contentListTd">
				<input name="job" type="text" id="job" value="" size="20" maxlength="30" />[不可以为空,最多输入30个字]<span id="joberror"></span>
			</td>
		</tr>
        <tr>
          <td class="contentListTd" colspan=2 align="center">
          <a href="javascript: void chick();" class="pagenum">添加</a>
          <a href="javascript:document.addCompany.reset();" class="pagenum">重填</a>
		  </td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
  <div id="helpContent">
  	<div class="title">温馨提示:</div>
  	<div class="Content">
  		客户的公司基本信息是不可以修改的,请您确认你输入的准确性!<br/>
  	</div>
  </div>
</body>
</html>