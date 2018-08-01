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


<h2 align="center">公司业务</h2>
<table width="762" height="291" border="0">
  <tr>
    <td width="230" height="75"><img width="99" height="51" src="tupian/zuo.bmp"/></td>
    <td width="516"><table width="522" height="58" border="0">
      <tr>
        <td width="516">[网站业务]：网站推广的六种基本方法</td>
      </tr>
      <tr>
        <td>[网站业务]：安全方案 多角度详解网站安全保护方法</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img width="99" height="51" src="tupian/jintian.bmp" /></td>
    <td><table width="508" height="117" border="0">
      <tr>
        <td width="502">业务指南</td>
      </tr>
      <tr>
        <td>国内业务</td>
      </tr>
      <tr>
        <td>国外业务</td>
      </tr>
      <tr>
        <td>金融业务</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img width="99" height="51" src="tupian/ming.bmp" alt="明天" /></td>
    <td><table width="512" height="62" border="0">
      <tr>
        <td width="506">离岸业务</td>
      </tr>
      <tr>
        <td>公司业务</td>
      </tr>
    </table></td>
  </tr>
</table>
<h4><a href="index.jsp">首页</a></h4>
</body>
</html>
