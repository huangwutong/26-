<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>客户信息</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
				<script type="text/javascript" language="JavaScript">
			function info()
			{
				document.all.update.style.display ='none';
				document.all.info.style.display ='';
			}
			function update()
			{
				document.all.update.style.display ='';
				document.all.info.style.display ='none';
			}
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
		</script>
	</head>
	<body onload="info();">
		<div class="title">
			<h2>客户信息</h2>
		</div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
			<tr>
				<td class="attachMenu"><strong>基本资料</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一共拜访了这个客户:${sessionScope.info.visitcount }次</td>
			</tr>
			<tr>
				<td class="contentList">
				<div id="info">
					<table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
						<tr>
							<td width="16%" class="contentListTdColName">关键字</td>
							<td width="84%" class="contentListTd">&nbsp;${sessionScope.info.namekeywords}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">公司名</td>
							<td class="contentListTd">&nbsp;${sessionScope.info.nameparticular}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">公司地址</td>
							<td class="contentListTd">&nbsp;${sessionScope.info.companyaddress}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">网址</td>
							<td class="contentListTd">&nbsp;${sessionScope.info.neturl}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">所在城市</td>
							<td class="contentListTd">&nbsp;${sessionScope.info.district.district }</td>
						</tr>
						<tr>
							<td class="contentListTdColName">客户等级</td>
								<td class="levelA">&nbsp;${sessionScope.info.type}</td>
						</tr>
						<tr>
							<td class="contentListTdColName">所在行业</td>
							<td class="contentListTd">&nbsp;${sessionScope.info.industry.industry }</td>
						</tr>
						<tr>
							<td class="contentListTdColName">介绍</td>
							<td class="contentListTd">&nbsp;${sessionScope.info.companynarrate}</td>
						</tr>
						<tr>
							<td class="contentListTd contentListTdAlign" colspan="2">操作：
							<a href="select?page=${requestScope.size }" class="pagenum" >返回B库</a>&nbsp;&nbsp;&nbsp;
							<a href="turn?type=bl" class="pagenum">添加联系人</a> &nbsp;&nbsp;&nbsp;
							<a href="turn?type=bn" class="pagenum">添加公司简介</a>
							<a href="javascript:update();" class="pagenum">修改公司信息</a>
							</td>
						</tr>
					</table>
					</div>
					<div id="update">
						<form name="addCompany" method="post" action="updateb?id=${sessionScope.info.companyid}&size=${requestScope.size}&page=${requestScope.page }">
							<table width="100%" border="0" cellspacing="1" cellpadding="8"
								class="contentListTable2">
								<tr>
									<td width="16%" class="contentListTdColName">
										关键字
									</td>
									<td width="84%" class="contentListTd">
										<input name="nameKeywords" type="text" id="nameKeywords"
											value="${sessionScope.info.namekeywords}" readonly="readonly" />
										*[不可修改,不可以为空]&nbsp;
										<span id="nameKeywordsError" />
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										公司名
									</td>
									<td class="contentListTd">
										<input name="nameParticular" type="text" id="nameParticular"
											value="${sessionScope.info.nameparticular}" size="20" maxlength="40" />
										*[最少输入4个字,最多输入40个字]&nbsp;
										<span id="nameParticularError" />
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										公司地址
									</td>
									<td class="contentListTd">
										<input name="companyAddress" type="text" id="companyAddress"
											value="${sessionScope.info.companyaddress}" size="40" maxlength="100" />
										[可以为空,最多可输入100个字]
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										网址
									</td>
									<td class="contentListTd">
										<input name="neturl" type="text" id="neturl" value="${sessionScope.info.neturl}"
											size="40" maxlength="100" />
										[可以为空,最多输入100个字]
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										客户所在城市
									</td>
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
									<td class="contentListTdColName">
										行业
									</td>
									<td class="contentListTd">
										<span id="industr"> <select id="0" name="industry">
         	<option value="">请选择...</option>
         	<c:if test="${sessionScope.d == 1}">
         	<c:forEach items="${applicationScope.industrys}" var="industry">
				<c:if test="${sessionScope.info.industry.industryid==industry.industryid}">
					<option value="${industry.industryid }" selected="selected">${industry.industry }</option>
				</c:if>
				<c:if test="${sessionScope.info.industry.industryid!=industry.industryid}">
					<option value="${industry.industryid }">${industry.industry }</option>
				</c:if>
			</c:forEach>
			</c:if>
			<c:if test="${sessionScope.d == 0}">
			<c:forEach items="${applicationScope.industry}" var="industr">
				<c:if test="${sessionScope.info.industry.industryid==industr.industryid}">
					<option value="${industr.industryid }" selected="selected">${industr.industry }</option>
				</c:if>
				<c:if test="${sessionScope.info.industry.industryid!=industr.industryid}">
					<option value="${industr.industryid }">${industr.industry }</option>
				</c:if>
			</c:forEach>
			</c:if>
		</select> </span> *[必选项]
										<span id="industryerror" />
									</td>
								</tr>
								<tr>
									<td class="contentListTdColName">
										公司介绍
									</td>
									<td class="contentListTd">
										<div class="error">
											<textarea name="companyNarrate" cols="40" rows="6"
												maxlength="2000">${sessionScope.info.companynarrate}</textarea>
											[可以为空,最多输入2000个字]
										</div>
									</td>
								</tr>
								<tr>
									<td class="contentListTd" colspan=2 align="center">
										<a href="javascript:info();" class="pagenum">取消修改</a>&nbsp;&nbsp;&nbsp;
										<a href="javascript: void chick();" class="pagenum">修改</a>
										<a href="javascript:document.addCompany.reset();"
											class="pagenum">重填</a>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</td>
			</tr>
		</table>
		<div class="lineSpace"></div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
			<tr>
				<td class="attachMenu"><strong>联系人信息/拜访记录户</strong></td>
			</tr>
		<c:forEach items="${sessionScope.info.linkmans}" var="linkman">
			<tr>
				<td class="contentList">
						<table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2 spaceBottom">
							<tr>
								<td width="50" class="contentListTdColName">姓名:</td>
								<td width="14%" class="contentListTdColName3">&nbsp;${linkman.linkmanname }</td>
								<td width="50" class="contentListTdColName">职位: </td>
          						<td width="12%" class="contentListTdColName3">&nbsp;${linkman.job }</td>
								<td width="50" class="contentListTdColName">电话:</td>
								<td width="12%" class="contentListTdColName3">&nbsp;${linkman.linkmanphone }</td>
								<td width="50" class="contentListTdColName">Email:</td>
								<td width="12%" class="contentListTdColName3">&nbsp;${linkman.linkmanemail }</td>
								<td width="50" class="contentListTdColName">手机:</td>
								<td class="contentListTdColName3">&nbsp;${linkman.linkmanmoblie }</td>
							</tr>
						<c:forEach items="${linkman.visits}" var="visit">
						<tr>
							<td class="contentListTd" colspan="10">[${visit.visittime }]-[
										<c:if test="${visit.visittype=='A'}">
											电话
										</c:if>
										<c:if test="${visit.visittype=='B'}">
											上门
										</c:if>
										]:${visit.visitlog }</td>
						</tr>
						<c:if test="${linkman.visits == '[]' }">
						<tr>
							<td class="contentListTd" colspan="10">没有拜访</td>
						</tr>
						</c:if>
						</c:forEach>
						<td class="contentListTd contentListTdAlign" colspan="10">
								<a href="turn?type=bv&linkmanid=${linkman.linkmanid }" class="pagenum">添加拜访记录</a>&nbsp;
						</td>
						</table>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>
