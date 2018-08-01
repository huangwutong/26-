<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<html:html locale="true">
  <head>
   <link rel="stylesheet" type="text/css" href="user/style_css/user_style.css">
	<meta http-equiv=refresh content=5;URL=preUserLogin.do>
  </head>
  <body>
	 <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td><jsp:include flush="true" page="../front/top.jsp"/></td>
	  </tr>
	  <tr>
	    <td height="5"></td>
	  </tr>
	  <tr>
	    <td height="310"><table width="60%" border="0" align="center" cellpadding="0" cellspacing="0">
	      <tr>
	        <td height="30" colspan="2"><span style="color: red;font-size: 14px;">恭喜您！你已经成功注册成为会员</span></td>
	      </tr>
	      <tr>
	        <td colspan="2"><img src="user/image/regok_1.gif" width="96" height="25" /></td>
	      </tr>
	      <tr>
	        <td colspan="2" height="10"><img src="user/image/regok_2.gif" width="499" height="1" /></td>
	      </tr>
	      <tr>
	        <td width="14%" height="40" align="center"><img src="user/image/regok_3.gif" width="32" height="32" /></td>
	        <td width="86%" class="font_style_normal">免费注册，享受超级vip服务；</td>
	      </tr>
	      <tr>
	        <td height="40" align="center"><img src="user/image/regok_4.gif" width="32" height="32" /></td>
	        <td class="font_style_normal">自助发布、查询、修改，完全免费；</td>
	      </tr>
	      <tr>
	        <td height="40" align="center"><img src="user/image/regok_5.gif" width="32" height="32" /></td>
	        <td class="font_style_normal">反抗雷达解放可怜见机</td>
	      </tr>
	      <tr>
	        <td height="40" align="center"><img src="user/image/regok_6.gif" width="32" height="32" /></td>
	        <td class="font_style_normal">将免费进行到底；</td>
	      </tr>
	      <tr>
	        <td height="40" colspan="2" align="center"><span style="color:red;font-size: 12px;">系统将在5秒钟后自动进入登陆界面</span></td>
	        </tr>
	      
	    </table></td>
	  </tr>
	  <tr>
	    <td><jsp:include flush="true" page="../front/buttom.jsp"/></td>
	  </tr>
	</table>
  </body>
</html:html>