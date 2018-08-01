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
<%@ page import="dlog4j.util.RequestUtils" %>

<security:cannotAccess resource="log" operation="maintain" range="self">
	<jsp:include page="pages/access_deny.jsp" flush="true"/>
</security:cannotAccess>
<security:canAccess resource="log" operation="maintain" range="self">

<dlog:category id="categories" security="true" addLog="true"/>
<bean:size id="cat_count" name="categories"/>
<logic:equal name="cat_count" value="0" >
	<jsp:include page="error/no_cat_available.jsp" flush="true"/>
</logic:equal>
<logic:greaterThan name="cat_count" value="0">
<dlog:getsite id="site"/>
<dlog:draft id="draft" log="logForm" scope="request"/>
<bean:parameter id="cat_id" name="cat_id" value="-1"/>

<script language="javascript">
	document.title += ' [<bean:message key="USERINFO_WRITE_LOG" bundle="html"/>]';
	
	function checkContent(field1){
		if(field1.value==""){
			alert('<bean:message key="LOG_CONTENT_TIP" bundle="html"/>');
			field1.focus();
			return false;
		}
		return true;
	}
</script>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tableBorder">
<tr>
<td class="addinfo">
<html:form name="logForm" action="/addlog" type="dlog4j.formbean.LogForm" onsubmit="return checkContent(this.content)" scope="request">

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
	} 
	else { 
		document.write('<script>function editor_generate() { return false; }</script>'); 
		document.write('<script>function editor_insertHTML(obj,str) { logForm.content.value=logForm.content.value+str; }</script>'); 
		//document.write('<input type=hidden name=showFormerly value=1>');
	}
