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
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>
<!-- based on insimage.dlg -->

<jsp:useBean id="filePath" class="java.lang.String" scope="request"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD W3 HTML 3.2//EN">
<HTML  id=dlgImage>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta http-equiv="MSThemeCompatible" content="Yes">
<TITLE><bean:message key="UPLOAD_FLASH_TITLE" bundle="html"/></TITLE>
<style>
  html, body, button, div, input, select, td, fieldset { font-family:  "Verdana", "Arial"; font-size: 12px; };
</style>
<SCRIPT>

// if we pass the "window" object as a argument and then set opener to
// equal that we can refer to dialogWindows and popupWindows the same way
opener = window.dialogArguments;

var _editor_url = opener._editor_url;
var objname     = 'content';
var config      = opener.document.all[objname].config;
var editor_obj  = opener.document.all["_" +objname+  "_editor"];
var editdoc     = editor_obj.contentWindow.document;

function _CloseOnEsc() {
  if (event.keyCode == 27) { window.close(); return; }
}

window.onerror = HandleError

function HandleError(message, url, line) {
  var str = "An error has occurred in this dialog." + "\n\n"
  + "Error: " + line + "\n" + message;
  alert(str);
//  window.close();
  return true;
}

function Init() {
  document.body.onkeypress = _CloseOnEsc;
  <logic:notEmpty name="filePath">
	uploadForm.flashUrl.value='<bean:write name="filePath"/>';
	uploadForm.imgType[1].checked=true;
	btnOKClick();
  </logic:notEmpty>
}

function _isValidNumber(txtBox) {
  var val = parseInt(txtBox);
  if (isNaN(val) || val < 0 || val > 9999) { return false; }
  return true;
}

function _isValidNumber(txtBox) {
  var val = parseInt(txtBox);
  if (isNaN(val) || val < 0 || val > 999) { return false; }
  return true;
}

function btnOKClick() {
  var curRange = editdoc.selection.createRange();
  
  // error checking
  
  with(uploadForm){
  
	  itype = "file";
  
  for (var i=0; i<imgType.length; i++){
  	if(imgType[i].checked)
	  	itype = imgType[i].value;
  }

  if (itype=="url" && (!flashUrl.value || flashUrl.value=="" || flashUrl.value == "http://")) { 
    alert("<bean:message key="UPLOAD_FLASH_URL_TIP" bundle="html"/>");
    flashUrl.focus();
    return false;
  }
  if (itype=="file" && uploadFile.value=="") { 
    alert("<bean:message key="UPLOAD_FLASH_PATH_TIP" bundle="html"/>");
    uploadFile.focus();
    return false;
  }
  if (txtWidth.value && !_isValidNumber(txtWidth.value)) {
    alert("<bean:message key="UPLOAD_FLASH_WIDTH_TIP" bundle="html"/>");
    txtWidth.focus();
    return false;
  }
  if (txtHeight.value && !_isValidNumber(txtHeight.value)) {
    alert("<bean:message key="UPLOAD_FLASH_HEIGHT_TIP" bundle="html"/>");
    txtHeight.focus();
    return false;
  }
  if(itype=="file"){
  	btnOK.disabled=true;
  	uploadForm.submit();
  	return;
  }
  // delete selected content (if applicable)
  if (editdoc.selection.type == "Control" || curRange.htmlText) {

    if (!confirm("Overwrite selected content?")) { return; }

    curRange.execCommand('Delete');
    curRange = editdoc.selection.createRange();
  }
  autoPlay = "false";
  if(play.checked)
  	autoPlay = "true";
  autoLoop = "false";
  if(loop.checked)
  	autoLoop = "true";
  showMenu = "false";
  if(menu.checked)
  	showMenu="true";
  touming = "";
  if(transparent.checked)
  	touming="transparent";
  var flash = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="'+txtWidth.value+'" height="'+txtHeight.value+'">'
          	+ '<param name=movie value="'+flashUrl.value+'">'
            + '<param name=quality value=high>'
            + '<param name="wmode" value="'+touming+'">'
            + '<param name="menu" value="'+showMenu+'">'
  		    + '<param name="LOOP" value="'+autoLoop+'">'
		    + '<param name="PLAY" value="'+autoPlay+'">'
            + '<embed src="'+flashUrl.value+'" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="'+txtWidth.value+'" height="'+txtHeight.value+'" wmode="transparent">'
            + '</embed>'
        	+ '</object>\n';
  opener.editor_insertHTML('content', flash);
  }
  // insert table
  window.close();
}
</SCRIPT>
</HEAD>
<BODY id=bdy onload="Init()" style="background: threedface; color: windowtext;" scroll=no>

