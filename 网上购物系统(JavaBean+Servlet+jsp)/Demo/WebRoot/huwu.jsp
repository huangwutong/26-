<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body bgcolor="wheat">
  <h1 align="center"><font color="cyan">�ۺ����</font></h1>
  <table border="1" width=400 height=200><tr height="60">
  <td colspan="2">
    <font color="#FF0000">
    <marquee scrollamount="3">��л��Ա���Ʒ��ʹ��</marquee>
    </font>
    </td></tr>
    <tr height="35" ><td>һ�°���</td><td>һ������</td></tr>
    <tr height="35"><td>��Ʒά��</td><td>��Ʒ���</td></tr>
     <tr height="35"><td>���ŷ���</td><td>�����ѯ</td></tr>
      <tr height="35"><td>���ŷ���</td><td>�������</td></tr>
</table>
<h2 align="center"><a href="index.jsp">����</a></h2>
  </body>
</html>
