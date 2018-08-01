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

<%@ page import="java.util.*,
				 org.apache.struts.*,
				 org.apache.struts.util.*,
				 org.apache.struts.action.*" %>

<dlog:getlog id="logForm" withReplies="true" previd="prev_log" nextid="next_log"/>
<logic:empty name="logForm">
<table border="0" width='95%' align="center">
<tr><td>
	<bean:message key="SHOWLOG_ERROR" bundle="html"/>
</td></tr>
</table>
</logic:empty>
<logic:notEmpty name="logForm">
<script language="javascript">
	document.title += '/<bean:write name="logForm" property="title" filter="false"/>';
</script>
<bean:parameter id="log_id" name="log_id" value="-1"/>
<bean:size id="replyCount" name="logForm" property="replies"/>
<dlog:getLoginUser id="loginUser"/>
<logic:messagesPresent property="bookmark">
<%
	String msg = "";
    ActionErrors errors = null;
    errors = RequestUtils.getActionErrors(pageContext, Globals.ERROR_KEY);
    if ((errors != null) && !errors.isEmpty()) {
        Iterator reports = errors.get("bookmark");
        while (reports.hasNext()) {
            ActionError report = (ActionError) reports.next();
            msg += RequestUtils.message(
                    pageContext,
                    null,
                    Globals.LOCALE_KEY,
                    report.getKey(),
                    report.getValues());
        }
    }
%>
<%if(msg!=null&&msg.trim().length()>0){%>
<script language="javascript">
	alert("<%=msg%>");
</script>
<%}%>
</logic:messagesPresent>
<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<table cellSpacing="4" cellPadding="0" width="100%" border="0">
	<tr>
	  <td>
	   	<logic:notEmpty name="prev_log">
	  	<a href="?cat_id=<bean:write name="cat_id"/>&log_id=<bean:write name="prev_log" property="id"/>">
		<html:img page="/images/icon_ar.gif" border="0"/><bean:message key="SHOWLOG_PREVIOUS_LOG" bundle="html"/> <bean:write name="prev_log" property="title" filter="false"/></a>
	    </logic:notEmpty>
	  </td>
	  <td align="right">
	  	<logic:notEmpty name="next_log">
	  	<a href="?cat_id=<bean:write name="cat_id"/>&log_id=<bean:write name="next_log" property="id"/>">
	  	<bean:message key="SHOWLOG_NEXT_LOG" bundle="html"/> <bean:write name="next_log" property="title" filter="false"/> <html:img page="/images/icon_al.gif" border="0"/></a>
	    </logic:notEmpty>
	  </td>
    </tr>
