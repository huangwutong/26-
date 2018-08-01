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
				    <td width="230" valign="top"><jsp:include flush="true" page="../user/leftMemberCenter.jsp"/></td>
				    <td width="591" align="center" valign="top">
				    <html:form action="editUserInfo.do">
					    <table width="500" border="0" cellpadding="0" cellspacing="2">
					      <tr>
					        <td height="30"><span style="color: red;font-size: 12px;font-weight: bold;">会员资料</span></td>
					      </tr>
					      <tr>
					        <td height="10"><img src="user/image/regok_2.gif" alt="" width="499" height="1" /></td>
					      </tr>
					      <tr>
					        <td><table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
	                          <tr class="font_style_normal">
	                            <td width="80" height="30"></td>
	                            <td width="305"><html:hidden property="userId"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td width="80" height="30">用 户 名:</td>
	                            <td width="305"><html:hidden property="userName" styleClass="text_style_border"/>${USERINFO.UName }</td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">真实姓名:</td>
	                            <td><html:text property="realName" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">证件号码:</td>
	                            <td><html:text property="paperCode" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">年　　龄:</td>
	                            <td><html:text property="userAge" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">性　　别:</td>
	                            <td>
									<html:radio property="userSex" value="1">男</html:radio>
									<html:radio property="userSex" value="2">女</html:radio>
								</td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">联系电话:</td>
	                            <td><html:text property="userTel" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">联系地址:</td>
	                            <td><html:text property="uaddress" styleClass="text_style_border"/></td>
	                          </tr>
	                          <tr class="font_style_normal">
	                            <td height="30">电子邮件:</td>
	                            <td><html:text property="uemail" styleClass="text_style_border"/></td>
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
