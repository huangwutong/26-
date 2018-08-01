<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
				    <td width="230"><jsp:include flush="true" page="../user/leftMemberCenter.jsp"/></td>
				    <td width="591" align="center" valign="top"><table width="500" border="0" cellpadding="0" cellspacing="2">
				      <tr>
				        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
				          <tr>
				            <td height="20" class="font_style_orange"></td>
				          </tr>
				          <tr>
				            <td height="20" class="font_style_normal">你好:<span style="color: red;font-size: 12;font-weight: bold;">&nbsp;${USERINFO.UName }</span>&nbsp; 欢迎你登陆会员中心.</td>
				          </tr>
				          <tr>
				            <td height="1" style="background-color: #E4A31B;"></td>
				          </tr>
				        </table></td>
				      </tr>
				      <tr>
				        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
				          <tr>
				            <td height="20"><span style="font-size: 12px;color: red;font-weight: bold;">特别提示</span></td>
				          </tr>
				          <tr>
				            <td height="20" class="font_style_normal"><span style="LETTER-SPACING: 1pt"><font 
				                  color="#ff0000">提醒注意：</font>为了提升网站信息的准确率，使网站得到更好的运作，请会员在发布信息时，一定要填写正确的联系方式，如若故意发布虚假信息，管理员有权在不告知发布者的情况下直接删除消息</span></td>
				          </tr>
				          <tr>
				            <td height="20">&nbsp;</td>
				          </tr>
				        </table></td>
				      </tr>
				      <tr>
				        <td>&nbsp;</td>
				      </tr>
				    </table></td>
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