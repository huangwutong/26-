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
    	function check_pass(){
    		var pass=window.document.form1.oldEnterprisePass.value;
    		var pass1=window.document.form1.newEnterprisePass.value;
    		var pass2=window.document.form1.newEnterprisePass2.value;
    		if(pass.length==0||pass1.length==0||pass2.length==0){
    			alert("密码不能为空！");
    			return false;
    		}
    		if(pass1!=pass2){
    			alert("两次密码不一致！");
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
  				<td></td>
  			</tr>
  			<tr>
  				<td>
		  		<table width="100%" border="0" cellspacing="2" cellpadding="0" align="center">
				  <tr>
				    <td width="230" valign="top"><jsp:include flush="true" page="../enterprise/leftEnterpriseCenter.jsp"/></td>
				    <td width="591" align="center" valign="top">
				   <form id="form1" name="form1" method="post" action="editEnterprisePass.do">
                    <table width="80%" border="0" align="center" cellpadding="2" cellspacing="2">
                      <tr>
                        <td colspan="2"><span style="color: red;font-size: 12px;font-weight: bold;">修改密码：</span></td>
                      </tr>
                      <tr>
                        <td colspan="2" height="10"><img src="user/image/regok_2.gif" alt="" width="499" height="1" /></td>
                      </tr>
                      <tr>
                        <td width="100" height="25" align="center" class="font_style_normal">旧 密 码：</td>
                        <td>
                          <input type="password" name="oldEnterprisePass" class="text_style_border"/><SPAN style="color: red;font-size: 12px;font-weight: bold;"><html:errors property="enterprisepass"/></SPAN>
                        </td>
                      </tr>
                      <tr>
                        <td height="25" align="center" class="font_style_normal">新 密 码：</td>
                        <td>
                          <input type="password" name="newEnterprisePass" class="text_style_border"/>
                        </td>
                      </tr>
                      <tr>
                        <td height="25" align="center" class="font_style_normal">密码确认：</td>
                        <td>
                          <input type="password" name="newEnterprisePass2" class="text_style_border"/>
                        </td>
                      </tr>
                      <tr>
                        <td height="30" align="center"></td>
                        <td height="30">
                        <input type="submit" name="Submit2" value="修改" onclick="return check_pass();"/>
                        <input type="reset" name="Submit" value="重置" /></td>
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