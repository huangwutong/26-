<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加员工</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/javascript" src="js/crm.js"></script>
<script language="JavaScript" type="text/javascript" src="js/changedate.js"></script>
<script type="text/javascript" language="JavaScript">
function chick()
{
	if(form1.realName.value=="")
	{
	 	document.getElementById("realNameError").innerHTML="姓名不可以为空";
	 	form1.realName.focus();
        return false;
	}
	if(form1.birthday.value=="")
	{
	 	document.getElementById("date").innerHTML="生日不可以为空";
	 	form1.birthday.focus();
        return false;
	}
	if(form1.idCardNo.value=="")
	{
	 	document.getElementById("isid").innerHTML="身份证号码不可以为空";
	 	form1.idCardNo.focus();
        return false;
	}
	if(form1.jobId.value=="")
	{
	 	document.getElementById("jobIdError").innerHTML="工号不可以为空";
	 	form1.jobId.focus();
        return false;
	}
	if(form1.dept.value=="")
	{
	 	document.getElementById("depError").innerHTML="所在部门不可以为空";
	 	form1.dept.focus();
        return false;
	}
	if(form1.native_.value=="")
	{
	 	document.getElementById("native_error").innerHTML="籍贯不可以为空";
	 	form1.native_.focus();
        return false;
	}
	if(form1.nation.value=="")
	{
	 	document.getElementById("nationError").innerHTML="民族不可以为空";
	 	form1.nation.focus();
        return false;
	}
	if(form1.finishSchool.value=="")
	{
	 	document.getElementById("finishSchool_error").innerHTML="毕业学校不可以为空";
	 	form1.finishSchool.focus();
        return false;
	}
	if(form1.dwelling.value=="")
	{
	 	document.getElementById("dwelling_error").innerHTML="住址不可以为空";
	 	form1.dwelling.focus();
        return false;
	}
	document.form1.submit()
}
function isid(va)
{	
	if(va.length!=15 && va.length!=18)
	{
		document.getElementById("isid").innerHTML="身份证号码无效";
        form1.idCardNo.focus();
	}
	else
	{
		document.getElementById("isid").innerHTML="";
	}
}
var v_request;
function sendRequest()
{
	if(form1.com.value!="")
	{
    	v_request=new ActiveXObject("Msxml2.XMLHTTP");
    	v_request.onreadystatechange=getResult;
    	//确定url
    	var url="comAjax?com="+form1.com.value;
    	v_request.open("GET",url,true);
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
            document.getElementById('os1').innerHTML='<select name=dept><option value="">请选择...</option>'+v_request.responseText+'</select>'
        }
    }
}
var u_request;
function sendUserRequest()
{
	if(form1.jobId.value!="")
	{
			u_request=new ActiveXObject("Msxml2.XMLHTTP");
    		u_request.onreadystatechange=getUserResult;
    		//确定url
    		document.getElementById('jobIdError').innerHTML = "正在查询用户名";
	    	var url="UserNameChickAjax?jobId="+form1.jobId.value;
    		u_request.open("GET",url,true);
	    	//发送请求
	    	u_request.send(null);   
	}
}
function getUserResult()
{
    if(u_request.readyState==4)//如果结束
    {
        if(u_request.status==200) //如果成功
        {
        	var temp = u_request.responseText;
        	if(temp == "这个工号已存在")
        	{
            	form1.jobId.focus();
            }
            document.getElementById('jobIdError').innerHTML = temp;
        }
    }
}
</script>
<div class="title">
  <h2>添加员工</h2>
