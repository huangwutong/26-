<%@ page contentType="text/html;charset=utf-8"
	errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加联系人</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<script language="javascript" type="text/javascript">
function check()
{
	if(form1.linkmanName.value == "")
	{
		document.getElementById("lname").innerHTML="联系人名字不可以为空";
	    return false;
	}
	else
	{
		document.getElementById("lname").innerHTML="";
	}
	var reg=/(^[0-9]{3,4}-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^([0-9]{3,4})[0-9]{7,8}$)/
	if((form1.linkmanPhone.value == "")&&(form1.linkmanMoblie.value==""))
	{
		document.getElementById("phone").innerHTML="最少要留一个联系电话";
		document.getElementById("moblie").innerHTML="最少要留一个联系电话";
	    return false;
	}
	else
	{
		document.getElementById("phone").innerHTML="";
		document.getElementById("moblie").innerHTML="";
	}
	if(form1.linkmanPhone.value!="")
	{
		if(!reg.test(form1.linkmanPhone.value))
		{
			 document.getElementById("phone").innerHTML="电话号码不合法";
		     return false;
		}
		else
		{
			document.getElementById("phone").innerHTML="";
		}
	}
	if(form1.linkmanMoblie.value!="")
	{
		reg=/(^1[0-9]{10}$)/
		if(!reg.test(form1.linkmanMoblie.value))
		{
			 document.getElementById("moblie").innerHTML="手机号码不合法";
		     return false;
		}
		else
		{
			document.getElementById("moblie").innerHTML="";
		}
	}
	if(form1.linkmanEmail.value != "")
	{
		if(!(new RegExp(/^[A-Za-z0-9]*@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+)*.[A-Za-z0-9]+$/).test(form1.linkmanEmail.value)))
		{
			 document.getElementById("email").innerHTML="电子邮箱不正确";
		     return false;
		}
		else
		{
			document.getElementById("email").innerHTML="";
		}
	}
	if(form1.job.value == "")
	{
		document.getElementById("joberror").innerHTML="<font color='#ff0000'>联系人职位不可以为空</font>";
		form1.job.focus();
	    return false;
	}
	else
	{
		document.getElementById("joberror").innerHTML="";
	}
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
		<div class="title">
			<h2>
				添加联系人
			</h2>
		</div>
		<form name="form1" method="post"
			action="addLandv?companyid=${sessionScope.info.companyid}">
			<table width="100%" border="0" cellpadding="8" cellspacing="1"
				class="contentArea">
				<tr>
					<td class="attachMenu">
						操作：
						<a href="selectA" class="pagenum">返回A库</a>&nbsp;&nbsp;&nbsp;
						<a href="turn?type=ai" class="pagenum">返回客户信息</a>
					</td>
				</tr>
				<tr>
					<td class="contentList">
						<table width="100%" border="0" cellspacing="1" cellpadding="8"
							class="contentListTable2">
							<tr>
								<td width="16%" class="contentListTdColName">
									姓名
								</td>
								<td width="84%" class="contentListTd">
									<input name="linkmanName" type="text" id="linkmanName"
										size="20" maxlength="10" />
									*[不可以为空,最多10个字]
									<span id="lname" />
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									电话
								</td>
								<td class="contentListTd">
									<input name="linkmanPhone" type="text" id="linkmanPhone"
										value="" size="20" maxlength="20" />
									[可以为空,但电话与手机最少要填一个]
									<span id="phone" />
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									手机
								</td>
								<td class="contentListTd">
									<input name="linkmanMoblie" type="text" id="linkmanMoblie"
										value="" size="20" maxlength="20" />
									[可以为空,但电话与手机最少要填一个]
									<span id="moblie" />
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									E-mail
								</td>
								<td class="contentListTd">
									<input name="linkmanEmail" type="text" id="linkmanEmail"
										value="" size="20" maxlength="30" />
									[可以为空,最多输入30个字]
									<span id="email" />
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									职位
								</td>
								<td class="contentListTd">
									<input name="job" type="text" id="job" value="" size="20"
										maxlength="30" />
									[不可以为空,最多输入30个字]
									<span id="joberror" />
								</td>
							</tr>
							<tr>
								<td width="16%" class="contentListTdColName">
									客户级别
								</td>
								<td width="84%" class="contentListTd">
									<input name="type" id="type" type="radio" value="A" />
									A级
									<input name="type" id="type" type="radio" value="B" />
									B级
									<input name="type" id="type" type="radio" value="C" />
									C级
									<input name="type" id="type" type="radio" value="D" />
									D级
									<input name="type" id="type" type="radio" value="E" />
									E级<span id="typeerror"></span>
								</td>
							</tr>
							<tr>
								<td width="16%" class="contentListTdColName">
									拜访类型
								</td>
								<td width="84%" class="contentListTd">
									<!-- <input name="visittype" id="visittype" type="radio" value="C" />Email -->
									<input name="visittype" id="visittype" type="radio" value="A" />
									电话
									<input name="visittype" id="visittype" type="radio" value="B" />
									上门<span id="visittypeerror" />
								</td>
							</tr>
							<tr>
								<td class="contentListTdColName">
									拜访日志
								</td>
								<td class="contentListTd">
									<textarea name="delectSake" cols="40" rows="6" maxlength=2000></textarea>
									*[最少20个字,最长2000字]
									<span id="delectSakeError" />
								</td>
							</tr>
							<tr>
								<td class="contentListTd" colspan=2 align="center">
									<a href="javascript:void check();" class="pagenum">添加</a>
									<a href="javascript:document.form1.reset();" class="pagenum">重填</a>
								</td>
							</tr>
						</table>
						</td>
						</tr>
						</table>
						</form>
						<div id="helpContent">
							<div class="title">
								温馨提示:
							</div>
							<div class="Content">
								联系人的资料是不可以修改的，请确认您添加信息的准确性！
								<br />
							</div>
						</div>
	</body>
</html>