<html:form name="uploadForm" action="/uploadFlash" type="dlog4j.formbean.UploadFlashForm" enctype="multipart/form-data">
<font color="red"><html:errors/></font>
<table border=0>
<tr>
	<td colspan=2>
		<bean:message key="UPLOAD_FLASH_SOURCE" bundle="html"/>: 
		<input type="radio" name="imgType" value="file" onclick="picfile.style.display='';picurl.style.display='none'" checked><bean:message key="UPLOAD_FLASH_LOCAL" bundle="html"/>
		<input type="radio" name="imgType" value="url" onclick="picurl.style.display='';picfile.style.display='none'"><bean:message key="UPLOAD_FLASH_URL" bundle="html"/>
	</td>
	<td width="20%" rowspan="5" align="right" valign="top">
		<input ID=btnOK type=button tabIndex=40 onclick="btnOKClick();" value="<bean:message key="OK" bundle="html"/>"><br><br>
	  	<input ID=btnCancel type=reset tabIndex=45 onClick="window.close();" value="<bean:message key="CANCEL" bundle="html"/>"></td>
</tr>
<tr id=picurl style="display:none">
	<td colspan=2>
		<bean:message key="UPLOAD_FLASH_URL" bundle="html"/>:
		<html:text styleId="flashUrl" size="50" name="uploadForm" property="flashUrl"  tabindex="10" onfocus="select()"/>
	</td>
</tr>
<tr id=picfile >
	<td colspan=2>
		<bean:message key="UPLOAD_FLASH_FILE" bundle="html"/>:
		<html:file styleId="uploadFile" size="40" name="uploadForm" property="uploadFile"  tabindex="10" onfocus="select()"/>
	</td>
</tr>
<tr>
	<td colspan=2><hr size=1></td>
</tr>
<tr>
	<td align="top">
	<fieldset style='padding-left:4px;height:65px'><legend><bean:message key="UPLOAD_FLASH_OPTIONS" bundle="html"/></legend>
		<input type="checkbox" name="menu" value="true" <logic:equal name="uploadForm" property="menu" value="true">checked</logic:equal>><bean:message key="UPLOAD_FLASH_CONTEXT_MENU" bundle="html"/>
		<input type="checkbox" name="transparent" value="true" <logic:equal name="uploadForm" property="transparent" value="true">checked</logic:equal>><bean:message key="UPLOAD_FLASH_TRANSPARENT" bundle="html"/><br>
		<input type="checkbox" name="loop" value="true" <logic:equal name="uploadForm" property="loop" value="true">checked</logic:equal>><bean:message key="UPLOAD_FLASH_LOOP" bundle="html"/>
		<input type="checkbox" name="play" value="true" <logic:equal name="uploadForm" property="play" value="true">checked</logic:equal>><bean:message key="UPLOAD_FLASH_AUTO" bundle="html"/>
	</fieldset>
	</td>
	<td align="top">
	<fieldset style='padding-left:4px;height:65px'><legend><bean:message key="UPLOAD_FLASH_SIZE" bundle="html"/></legend>
		<bean:message key="UPLOAD_FLASH_WIDTH" bundle="html"/>:
		<html:text styleId="txtWidth" name="uploadForm" property="txtWidth" value="400" size="3" maxlength="3" tabindex="25" onfocus="select()"/>
		<br>
		<bean:message key="UPLOAD_FLASH_HEIGHT" bundle="html"/>:
		<html:text styleId="txtHeight" name="uploadForm" property="txtHeight" value="300" size="3" maxlength="3" tabindex="30" onfocus="select()"/>
	</fieldset>
	</td>
</tr>
</table>
</html:form>

</BODY>
</HTML>