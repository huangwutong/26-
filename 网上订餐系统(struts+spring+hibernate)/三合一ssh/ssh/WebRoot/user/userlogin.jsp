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
	<script>
		function button_submit(){
			window.document.fm.action="userLogin.do";
			window.document.fm.submit();
		}
	</script>
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
    <td height="200">
    <form id="form1" name="fm" action="" method="post">
      <table width="60%" height="166" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="166" rowspan="6"><img src="user/image/userinfo.gif" width="166" height="166" /></td>
          <td width="100" height="30">&nbsp;</td>
          <td><span style="color: #CB7F0C;font-size: 18;">会员登陆</span></td>
        </tr>
        <tr>
          <td height="30" align="center" class="font_style_normal">用户名：</td>
          <td>
            <input type="text" name="userName" class="text_style_border2"/>
          </td>
        </tr>
        <tr>
          <td height="30" align="center" class="font_style_normal">密　码：</td>
          <td>
            <input type="password" name="userPass1" class="text_style_border2"/>
          </td>
        </tr>
        <tr>
          <td height="30" align="center" class="font_style_normal">&nbsp;</td>
          <td>
            <span style="color: red;font-size:13px;font-weight: bold;"><html:errors property="userinfo"/><html:errors property="userError"/></span>
          </td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
          <td>
            <a href="javascript:button_submit();"><img src="user/image/login.gif" border="no"/></a>　 
            <a href="preRegister.do"><img src="user/image/zc.gif" border="no" /></a>
          </td>
        </tr>
        <tr>
          <td height="30">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
        </form>
    </td>
  </tr>
  <tr>
    <td><jsp:include flush="true" page="../front/buttom.jsp"/></td>
  </tr>
</table>
  </body>
</html:html>