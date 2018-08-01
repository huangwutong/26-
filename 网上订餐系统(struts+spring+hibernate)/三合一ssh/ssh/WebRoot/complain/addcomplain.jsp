<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<html:html locale="true">
<!--投诉的页面  -->
  <head>
		<link rel="stylesheet" type="text/css" href="user/style_css/user_style.css">
		<script>
			function checkInput(){
				var idel=document.fm.complain.value;
				if(idel.length==0){
					alert('你还没填写意见呢！');
					return false;
				}
				return true;
			}
		</script>
  </head>
  <body>
    <table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  			<tr>
  				<td><jsp:include flush="true" page="../front/top.jsp"/></td>
  			</tr>
  			<tr>
  				<td height="20"></td>
  			</tr>
  			<tr>
  				<td>
		  		<table width="100%" border="0" cellspacing="2" cellpadding="0" align="center">
				  <tr>
				    <td width="230" valign="top"><jsp:include flush="true" page="../user/leftMemberCenter.jsp"/></td>
				    <td width="591" align="center" valign="top">
				    	<form id="form1" name="fm" method="post" action="addComplain.do">
						  <table width="98%" border="0" cellspacing="2" cellpadding="0">
						    <tr class="font_style_normal">
						      <td width="100" height="25">投 诉 人：</td>
						      <td style="color: red;">${USERINFO.URealName }</td>
						    </tr>
						    <tr class="font_style_normal">
						      <td height="25" valign="top">投诉意见：</td>
						      <td>
						        <textarea name="complainIdeal" id="complain" cols="50" rows="10" class="text_style_border2"></textarea>
						      </td>
						    </tr>
						    <tr>
						      <td height="40">&nbsp;</td>
						      <td>
						        <input type="submit" name="Submit" value="提交" onclick="return checkInput();"/>
						        <input type="reset" name="Submit2" value="重置" />
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
  				<td><jsp:include flush="true" page="../front/buttom.jsp" /></td>
  			</tr>
  		</table>
  </body>
</html:html>