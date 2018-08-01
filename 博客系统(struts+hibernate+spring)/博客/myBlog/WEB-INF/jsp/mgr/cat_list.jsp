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

<security:isNotRoleOf role="manager">
	<jsp:include page="../pages/access_deny.jsp" flush="true"/>
</security:isNotRoleOf>
<security:isRoleOf role="manager">

<dlog:category id="categories" security="true" withLogCount="true"/>
<bean:parameter id="cat_id" name="cat_id" value=""/>
<bean:size id="catcount" name="categories"/>

<script language="javascript">
	document.title += ' [<bean:message key="ADMIN_CATEGORY_TITLE" bundle="html"/>]';
</script>
<jsp:include page="admin_nav_bar.jsp" flush="true">
	<jsp:param name="sel" value="2"/>
</jsp:include>
<table width="100%" cellspacing="0" cellpadding="2" class="tableBorder">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='1' align='center' bgcolor="#e2e2e2">
        <tr> 
          <td bgcolor='#e2e2e2'>&nbsp;<b><font color="#000000"> <bean:message key="CATLIST_HEAD" arg0="<%=String.valueOf(catcount)%>" bundle="html"/></font></b>
          	<font color="red"><html:errors/></font>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="2" align='center' bgcolor="#e2e2e2">
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><b><bean:message key="CATLIST_ICON" bundle="html"/></b></td>
            <td align="center"><b><bean:message key="CATLIST_NAME" bundle="html"/></b></td>
            <td align="center"><b><bean:message key="CATLIST_TYPE" bundle="html"/></b></td>
            <td align="center"><b><bean:message key="CATLIST_LOGCOUNT" bundle="html"/></b></td>
            <td width="250" align="right">&nbsp;</td>
            <td width="16" align="right"></td>
            <td width="16" align="left"></td>
            <td width="16" align="center"></td>
            <td width="16" align="center"></td>
          </tr>
	  <logic:iterate id="cat" name="categories" indexId="idx">
          <tr bgcolor="<%=(((idx.intValue()%2)==0)?"#ffffff":"#f8f8f8")%>"> 
            <td align="center"><logic:notEmpty name="cat" property="iconUrl"><img src="<bean:write name="cat" property="iconUrl"/>" border=0/></logic:notEmpty><logic:empty name="cat" property="iconUrl">[NONE]</logic:empty></td>
            <td align="center"><bean:write name="cat" property="name"/></td>
            <td align="center"><bean:write name="cat" property="typeDesc"/></td>
            <td align="center"><bean:write name="cat" property="logCount"/></td>
            <td width="250" align="right">&nbsp;</td>
            <td width="16" align="right"><logic:notEqual name="idx" value="0"><html:link page="/category.do" paramId="eventSubmit_MoveUp" paramName="cat" paramProperty="id"><html:img altKey="CATLIST_MOVEUP" page="/images/arrow_up.gif" border="0" bundle="html"/></html:link></logic:notEqual></td>
            <td width="16" align="left"><logic:lessThan name="idx" value="<%=String.valueOf(categories.size()-1)%>"><html:link page="/category.do" paramId="eventSubmit_MoveDown" paramName="cat" paramProperty="id"><html:img altKey="CATLIST_MOVEDN" page="/images/arrow_down.gif" border="0" bundle="html"/></html:link></logic:lessThan></td>
            <td width="16" align="center"><a href="?cat_id=<bean:write name="cat" property="id"/>"><html:img altKey="CATLIST_EDIT" page="/images/icon_edit2.gif" border="0" bundle="html"/></a></td>
            <td width="16" align="center"><html:link page="/category.do" paramId="eventSubmit_DeleteCategory" paramName="cat" paramProperty="id"><html:img altKey="CATLIST_DELETE" page="/images/icon_delete.gif" border="0" bundle="html"/></html:link></td>
          </tr>
      </logic:iterate>
      </table>
    </td>
  </tr>