</div>
 <form action="addPersonnel" name="form1" method="post">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="contentList"><table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
          <td width="16%" class="contentListTdColName">员工名</td>
          <td width="84%" class="contentListTd">
          	<input name="realName" type="text" id="realName" size="10"  maxlength="20" />*[不可以为空最长20个字]<span id="realNameError"/>
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">工号</td>
          <td class="contentListTd">
          	<input name="jobId" type="text" id="jobId" size="10" maxlength="10" onblur="sendUserRequest();"/>*[工号格式:sz000]<span id="jobIdError"/>
          </td>
        </tr>
        <tr>
          <td width="16%" class="contentListTdColName">部门</td>
          <td width="84%" class="contentListTd">
          <select name="com" onchange="sendRequest();">
         	<option value="" selected="selected">---公司---</option>
         	<c:forEach items="${applicationScope.dept}" var="com">
         		<c:if test="${sessionScope.user.dept.grade.deptid==1}">
					<option value="${com.deptid }">${com.deptname}</option>
				</c:if>
			</c:forEach>
			<c:if test="${sessionScope.user.dept.grade.deptid!=1}">
					<option value="${sessionScope.user.dept.grade.deptid}">${sessionScope.user.dept.grade.deptname}</option>
			</c:if>
		</select>
		<span id=os1><select name=dept><option value="">---部门---</option></select></span>*[必须选所在部门]<span id="depError"></span>
          </td>
        </tr>
        <tr>
          <td width="16%" class="contentListTdColName">职位</td>
          <td width="84%" class="contentListTd">
		<select name=positioned>
		<option value="" selected="selected">---请选择---</option>
		<c:forEach items="${applicationScope.position}" var="com">
				<option value="${com.positionid}">${com.job }</option>
		</c:forEach>			
		</select>*[必选项]<span id="positionError"/>
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">生日</td>
          <td class="contentListTd">
         	<input name="birthday" type="text" id="birthday" value="" size="10" maxlength="10" readonly="readonly" onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>*[必填项,不可以为空]<span id="date"></span>
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">性别</td>
          <td class="contentListTd">
          	<input name="sex" type="radio" id="sex" value="1" checked="checked"/>男
          	<input name="sex" type="radio" id="sex" value="0"/>女
         </td>
        </tr>
        <tr>
          <td class="contentListTdColName">籍贯</td>
          <td class="contentListTd">
          	<input type="text" name="native_" id="native_" value="" size=10 maxlength="20")/>*[必填项]<span id="native_error"></span>
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">民族</td>
          <td class="contentListTd">
          	<input type="text" name="nation" id="nation" value="" size=10 maxlength="20" />*[必填项]<span id="nationError"></span>
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">政治面貌</td>
          <td class="contentListTd">
           <input name="polity" type="radio" id="polity" value="A" checked="checked"/>党员
          	<input name="polity" type="radio" id="polity" value="B"/>团员 
          	<input name="polity" type="radio" id="polity" value="C"/>无
			<input name="polity" type="radio" id="polity" value="D"/>他党人士
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">身份证号码</td>
          <td class="contentListTd">
          	<input type="text" name="idCardNo" id="idCardNo" value="" size=18 maxlength="18" onblur="isid(this.value);" />*[必填项]<span id="isid"></span>
          </td>
        </tr><tr>
          <td class="contentListTdColName">身份证地址</td>
          <td class="contentListTd">
          	<input type="text" name="idCardAddress" id="idCardAddress" value="" size=40 maxlength="100" />
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">婚否</td>
          <td class="contentListTd">
          	<input name="wedlock" type="radio" id="wedlock" value="1" checked="checked"/>已婚
          	<input name="wedlock" type="radio" id="wedlock" value="0"/>未婚
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">社保卡号</td>
          <td class="contentListTd">
          	<input type="text" name="socialinsuranceid" id="socialinsuranceid" value="" size=10 maxlength="15" />
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">毕业学校</td>
          <td class="contentListTd">
          	<input type="text" name="finishSchool" id="finishSchool" value="" size=20 maxlength="40" />*[必填项]<span id="finishSchool_error"></span>
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">专业</td>
          <td class="contentListTd">
          	<input type="text" name="specialty" id="specialty" value="" size=20 maxlength="30" />
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">学历</td>
          <td class="contentListTd">
          	<input name="academic" type="radio" id="academic" value="C" checked="checked"/>高中(中专)
          	<input name="academic" type="radio" id="academic" value="D"/>大专
          	<input name="academic" type="radio" id="academic" value="E"/>本科
          	<input name="academic" type="radio" id="academic" value="F"/>研究生
          	<input name="academic" type="radio" id="academic" value="G"/>博士
          	<input name="academic" type="radio" id="academic" value="H"/>博士后
          </td>
        </tr>
        <tr>
          <td class="contentListTdColName">住址</td>
          <td class="contentListTd">
          	<input type="text" name="dwelling" id="dwelling" value="" size=30 maxlength="100" />*[必填项]<span id="dwelling_error"></span>
          </td>
        </tr>
        <tr>
          <td height="37" class="contentListTdColName">&nbsp;</td>
          <td class="contentListTd">
          <div class="error">
          <a href="javascript:void chick();" class="pagenum">添加</a>
          <a href="javascript:document.form1.reset();" class="pagenum">重填</a>
          </div></td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
  <div id="helpContent">
  <div class="title">温馨提示：</div>
  <div class="Content">在一期系统中没有修改员工资料的权限，请确认您添加的员工资料准确性!</div>
</div>
</body>
</html>
