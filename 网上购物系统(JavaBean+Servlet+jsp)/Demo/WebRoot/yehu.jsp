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
  
  <body  bgcolor="#eeffff">


<h2 align="center">��˾ҵ��</h2>
<table width="762" height="291" border="0">
  <tr>
    <td width="230" height="75"><img width="99" height="51" src="tupian/zuo.bmp"/></td>
    <td width="516"><table width="522" height="58" border="0">
      <tr>
        <td width="516">[��վҵ��]����վ�ƹ�����ֻ�������</td>
      </tr>
      <tr>
        <td>[��վҵ��]����ȫ���� ��Ƕ������վ��ȫ��������</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img width="99" height="51" src="tupian/jintian.bmp" /></td>
    <td><table width="508" height="117" border="0">
      <tr>
        <td width="502">ҵ��ָ��</td>
      </tr>
      <tr>
        <td>����ҵ��</td>
      </tr>
      <tr>
        <td>����ҵ��</td>
      </tr>
      <tr>
        <td>����ҵ��</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img width="99" height="51" src="tupian/ming.bmp" alt="����" /></td>
    <td><table width="512" height="62" border="0">
      <tr>
        <td width="506">�밶ҵ��</td>
      </tr>
      <tr>
        <td>��˾ҵ��</td>
      </tr>
    </table></td>
  </tr>
</table>
<h4><a href="index.jsp">��ҳ</a></h4>
</body>
</html>
