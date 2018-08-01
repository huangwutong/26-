<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<html:html locale="true">
<head>    
    <title>backlogin.jsp</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="style_css/frame_style.css" type="text/css"></link>
</head>
<body class="left_bg">
  <form action="checkManage.do" method="post">
    <table>
    	<tr>
    		<td>用户名：</td>
    		<td><input type="text" name="manName"/></td>
    	</tr>
    	<tr>
    		<td>密　码：</td>
    		<td><input type="password" name="manPass"/></td>
    	</tr>
    	<tr>
    		<td></td>
    		<td><input type="submit" value="登陆"></td>
    	</tr>
    </table>
    </form>	
</body>
</html:html>
