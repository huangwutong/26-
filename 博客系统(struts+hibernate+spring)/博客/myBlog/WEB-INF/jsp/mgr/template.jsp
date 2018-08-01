<%
/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>
<%@ page import="java.io.*" %>

<security:isNotRoleOf role="manager">
	<jsp:include page="../pages/access_deny.jsp" flush="true"/>
</security:isNotRoleOf>
<security:isRoleOf role="manager">

<script language="javascript">
	document.title += ' [<bean:message key="ADMIN_TEMPLATE_TITLE" bundle="html"/>]';
</script>
<dlog:getsite id="site"/>
<jsp:include page="admin_nav_bar.jsp" flush="true">
	<jsp:param name="sel" value="8"/>
</jsp:include>

<bean:parameter id="file" name="file" value="reply_tip.html"/>

<table cellspacing="4" cellpadding="4" width="100%">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='2' bgcolor="#e2e2e2">
        <tr> 
          <td bgcolor='#e2e2e2'><b>
			[<html:link page="/mgr/template.jspe?file=reply_tip.html">
				<logic:equal name="file" value="reply_tip.html"><font color="red"></logic:equal><bean:message key="TEMPLATE_REPLY_TIP" bundle="html"/><logic:equal name="file" value="reply_tip.html"></font></logic:equal>
			</html:link>]
			[<html:link page="/mgr/template.jspe?file=password_tip.html">
				<logic:equal name="file" value="password_tip.html"><font color="red"></logic:equal><bean:message key="TEMPLATE_PASSWORD_TIP" bundle="html"/><logic:equal name="file" value="password_tip.html"></font></logic:equal>
			</html:link>]
			[<html:link page="/mgr/template.jspe?file=scroll_tip.html">
				<logic:equal name="file" value="scroll_tip.html"><font color="red"></logic:equal><bean:message key="TEMPLATE_SCROLL_TIP" bundle="html"/><logic:equal name="file" value="scroll_tip.html"></font></logic:equal>
			</html:link>]
		  </b></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#e2e2e2">
      	<form name="tmpForm" action="<html:rewrite page="/template.do"/>" method="post">
      	<input type="hidden" name="file" value="<%=file%>"/>
        <tr bgcolor="#f8f8f8">
          <td colspan="2"> 
          	<textarea name="content" style="width:100%" rows="20"><%String path = application.getRealPath("/WEB-INF/template/"+file);out.print(getTemplateContent(path));%></textarea>
          </td>
        </tr>
        <tr bgcolor="#f8f8f8"> 
          <td height="40" colspan="2" align="center"> 
          	<input type="submit" class="button" name="eventSubmit_UpdateTemplate" value="<bean:message key="MODIFY" bundle="html"/>">&nbsp; &nbsp;&nbsp;
           	<input type="reset" class="button" name="btn_reset" value="<bean:message key="RESET" bundle="html"/>"> 
          </td>
        </tr>
        </form>
      </table></td>
  </tr>
</table>

</security:isRoleOf>

<%!
	/**
	 * to get the content from template file.
	 */
	String getTemplateContent(String file) throws IOException{
		BufferedReader reader = null;
		FileInputStream fis = null;
		StringBuffer content = new StringBuffer();
		try{
			fis = new FileInputStream(file);
			reader = new BufferedReader(new InputStreamReader(fis));
			String line;
			do{
				line = reader.readLine();
				if(line==null)
					break;
				if(content.length()>0)
					content.append(System.getProperty("line.separator"));
				content.append(line);
			}while(true);
		}finally{
			if(fis!=null)
				fis.close();
		}
		return content.toString();
	}
%>