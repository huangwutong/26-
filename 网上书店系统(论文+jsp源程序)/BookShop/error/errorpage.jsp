<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>错误</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
</head>
<%
	String massage;
	try{
		massage=(String)session.getAttribute("error");
	}catch(Exception e){
		massage="请与管理员联系";
	}
%>
<body> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<table width="570" height="228" border="0" align="center"> 
  <tr valign="top"> 
    <td width="562" height="162"><span class="two">对不起，您的操作有误！！！</span>
	<ul>
         <a class="red">
<%
	if(massage==null){
		out.print("你的操作已过期请<a href='../index.htm'>重新登录！</a>");
	}else{
		out.print(massage);
	}
%></a>
    </ul></td> 
  </tr> 
  <tr> 
    <td height="60" align="right" valign="bottom" ><a class="two" style="cursor:hand"  onclick="javascrpt:history.back();">返回</a></td> 
  </tr> 
</table> 
</body>
</html>