</table>
<table cellSpacing="4" cellPadding="0" width="100%" class="tableBorder" border=0>
    <tr>
      <td nowrap>
      	<font class="log_title"><bean:write name="logForm" property="title" filter="false"/></font>&nbsp;&nbsp;<font class="smalltext">[<bean:write name="logForm" property="logTime" format="yy-M-d"/>] 
        [ from </font><a href="<bean:write name="logForm" property="authorUrl"/>" target="_blank"><bean:write name="logForm" property="author"/></a><font class="smalltext">]</font>
      </td>
      <td align="right">
      	<img src="<html:rewrite page="/images"/>/hn2_t_<bean:write name="logForm" property="weather"/>.gif"> 
        <img src="<html:rewrite page="/images"/>/hn2_<bean:write name="logForm" property="weather"/>.gif" align="absMiddle">&nbsp;
        <img src="<html:rewrite page="/images"/>/face<bean:write name="logForm" property="moodLevel"/>.gif">
      </td>
    </tr>
   	<tr><td height=1 colspan=2><hr size="1" noshade color="#CCCCCC"></td></tr>
    <tr>
      <td colspan=2 class="log_content">
		<bean:write name="logForm" property="content" filter="false"/>
      </td>
    </tr>
   	<tr><td height=1 colspan=2><hr size="1" noshade color="#CCCCCC"></td></tr>
	<tr>
	  <td colspan=2 align=right><bean:message key="TRACKBACK_LOG" bundle="html"/> <font class="smalltext"><%=dlog4j.util.RequestUtils.getBaseURL(request)%>/trackback.do?log_id=<bean:write name="logForm" property="id"/></font></td>
	</tr>
    <tr>
      <td colspan=2>
      <table border="0" width="100%"><tr>
      <td>
      <logic:notEmpty name="logForm" property="searchKey">
		<html:link page="/main.jspe" paramId="query" paramName="logForm" paramProperty="searchKey"><bean:message key="SHOWLOG_CORRELATIVE" bundle="html"/></html:link >
      </logic:notEmpty >
	  </td>
      <td align="right" nowrap><font class="smalltext">      	
		<bean:size id="tbCount" name="logForm" property="trackBacks" />
      	In [<html:link page="/main.jspe" paramId="cat_id" paramName="logForm" paramProperty="categoryId"><%=logForm.getCategory().getName()%></html:link>] By [<html:link page="/viewuser.jspe" paramId="userid" paramName="logForm" paramProperty="ownerId"><bean:write name="logForm" property="ownerName"/></html:link>] 
        at <bean:write name="logForm" property="logTime" format="yy-M-d h:m"/> | Comments [<bean:write name="replyCount"/>] | <html:link page="/pages/trackbacks.jspe" paramId="log_id" paramName="logForm" paramProperty="id" titleKey="TRACKBACK_VIEW" bundle="html">TB</html:link> [<%=tbCount%>]
        | <bean:write name="logForm" property="viewCount"/> Views</font>
        <%if(loginUser.isLogin()){%>
        <a href="bookmark.do?log_id=<bean:write name="logForm" property="id"/>&eventSubmit_AddBookMark=<bean:write name="logForm" property="id"/>"><html:img altKey="LOG_BOOKMARK" bundle="html" page="/images/bookmark.gif" align="absMiddle" border="0"/></a>
        <%}%>
        <%if(loginUser.isAdmin()||logForm.getOwnerId()==loginUser.getId()){%>
        <a href="editlog.jspe?log_id=<bean:write name="logForm" property="id"/>"><html:img altKey="LOG_EDIT" bundle="html" page="/images/icon_edit.gif" align="absMiddle" border="0"/></a>
        <%}%>
      </td>
      </tr></table>
      </td>
    </tr>
</table>
<br>
<table cellSpacing="4" cellPadding="0" width="100%" border="0">
    <tr>
      <td><b><bean:message key="COMMENTS" bundle="html"/></b></td>
    </tr>
</table>
<logic:iterate id="reply" name="logForm" property="replies">
<table cellSpacing="4" cellPadding="0" width="100%" border="0">
    <tr>
      <td><a name="<bean:write name="reply" property="id"/>"><logic:notEmpty name="reply" property="faceUrl"><img src="<bean:write name="reply" property="faceUrl" filter="false"/>" align="absMiddle" border="0"> </logic:notEmpty>
        <html:link page="/viewuser.jspe" paramId="userid" paramName="reply" paramProperty="authorId"><bean:write name="reply" property="authorName"/></html:link> 
        <bean:message key="COMMENT_SAY" bundle="html"/>:</a></td>
    </tr>
    <tr>
      <td>
    	<dlog:format html="<%=(((dlog4j.formbean.ReplyForm)reply).getShowFormerly()==1)%>">
      	<bean:write name="reply" property="content" filter="<%=(((dlog4j.formbean.ReplyForm)reply).getShowFormerly()==1)%>"/>
      	</dlog:format>
      </td>
    </tr>
    <tr>
      <td class="smalltext" align="right">at <bean:write name="reply" property="writeTime" format="yy-MM-dd HH:mm"/>&nbsp;&nbsp;      
      <%if(loginUser.isAdmin()||((dlog4j.formbean.ReplyForm)reply).getAuthorId()==loginUser.getId()){%>
      <a onclick="return confirm('<bean:message key="COMMENT_DELETE_TIP" bundle="html"/>')" href="reply.do?eventSubmit_DeleteReply=<bean:write name="reply" property="id"/>"><html:img altKey="COMMENT_DELETE" bundle="html" page="/images/icon_delete.gif" align="absMiddle" border="0"/></a>
      <a href="showlog.jspe?cat_id=<bean:write name="logForm" property="categoryId"/>&log_id=<bean:write name="logForm" property="id"/>&reply_id=<bean:write name="reply" property="id"/>#reply"><html:img altKey="COMMENT_EDIT" bundle="html" page="/images/icon_edit.gif" align="absMiddle" border="0"/></a>
      <%}%>
      </td>
    </tr>