// -->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table cellSpacing="1" width="100%" cellPadding="2" width="100%">
      	  <tr>
      	 	<td>
	      	 	<script src='<html:rewrite page="/js/calendar.js"/>' language='javascript'></script>
      	  		&nbsp;<script language=javascript>CAL2();</script>&nbsp;&nbsp;&nbsp;&nbsp;
      	  		<jsp:include page="pages/weather.jsp" flush="true"/>
      	  	</td>
      	  </tr>
          <tr>
            <td>
            	<b>&nbsp;<bean:message key="LOG_IN_CATEGORY" bundle="html"/>
				<select name="categoryId">
				<logic:iterate id="cat" name="categories" indexId="idx">
				<option value="<bean:write name="cat" property="id"/>" <logic:equal name="cat" property="id" value="<%=cat_id%>">SELECTED</logic:equal>><bean:write name="cat" property="name"/></option>
	          	</logic:iterate>
    	  		</select> <bean:message key="LOG_IN_CATEGORY2" bundle="html"/></b></font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><b><html:errors/></b>
      		</td>            
          </tr>
          <tr>
          	<td>
            &nbsp;<bean:message key="LOG_TITLE" bundle="html"/> <html:text name="logForm" property="title" maxlength="100" size="59"/>&nbsp;<b><font color="red"><html:errors property="title"/></font></b>
            </td>
          </tr>
          <tr>
          	<td>
            &nbsp;<bean:message key="LOG_SEARCH_KEYS" bundle="html"/> <html:text name="logForm" property="searchKey" maxlength="40" size="59"/>&nbsp;<b><font color="red"><html:errors property="title"/></font></b>
            </td>
          </tr>
          <tr>
            <td>
            	&nbsp;<bean:message key="LOG_FROM" bundle="html"/> 
            	<logic:notEmpty name="logForm" property="author"><html:text name="logForm" property="author" size="10" /></logic:notEmpty>
            	<logic:empty name="logForm" property="author"><input type="text" name="author" size="10" value="<bean:message key="LOG_FROM_SELF" bundle="html"/>"/></logic:empty>
            	&nbsp;<b><font color="red"><html:errors property="author"/></font></b>
              	<bean:message key="LOG_FROM_URL" bundle="html"/>
              	<logic:notEmpty name="logForm" property="authorUrl"><html:text name="logForm" property="authorUrl" size="35"/></logic:notEmpty>
              	<logic:empty name="logForm" property="authorUrl">
				<logic:notEmpty name="site" property="url">
					<html:text name="logForm" property="authorUrl" size="35" value="<%=site.getUrl()%>"/>
				</logic:notEmpty>
				<logic:empty name="site" property="url">
					<html:text name="logForm" property="authorUrl" size="35" value="<%=RequestUtils.getBaseURL(request)%>"/>
				</logic:empty>
				</logic:empty>
              	&nbsp;<b><font color="red"><html:errors property="authorUrl"/></font></b></td>              
          </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td align="center">
      <table border="0" width="99%"><tr><td>
	  <b><font color="red"><html:errors property="content"/></font></b>
      <html:textarea name="logForm" property="content" style="width:100%; height:300"></html:textarea>    
	  <script language="javascript1.2">
		editor_generate('content');
	  </script>
	  </td></tr></table>
    </td>
  </tr>
  <tr>
    <td>
    <table width="100%">
    <tr>
    	<td>&nbsp;<bean:message key="LOG_TRACK_URL" bundle="html"/>: <html:text name="logForm" property="refUrl" size="50"/></td>
    	<td width=120 align=left><input type="checkbox" name="bookmark" value="1"/><font color=red><bean:message key="LOG_BOOKMARK" bundle="html"/>&nbsp;</font></td>
    </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td>
    <table width="100%">
    <tr>
    	<td>&nbsp;<bean:message key="MOOD_LEVEL" bundle="html"/>:
    	<input type="radio" value="1" name="moodLevel"> <html:img page="/images/face1.gif" width="13" height="12"/> 
    	<input type="radio" value="2" name="moodLevel"> <html:img page="/images/face2.gif" width="25" height="12"/>
    	<input type="radio" value="3" name="moodLevel" CHECKED> <html:img page="/images/face3.gif" width="37" height="12"/> 
    	<input type="radio" value="4" name="moodLevel"> <html:img page="/images/face4.gif" width="49" height="12"/> 
    	<input type="radio" value="5" name="moodLevel"> <html:img page="/images/face5.gif" width="61" height="12"/></td>
    	<td width=120 align=left><input type="checkbox" name="replyNotify" value="1" checked/><font color=red><bean:message key="LOG_MAIL_TIP" bundle="html"/>&nbsp;</font></td>
    </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td colspan="2" height="35"><jsp:include page="pages/usefaces.jsp" flush="true"/></td>
  </tr>
  <tr>
    <td valign="center" align="right" colspan="2">
    	<logic:empty name="draft">
    	<input type="submit" name="eventSubmit_SaveDraft" value="<bean:message key="LOG_ADD_DRAFT" bundle="html"/>" class="button">
    	</logic:empty>
    	<logic:notEmpty name="draft">
    	<input type='hidden' name='draft_id' value='<bean:write name="draft" property="id"/>'/>
    	<input type="submit" name="eventSubmit_UpdateDraft" value="<bean:message key="LOG_SAVE_DRAFT" bundle="html"/>" class="button">
    	<input type="submit" name="eventSubmit_DeleteDraft" value="<bean:message key="LOG_DELETE_DRAFT" bundle="html"/>" class="button" onclick="return confirm('<bean:message key="LOG_DELETE_DRAFT_TIP" bundle="html"/>');">
    	</logic:notEmpty>
    	<input type="submit" name="eventSubmit_AddLog" value="<bean:message key="LOG_SUBMIT" bundle="html"/>" class="button">
      	<input type="reset" value="<bean:message key="RESET" bundle="html"/>" onclick="logForm.title.focus()" class="button">
      	<input type="button" value="<bean:message key="BACK" bundle="html"/>" onclick="history.go(-1)" name="Return" class="button">&nbsp;&nbsp;      	
		<dlog:getLoginUser id="loginUser"/>      	
      	<input type="hidden" name="userid" value="<bean:write name="loginUser" property="loginName"/>">
	</td>
  </tr>
</table>
</html:form>
</td>
</tr>
</table>
</logic:greaterThan>
</security:canAccess>