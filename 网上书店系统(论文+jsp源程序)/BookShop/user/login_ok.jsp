<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ա��¼</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<jsp:useBean id="login" class="BookShop.MyDb" scope="page"/>
<style type="text/css">
<!--
body {
	background-image: url(../image/bg_Login.gif);
}
-->
</style></head>
<body>
<%
	String id=(String)session.getAttribute("id");
	String sqls="select iddistinction from customers where idcustomer='"+id+"' and iddistinction=6";
	int temp=-2;
	temp=login.select(sqls);
%>
<table width="413" height="412" border="0" align="right">
  <tr>
    <td width="530" height="80" align="center" valign="middle" class="two"><a href="../customer/bookshop.htm" class="two">�����������</a></td>
  </tr>
  <tr>
    <td width="530" height="80" align="center" valign="middle" class="two"><a href="../admin/books_sale.jsp" class="two">�鿴�������</a></td>
  </tr>
  <tr>
    <td width="530" height="80" align="center" valign="middle" class="two"><a href="change.jsp" class="two">�޸Ļ�Ա����</a></td>
  </tr>
  <tr>
    <td height="80" align="center" valign="middle" class="two">
      <% 
	if(temp==1){ 
%>
      <a href="../admin/admin.jsp" class="two">����Ա������</a>
      <%
	}
%></td>
  </tr>
  <tr>
    <td height="80" align="center" valign="middle" class="two"><a href="exit.jsp" class="two">�˳�</a></td>
  </tr>
</table>
</body>
</html>
