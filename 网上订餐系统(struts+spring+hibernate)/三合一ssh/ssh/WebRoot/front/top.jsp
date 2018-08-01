<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<html:html locale="true">
  <head>    
    <title>top.jsp</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="fontstyle/front_style.css" type="text/css"></link>
<style type="text/css">
	
.body {
	margin-top: 0px;
}

</style>
</head>
<body>
	<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td><img src="front/image/topbg.gif" width="770" height="110" /></td>
	  </tr>
	  <tr>
	    <td height="22" background="front/image/bj_2.gif">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr class="font_style_white2">
		        <td width="100">&nbsp;</td>
		        <td width="60" align="center"><a href="welfront.do" class="menu_font_style2">首页</a></td>
		        <td width="5" align="center">|</td>
		        <td width="80" align="center"><a href="preUserLogin.do" class="menu_font_style2">会员中心</a></td>
		        <td width="5" align="center">|</td>
		        <td width="80" align="center"><a href="preRegister.do" class="menu_font_style2">免费注册</a></td>
		        <td width="10" align="center">|</td>
		        <td width="80" align="center"><a href="preEnterpriseRegister.do" class="menu_font_style2">我要开店</a></td>
		        <td width="10" align="center">|</td>
		        <td width="80" align="center"><a href="preEnterpriseLogin.do" class="menu_font_style2">我的店铺</a></td>
		        <td width="10" align="center">|</td>
		        <td width="80" align="center"><a href="foodCart.do" class="menu_font_style2">订餐车</a></td>
		        <td width="10" align="center">|</td>
		        <td width="80" align="center"><a href="#" class="menu_font_style2">退出</a></td>
		        <td align="center">&nbsp;</td>
		        <td align="center">&nbsp;</td>
		      </tr>
		    </table>
	    </td>
	  </tr>
	</table>
  </body>
</html:html>
