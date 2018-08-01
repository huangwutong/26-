<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@page import="sys.dao.bean.Personnel"%>
<%@page import="java.util.List"%>
<%@page import="sys.dao.bean.Dept"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户统计</title>
<link href="css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script language="JavaScript" type="text/javascript" src="js/changedate.js"></script>
<script type="text/javascript" language="JavaScript">
var ids = "";
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
            document.getElementById('per').innerHTML='<select name="personnelid"><option value="" selected="selected">--请选择--</option>'+v_request.responseText+'</select>'
        }
    }
}
function stat()
{
	if(form1.gotime.value=="")
	{
	 	document.getElementById("gotimeerr").innerHTML='起始时间不可以为空';
		return false;
	}
	if(form1.endtime.value=="")
	{
		document.getElementById("endtimeerr").innerHTML='结束时间不可以为空'
		return false;
	}
	form1.submit();
}
</script>
<div class="title">
  <h2>客户增量统计</h2>
</div>
<form action="fStatistic" name="form1" method="get">
<table width="100%" border="0" cellpadding="8" cellspacing="1" class="contentArea">
  <tr>
    <td class="searchBar">
    	部门:<select name="deptid" onChange="sendRequest();">
				<option value="" selected="selected" >--请选择--</option>
				<% 
				if(request.getSession().getAttribute("pos")!=null)
				{
					List<Dept> list = ((Personnel)request.getSession().getAttribute("user")).getDept().getGrade().getDepts();
					for(Dept dept:list)
					{
						if(dept.getDeptname().indexOf(request.getSession().getAttribute("pos").toString())>=0)
						{
							%>
							<option value="<%=dept.getDeptid() %>"><%=dept.getDeptname() %></option>
							<%
						}
					}
				}
				 %>
				<c:if test="${sessionScope.pos==null}">
				<c:forEach items="${sessionScope.user.dept.grade.depts}" var="dept">
						<option value="${dept.deptid }">${dept.deptname }</option>
				</c:forEach>
				</c:if>
 			 </select>
		员工名:<span id="per"><select name="personnelid">
				<option value="" selected="selected">--请选择--</option>
 			 </select></span>
 		统计方式:<select name="statType">
				<option value="1" selected="selected">年</option>
				<option value="2">月</option>
				<option value="3">日</option>
 			 </select>
 		起始时间<input id="gotime" name="gotime" readonly="readonly" size=10 onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>
 		结束时间<input id="endtime" name="endtime" readonly="readonly" size=10 onclick="popUpCalendar(this, this, 'yyyy-mm-dd')" value="" style="cursor:hand;"/>
 		<a href="javascript:void stat();" class="pagenum">统计</a><span id="gotimeerr"></span><span id="endtimeerr"></span>	
    </td>
  </tr>
  <tr>
  	<td class="contentList">
  	<c:forEach items="${requestScope.list}" var="a">
  			${a }
  	</c:forEach>
  	</td>
  </tr>
</table>
</form>
<div id="helpContent">
  <div class="title">搜索提示：</div>
  <div class="Content">在这里会对你所选择的日期范围内新增的客户进行统计，可以统计整个分公司，整个部门，或一个员工</div>
</div>
</body>
</html>