</table>
</logic:iterate>
<table cellSpacing="4" cellPadding="0" width="100%" border="0">
	<tr>
	  <td>
	   	<logic:notEmpty name="prev_log">
	  	<a href="?cat_id=<bean:write name="cat_id"/>&log_id=<bean:write name="prev_log" property="id"/>">
		<html:img page="/images/icon_ar.gif" border="0"/><bean:message key="SHOWLOG_PREVIOUS_LOG" bundle="html"/> <bean:write name="prev_log" property="title" filter="false"/></a>
	    </logic:notEmpty>
	  </td>
	  <td align="right">
	  	<logic:notEmpty name="next_log">
	  	<a href="?cat_id=<bean:write name="cat_id"/>&log_id=<bean:write name="next_log" property="id"/>">
	  	<bean:message key="SHOWLOG_NEXT_LOG" bundle="html"/> <bean:write name="next_log" property="title" filter="false"/> <html:img page="/images/icon_al.gif" border="0"/></a>
	    </logic:notEmpty>
	  </td>
    </tr>
</table>
<br>
<script language="javascript">
	function checkReply(field1){
		if(field1.value==""){
			alert("<bean:message key="COMMENT_CONTENT_TIP" bundle="html"/>");
			return false;
		}
		return true;
	}
</script>
<table width="100%" cellSpacing="4" cellPadding="0" border="0">	
	<dlog:reply id="replyForm" scope="request"/>
	<html:form name="replyForm" type="dlog4j.formbean.ReplyForm" action="/reply" onsubmit="return checkReply(this.content)" scope="request">	
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
			document.write('<script>function editor_insertHTML(obj,str) { replyForm.content.value=replyForm.content.value+str; }</script>'); 
			//document.write('<input type=hidden name=showFormerly value=1>');
		}
	// -->
	</script>

	<input type="hidden" name="authorId" value="<bean:write name="loginUser" property="id"/>"/>
	<input type="hidden" name="logId" value="<bean:write name="logForm" property="id"/>"/>
	<input type="hidden" name="log_id" value="<bean:write name="logForm" property="id"/>"/>
	<logic:notEmpty name="replyForm" property="content">
	<input type="hidden" name="id" value="<bean:write name="replyForm" property="id"/>"/>
	</logic:notEmpty>
      <tr bgcolor="#D9D9D9">
      	<td><a name="reply"><b><bean:message key="COMMENT_SUBMIT" bundle="html"/><logic:messagesPresent>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><html:errors property="updateReply"/></font></logic:messagesPresent></b></a></td>
      </tr>
      <tr>
        <td>    
		<security:isRoleOf role="guest" orNull="true">
   		<bean:message key="LOGIN_USERNAME" bundle="html"/>:<html:text name="loginUser" property="loginName" size="12"/>&nbsp;&nbsp;
   		<bean:message key="LOGIN_PASSWORD" bundle="html"/>:<html:password name="loginUser" property="password" size="12"/>
		</security:isRoleOf>
		<security:isNotRoleOf role="guest" orNull="true">
		<bean:message key="EDITUSER_NICK" bundle="html"/>:
        <input disabled size="8" value="<bean:write name="loginUser" property="displayName"/>" name="nickname">
		</security:isNotRoleOf>
        &nbsp;<bean:message key="EDITUSER_PIC" bundle="html"/>:         
        <jsp:include page="pages/portrait.jsp" flush="true"/>
        </td>
      </tr>
      <tr>
        <td>
        	<html:textarea name="replyForm" property="content" styleId="replyContent" style="width:100%; height:150"></html:textarea> 
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
							 //  ['strikethrough','subscript','superscript','separator'],
							     ['justifyleft','justifycenter','justifyright','separator'],
							     ['OrderedList','UnOrderedList','Outdent','Indent','separator'],
							     ['forecolor','backcolor','separator'],
							     ['HorizontalRule','Createlink',<%if(loginUser.isAdmin()||loginUser.isFriend()){%>'InsertImage','InsertFlash',<%}%>'insertMulti','InsertTable'],
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
      	<td align="left">
        <logic:notEmpty name="replyForm" property="content">
		<security:isNotRoleOf role="guest" orNull="true">
		<input type="submit" value="<bean:message key="COMMENT_MODIFY" bundle="html"/>" class="button" name="eventSubmit_UpdateReply">
		</security:isNotRoleOf>
		</logic:notEmpty>
		<input type="submit" value="<bean:message key="COMMENT_ADD" bundle="html"/>" class="button" name="eventSubmit_AddReply">
		</td>
      </tr>
  	</html:form>
</table>
<!-- End of logForm -->
</logic:notEmpty>
