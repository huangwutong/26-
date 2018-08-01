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
		    <td width="210"><jsp:include flush="true" page="../enterprise/leftEnterpriseCenter.jsp"/></td>
		    <td width="560"><table width="500" border="0" align="center" cellpadding="0" cellspacing="2">
		      <tr>
		        <td height="30"><span style="color: red;font-size: 12px;font-weight: bold;">企业资料</span></td>
		      </tr>
		      <tr>
		        <td height="10"><img src="user/image/regok_2.gif" alt="" width="499" height="1" /></td>
		      </tr>
		      <tr>
		        <td><table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
		            <tr class="font_style_normal">
		              <td width="80" height="30">用 户 名:</td>
		              <td width="305">${EnterpriseInfo.EName }</td>
		            </tr>
		            <tr class="font_style_normal">
		              <td height="30">公司名称:</td>
		              <td>${EnterpriseInfo.ECompanyName }</td>
		            </tr>
		            <tr class="font_style_normal">
		              <td height="30">联 系 人:</td>
		              <td>${EnterpriseInfo.ELinkMan }</td>
		            </tr>
		            <tr class="font_style_normal">
		              <td height="30">联系电话:</td>
		              <td>${EnterpriseInfo.ETel }</td>
		            </tr>
		            <tr class="font_style_normal">
		              <td height="30">联系地址:</td>
		              <td>${EnterpriseInfo.EAddress}</td>
		            </tr>
		            <tr class="font_style_normal">
		              <td height="30">电子邮件:</td>
		              <td>${EnterpriseInfo.EEmail }</td>
		            </tr>
		        </table></td>
		      </tr>
		    </table></td>
		  </tr>
		  <tr>
		    <td colspan="2"><jsp:include flush="true" page="../front/buttom.jsp" /></td>
		  </tr>
		</table>
  </body>
</html:html>