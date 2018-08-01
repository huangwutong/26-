<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>请选择接受转让的人</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
<script type="text/javascript" language="JavaScript">
function chack()
{
	if(form1.personnel.value!="")
	{
		document.form1.submit();
	}
	else
	{
		document.getElementById('error').innerHTML="请选择一个员工"
	}
}
var v_request;
function sendRequest()
{
	v_request=new ActiveXObject("Msxml2.XMLHTTP");
    v_request.onreadystatechange=getResult;
    //确定url
    var url="deptAjax?deptid="+form1.deptid.value;
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
            document.getElementById('per').innerHTML='<select name="personnel"><option value="" selected="selected">--请选择--</option>'+v_request.responseText+'</select>'
        }
    }
}
</script>
<form id="form1" name="form1" method="post" action="fattorn?cleintids=${requestScope.cleintids}">
		<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="attachMenu">请选择接受转让的人</td>
  </tr>
  <tr>
    <td class="contentList">
    <table width="100%" border="0" cellspacing="1" cellpadding="8" class="contentListTable2">
        <tr>
         <td class="contentListTdColName" width="15%">接收转让人</td>
          <td class="contentListTd" width="20%">
          部门:<select name="deptid" onChange="sendRequest();">
				<option value="" selected="selected" >--请选择--</option>
				<c:forEach items="${sessionScope.user.dept.grade.depts}" var="dept">
					<option value="${dept.deptid }">${dept.deptname }</option>
				</c:forEach>
 			 </select>
         </td>
          <td class="contentListTdColName" width="15%">接收转让人</td>
          <td class="contentListTd" >
          <span id="per">
          <select name="personnel">
          	<option value="" selected="selected">请选择..</option>
          		<c:if test="${per.personnelid != sessionScope.user.personnelid }">
 					<option value="${per.personnelid }">${per.realname }</option>
 				</c:if>
		  </select>
		  </span>
		  <span id="error"></span>
         </td>
        </tr>
        <tr>
          <td class="contentListTd" colspan="4" align="center">
          <a href="javascript:chack();" class="pagenum">转让</a>
		</td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