</table>
<table border="0"><tr><td></td></tr></table>
<table width="100%" cellspacing="0" cellpadding="2">     	
  <dlog:getCategory id="categoryForm" scope="request"/>
  <html:form name="categoryForm" type="dlog4j.formbean.CategoryForm" action="/category" onsubmit="return CheckForm(this);" scope="request">
  <logic:notEmpty name="categoryForm" property="name">
  	<input type="hidden" name="id" value="<bean:write name="categoryForm" property="id"/>"/>
  </logic:notEmpty>
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='1' align='center' bgcolor="#e2e2e2">
        <tr> 
          <td bgcolor='#e2e2e2'>&nbsp;<b><font color="#000000"> <logic:notEmpty name="categoryForm" property="name"><bean:message key="CATLIST_SUBMIT_EDIT" bundle="html"/></logic:notEmpty><logic:empty name="categoryForm" property="name"><bean:message key="CATLIST_SUBMIT_NEW" bundle="html"/></logic:empty><bean:message key="CATLIST_TITLE" bundle="html"/>:</font></b>
          	<font color="red"><html:errors property="edit"/></font>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#e2e2e2"> 
  		  <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="CATLIST_NAME" bundle="html"/></td>
            <td width="88%"> <html:text name="categoryForm" property="name" /> <font color="#FF0000"> * </font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="CATLIST_ICON" bundle="html"/></td>
            <td width="88%"> 
            	<select name="iconUrl">
            		<option value="">[NONE]</option>
            	</select>
			</td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="CATLIST_TYPE" bundle="html"/></td>
            <td width="88%"> 
            	<select name="type">
            		<option value="1" <logic:equal name="categoryForm" property="type" value="1">SELECTED</logic:equal>><bean:message key="CATEGORY_TYPE_GENERAL" bundle="html"/></option>
            		<option value="2" <logic:equal name="categoryForm" property="type" value="2">SELECTED</logic:equal>><bean:message key="CATEGORY_TYPE_OPEN" bundle="html"/></option>
            		<option value="0" <logic:equal name="categoryForm" property="type" value="0">SELECTED</logic:equal>><bean:message key="CATEGORY_TYPE_OWNER" bundle="html"/></option>
            	</select>&nbsp;<bean:message key="CATLIST_TYPE_TIP" bundle="html"/>
			</td>
          </tr>
          <logic:empty name="categoryForm" property="name">
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="CATLIST_POS" bundle="html"/></td>
            <td width="88%"> 
            	<select name="order">          		
            		<option value="-1"><bean:message key="CATLIST_POS_BOTTOM" bundle="html"/></option>
				  <logic:iterate id="cat" name="categories" indexId="idx">
            		<option value="<bean:write name="cat" property="id"/>"><bean:write name="cat" property="name"/></option>
            	  </logic:iterate>
            	</select><input type="radio" name="position" value="-1"><bean:message key="CATLIST_POS_FRONT" bundle="html"/></input><input type="radio" name="position" value="1" checked><bean:message key="CATLIST_POS_AFTER" bundle="html"/></input>            	
			</td>
          </tr>
          </logic:empty>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%"><br> </td>
            <td width="88%" height="40"> 
            	<logic:notEmpty name="categoryForm" property="name"><input type="submit" class="button" name="eventSubmit_EditCategory" value="<bean:message key="CATLIST_SUBMIT_UPDATE" bundle="html"/>"></logic:notEmpty>
            	<input type="submit" class="button" name="eventSubmit_CreateCategory" value="<bean:message key="CATLIST_SUBMIT_ADD" bundle="html"/>">
            	<input type="reset" class="button" name="btn_reset" value="<bean:message key="CATLIST_SUBMIT_RESET" bundle="html"/>"> 
            </td>
          </tr>
      </table></td>
  </tr>
  </html:form>
</table>

<script language="JavaScript">
function CheckForm(form1)
{
	with(form1){
	if (name.value.length == 0) {
		alert("<bean:message key="CATLIST_NAME_TIP" bundle="html"/>");
		loginName.focus();
		return false;
	}
	}
	return true;
}
</script>
</security:isRoleOf>