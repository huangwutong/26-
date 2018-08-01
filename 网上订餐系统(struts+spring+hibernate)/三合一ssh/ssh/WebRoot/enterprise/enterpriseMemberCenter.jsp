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
  </head>
  <body>
	 <table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
		    <td colspan="2"><jsp:include flush="true" page="../front/top.jsp"/></td>
		  </tr>
		  <tr>
		    <td width="300"><jsp:include flush="true" page="../enterprise/leftEnterpriseCenter.jsp"/></td>
		    <td valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="2">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="30" class="font_style_normal">欢迎<span style="color: red;font-weight: bold;">${ENTERPRISEINFO.EName }</span>登陆<span style="color: red;font-weight: bold;">${ENTERPRISEINFO.ECompanyName }</span>管理中心</td>
              </tr>
              <tr>
                <td height="1" bgcolor="#E4A31B"></td>
              </tr>
              <tr>
                <td class="font_style_normal"><span style="color: red;font-weight: bold;">特别提示</span></td>
              </tr>
              <tr>
                <td class="font_style_normal">
					<span style="LETTER-SPACING: 1pt"><font color="red">提醒注意：</font>为了提升网站信息的准确率，使网站得到更好的运作，请会员在发布信息时，一定要填写正确的联系方式，如若故意发布虚假信息，管理员有权在不告知发布者的情况下直接删除消息</span>
				</td>
              </tr>
            </table></td>
		  </tr>
		  <tr>
		    <td colspan="2"><jsp:include flush="true" page="../front/buttom.jsp"/></td>
		  </tr>
	</table>
  </body>
</html:html>