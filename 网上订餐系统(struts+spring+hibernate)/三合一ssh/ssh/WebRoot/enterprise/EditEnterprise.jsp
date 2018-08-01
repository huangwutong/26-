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
  				<td><jsp:include flush="true" page="../front/top.jsp"/></td>
  			</tr>
  			<tr>
  				<td></td>
  			</tr>
  			<tr>
  				<td>
		  		<table width="100%" border="0" cellspacing="2" cellpadding="0" align="center">
				  <tr>
				    <td width="230" valign="top"><jsp:include flush="true" page="../enterprise/leftEnterpriseCenter.jsp"/></td>
				    <td width="591" align="center" valign="top">
				    <html:form action="editEnterpriseInfo.do">
					    <table width="500" border="0" cellpadding="0" cellspacing="2">
					      <tr>
					        <td height="30"><span style="color: red;font-size: 12px;font-weight: bold;">企业资料</span></td>
					      </tr>
					      <tr>
					        <td height="10"><img src="user/image/regok_2.gif" width="499" height="1" /></td>
					      </tr>
					      <tr>
					        <td><table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
	                          <tr class="font_style_normal">
	                            <td width="80" height="30"></td>
	                            <td width="305"><html:hidden property="enterId"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td width="80" height="30">用 户 名:</td>
	                            <td width="305"><html:hidden property="enterpriseName" styleClass="text_style_border"/>${ENTERPRISEINFO.EName }</td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">公司名称:</td>
	                            <td><html:text property="enterpriseCompanyName" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">联 系 人:</td>
	                            <td><html:text property="enterpriseLinkMan" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">联系电话:</td>
	                            <td><html:text property="enterpriseTel" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">联系地址:</td>
	                            <td><html:text property="enterpriseAddress" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">电子邮件:</td>
	                            <td><html:text property="enterpriseEmail" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="40"></td>
	                            <td><html:submit>修改</html:submit></td>
	                          </tr>
	                        </table></td>
				          </tr> 
					    </table>
				    </html:form>
				    </td>
				  </tr>
				</table>
  				</td>
  			  </tr>
  			<tr>
  				<td><jsp:include flush="true" page="../front/buttom.jsp" /></td>
  			</tr>
  		</table>
  </body>
</html:html>