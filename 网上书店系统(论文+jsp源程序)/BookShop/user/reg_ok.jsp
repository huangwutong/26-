<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ע��ɹ�</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
</head>
<%
	String id;
	try{
		id=(String)session.getAttribute("id");
	}catch(Exception e){
		id="";
	}
%>
<body> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<p>&nbsp;</p> 
<table width="422" height="228" border="0" align="center"> 
  <tr valign="top"> 
    <td width="416" height="162"><span class="two">ף�����Ѿ�ע��ɹ�,��Ǻ�����ID�ţ�����<br>
	 ���Ļ�ԱID��Ϊ��</span>
	<ul>
         <a class="red">[<%=id%>]</a>
    </ul>
</td> 
  </tr> 
  <tr> 
    <td height="60" align="right" valign="bottom" ><a class="two" style="cursor:hand"  onclick="href='login.jsp'">����</a></td>
  </tr> 
</table> 
</body>
</html>
