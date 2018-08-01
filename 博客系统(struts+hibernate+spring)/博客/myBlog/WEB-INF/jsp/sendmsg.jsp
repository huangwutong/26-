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
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="userId" name="id" value="-1"/>
<bean:parameter id="loginName" name="name" value=""/>

<table cellspacing="4" cellpadding="4" width="98%">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='1' align='center' bgcolor="#e2e2e2">
        <tr> 
          <td bgcolor='#e2e2e2' align="left"><b><bean:message key="SENDMSG_HEAD" arg0="<%=loginName%>" bundle="html"/><logic:messagesPresent>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><html:errors/></font></logic:messagesPresent></b></td>
        </tr>
      </table>
      <table cellSpacing="1" cellPadding="2" width="100%" align="center" class="scomment_border" border="0">
	  <dlog:replymsg id="messageForm" scope="request"/>
	  <html:form name="messageForm" type="dlog4j.formbean.MessageForm" action="/message" scope="request">	
		<script language="Javascript1.2">
		<!-- 
		// load htmlarea
		_editor_url = "";                     // URL to htmlarea files
		var win_ie_ver = parseFloat(navigator.appVersion.split("MSIE")[1]);
		if (navigator.userAgent.indexOf('Mac')        >= 0) { win_ie_ver = 0; }
		if (navigator.userAgent.indexOf('Windows CE') >= 0) { win_ie_ver = 0; }
		if (navigator.userAgent.indexOf('Opera')      >= 0) { win_ie_ver = 0; }
		if (win_ie_ver >= 5.5) {
			document.write('<script src="<html:rewrite page="/js/htmleditor.js"/>"');
			document.write(' language="Javascript1.2"></script>');  
			document.write('<input type=hidden name=isHtml value=1>');
		} 
		else { 
			document.write('<script>function editor_generate() { return false; }</script>'); 
			document.write('<script>function editor_insertHTML(obj,str) { messageForm.content.value=messageForm.content.value+str; }</script>'); 
			//document.write('<input type=hidden name=isHtml value=0>');
		}
		// -->
		</script>
		<input type="hidden" name="status" value="0"/>
		<input type="hidden" name="id" value="<%=userId%>"/>
		<input type="hidden" name="name" value="<%=loginName%>"/>
		<input type="hidden" name="toUserId" value="<bean:write name="userId"/>"/>
    	<tbody>
      	<tr>
        <td colSpan="2">
        	<html:textarea name="messageForm" property="content" style="width:100%; height:200"></html:textarea> 
		    <script language="javascript1.2">
		    	var config = new Object();    // create new config object
				config.fontsizes = {
								    "1 (8 pt)":  "1",
								    "2 (10 pt)": "2",
								    "3 (12 pt)": "3",
								    "4 (14 pt)": "4",
								    "5 (18 pt)": "5",
								    "6 (24 pt)": "6",
								    "7 (36 pt)": "7"
									};
				<logic:notEqual name="loginUser" property="admin" value="true">
				config.toolbar = [
							     ['fontname'],
							     ['fontsize'],
							     ['linebreak'],
							     ['bold','italic','underline','separator'],
							     ['justifyleft','justifycenter','justifyright','separator'],
							     ['OrderedList','UnOrderedList','Outdent','Indent','separator'],
							     ['forecolor','backcolor','separator'],
							     ['HorizontalRule','Createlink','InsertMulti','InsertTable'],
								 ];
				</logic:notEqual>
				editor_generate('content',config);
	  		</script>
        </td>
      	</tr>
  	  	<tr>
    		<td><jsp:include page="pages/usefaces.jsp" flush="true"/></td>
  	  	</tr>
      	<tr>
      	<td align="right">
		<input type="submit" value="<bean:message key="SENDMSG_SUBMIT" bundle="html"/>" class="button" name="eventSubmit_Send">
		<input type="button" value="<bean:message key="BACK_TO_HOME" bundle="html"/>" class="button" onclick="location.href='main.jspe'">
		</td>
      	</tr>
    </tbody>
  	</html:form>
</table>
	</td>
  </tr>
</table>
