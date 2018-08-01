<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<html:html locale="true">
  <head>
    <link rel="stylesheet" type="text/css" href="enterprise/style_css/enterprise_style.css">
	<script type="text/javascript">
		function button_submit(){
			window.document.fm.action="enterpriseLogin.do";
			window.document.fm.submit();
		}
	</script>
  </head>
  <body>
    <table border="0" cellspacing="0" cellpadding="0" align="center">
  		<tr>
  			<td><jsp:include flush="true" page="../front/top.jsp"/></td>
  		</tr>
  		<tr>
  			<td width="5"></td>
  		</tr>
  		<tr>
  			<td>
				  <table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
				    <tr>
				      <td width="218" align="right" valign="middle">
				        <img src="enterprise/image/warning.jpg" />
				      </td>
				      <td valign="top">
				      	<form action="" name="fm" method="post">
					        <table width="80%" border="0" cellspacing="2" cellpadding="2" align="center">
				              <tr>
				              	<td width="100" height="30">&nbsp;</td>
				                <td><span style="color: #CB7F0C;font-size: 18;">企业登陆</span></td>
				                </tr>
				              <tr>
				                <td width="100" height="30" align="center" class="font_style_normal">用户名：</td>
				                <td>
				                  <input type="text" name="enterpriseName" class="text_style_border2"/>
				                </td>
				              </tr>
				              <tr>
				                <td height="30" align="center" class="font_style_normal">密　码：</td>
				                <td>
				                  <input type="password" name="enterprisePass" class="text_style_border2"/>
				                </td>
				              </tr>
				              <tr>
				                <td height="20" align="center" class="font_style_normal">&nbsp;</td>
				                <td>
				                  <span style="color: red;font-size: 12px;font-weight: bold;"><html:errors property="enterprise"/></span>
				                </td>
				              </tr>
				              <tr>
				                <td height="20">&nbsp;</td>
				                <td>
				                  <a href="javascript:button_submit();"><img src="enterprise/image/login.gif" border="no"/></a>
				                 　  
				                 <a href="preEnterpriseRegister.do"><img src="enterprise/image/zc.gif" border="no"/></a>
				                </td>
				              </tr>
				            </table>
			               </form>
				      </td>
				    </tr>
				  </table>
  			</td>
  		</tr>
  		<tr>
  			<td><jsp:include flush="true" page="../front/buttom.jsp"/></td>
  		</tr>
  	</table>
  </body>
</html:html>