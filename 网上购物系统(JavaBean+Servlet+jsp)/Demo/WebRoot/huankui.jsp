<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'huankui.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#eeffff">
  <h2 align="center">�û�����</h2>
  <form method="post" action="param.jsp">
         <p>������<input type="text" name="username" size="15"/></p>
         <p>���룺<input type="password" name="password" size="15"/></p>
         
         <p>��Ʒ������<select name="old">
                 <option value="10">��</option>
                 <option value="20">һ��</option>
                 <option value="30">�ܺ�</option>
                 <option value="40">��</option>
                 </select>
                 </p>
         <p>��Ʒ���<input type="checkbox" name="habit" value="Reading"/>����
                 <input type="checkbox" name="habit" value="Movie"/>����
                 <input type="checkbox" name="habit" value="Travel"/>һ��
                 <input type="checkbox" name="habit" value="Music"/>����
                 <input type="checkbox" name="habit" value="Sports"/>ʱ��</p>
                 
                 
          <p>�û����:<textarea rows="8" cols="30"></textarea></p>      
                 
         <p>     <input type="submit" value="�ύ">
                 <input type="reset" value="���">
         </p>
         </form>
  </body>
</html>
