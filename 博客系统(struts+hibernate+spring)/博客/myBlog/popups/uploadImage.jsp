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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="MSThemeCompatible" content="Yes">
<TITLE><bean:message key="UPLOAD_IMAGE_TITLE" bundle="html"/></TITLE>
<style>
  html, body, button, div, input, select, td, fieldset { font-family:  "Verdana", "Arial"; font-size: 12px; };
</style>
<SCRIPT defer>

function _CloseOnEsc() {
  if (event.keyCode == 27) { window.close(); return; }
}

function _getTextRange(elm) {
  var r = elm.parentTextEdit.createTextRange();
  r.moveToElementText(elm);
  return r;
}

window.onerror = HandleError

function HandleError(message, url, line) {
  var str = "An error has occurred in this dialog." + "\n\n"
  + "Error: " + line + "\n" + message;
  alert(str);
  window.close();
  return true;
}

function Init() {
  var elmSelectedImage;
  var htmlSelectionControl = "Control";
  var globalDoc = window.dialogArguments;
  var grngMaster = globalDoc.selection.createRange();
  
  // event handlers  
  document.body.onkeypress = _CloseOnEsc;
  with(uploadImageForm){
	//btnOK.onclick = new Function("btnOKClick()");

	imageUrl.fImageLoaded = false;
  	imageUrl.intImageWidth = 0;
  	imageUrl.intImageHeight = 0;

  	if (globalDoc.selection.type == htmlSelectionControl) {
    	if (grngMaster.length == 1) {
      		elmSelectedImage = grngMaster.item(0);
      		if (elmSelectedImage.tagName == "IMG") {
        		imageUrl.fImageLoaded = true;
        		if (elmSelectedImage.src) {
          			imageUrl.value          = elmSelectedImage.src.replace(/^[^*]*(\*\*\*)/, "$1");  // fix placeholder src values that editor converted to abs paths
          			imageUrl.intImageHeight = elmSelectedImage.height;
          			imageUrl.intImageWidth  = elmSelectedImage.width;
          			txtHeight.value         = elmSelectedImage.vspace;
          			txtWidth.value        	= elmSelectedImage.hspace;
          			txtBorder.value         = elmSelectedImage.border;
          			displayText.value       = elmSelectedImage.alt;
          			txtAlign.value          = elmSelectedImage.align;
        		}
      		}
    	}
  	}
  }
<logic:notEmpty name="filePath">
	<%
	String width = (String)request.getAttribute("width");
	String height = (String)request.getAttribute("height");
	if(width==null) width = "";
	if(height==null) height = "";
	%>
	uploadImageForm.imageUrl.value='<bean:write name="filePath"/>';
	uploadImageForm.txtWidth.value='<%=width%>';
	uploadImageForm.txtHeight.value='<%=height%>';
	uploadImageForm.imgType[1].checked=true;
	btnOKClick();
</logic:notEmpty>
}

function _isValidNumber(txtBox) {
  var val = parseInt(txtBox);
  if (isNaN(val) || val < 0 || val > 999) { return false; }
  return true;
}

function btnOKClick() {
  var elmImage;
  var intAlignment;
  var htmlSelectionControl = "Control";
  var globalDoc = window.dialogArguments;
  var grngMaster = globalDoc.selection.createRange();
  
  // error checking
  
  with(uploadImageForm){
  
	  itype = "file";
  
  for (var i=0; i<imgType.length; i++){
  	if(imgType[i].checked)
	  	itype = imgType[i].value;
  }

  if (itype=="url" && (!imageUrl.value || imageUrl.value=="" || imageUrl.value == "http://")) { 
    alert("<bean:message key="UPLOAD_IMAGE_URL_TIP" bundle="html"/>");
    imageUrl.focus();
    return false;
  }
  if (itype=="file" && uploadFile.value=="") { 
    alert("<bean:message key="UPLOAD_IMAGE_PATH_TIP" bundle="html"/>");
    uploadFile.focus();
    return false;
  }
  if (txtWidth.value && !_isValidNumber(txtWidth.value)) {
    alert("<bean:message key="UPLOAD_IMAGE_WIDTH_TIP" bundle="html"/>");
    txtWidth.focus();
    return false;
  }
  if (txtBorder.value && !_isValidNumber(txtBorder.value)) {
    alert("<bean:message key="UPLOAD_IMAGE_BORDER_TIP" bundle="html"/>");
    txtBorder.focus();
    return false;
  }
  if (txtHeight.value && !_isValidNumber(txtHeight.value)) {
    alert("<bean:message key="UPLOAD_IMAGE_HEIGHT_TIP" bundle="html"/>");
    txtHeight.focus();
    return false;
  }
  if(itype=="file"){
  	btnOK.disabled=true;
  	uploadImageForm.submit();
  	return;
  }
  // delete selected content and replace with image
  if (globalDoc.selection.type == htmlSelectionControl && !imageUrl.fImageLoaded) {
    grngMaster.execCommand('Delete');
    grngMaster = globalDoc.selection.createRange();
  }
  idstr = "\" id=\"556e697175657e537472696e67";     // new image creation ID
  if (!imageUrl.fImageLoaded) {
    grngMaster.execCommand("InsertImage", false, idstr);
    elmImage = globalDoc.all['556e697175657e537472696e67'];
    elmImage.removeAttribute("id");
    elmImage.removeAttribute("src");
    grngMaster.moveStart("character", -1);
  } else {
    elmImage = grngMaster.item(0);
    if (elmImage.src != imageUrl.value) {
      grngMaster.execCommand('Delete');
      grngMaster = globalDoc.selection.createRange();
      grngMaster.execCommand("InsertImage", false, idstr);
      elmImage = globalDoc.all['556e697175657e537472696e67'];
      elmImage.removeAttribute("id");
      elmImage.removeAttribute("src");
      grngMaster.moveStart("character", -1);
      imageUrl.fImageLoaded = false;
    }
    grngMaster = _getTextRange(elmImage);
  }

  if (imageUrl.fImageLoaded) {
    elmImage.style.width = imageUrl.intImageWidth;
    elmImage.style.height = imageUrl.intImageHeight;
  }

  if (imageUrl.value.length > 2040) {
    imageUrl.value = imageUrl.value.substring(0,2040);
  }
  
  elmImage.src = imageUrl.value;
  
  if (txtWidth.value != "") { elmImage.width = parseInt(txtWidth.value); }

  if (txtHeight.value != "") { elmImage.height = parseInt(txtHeight.value); }
  
  elmImage.alt = displayText.value;

  if (txtBorder.value != "") { elmImage.border = parseInt(txtBorder.value); }
  else                       { elmImage.border = 0; }

  elmImage.align = txtAlign.value;
  
  }
  grngMaster.collapse(false);
  grngMaster.select();
  window.close();
}
</SCRIPT>
</HEAD>
<BODY id=bdy onload="Init()" style="background: threedface; color: windowtext;" scroll=no>
<html:form name="uploadImageForm" action="/uploadImage" type="dlog4j.formbean.UploadImageForm" enctype="multipart/form-data">
<font color="red"><html:errors/></font>
<table width="400" border=0>
<tr>
	<td colspan=2><bean:message key="UPLOAD_IMAGE_TYPE" bundle="html"/>: 
		<input type="radio" name="imgType" value="file" onclick="picfile.style.display='';picurl.style.display='none'" checked><bean:message key="UPLOAD_IMAGE_LOCAL" bundle="html"/>
		<input type="radio" name="imgType" value="url" onclick="picurl.style.display='';picfile.style.display='none'"><bean:message key="UPLOAD_IMAGE_LINK" bundle="html"/>
	</td>
    <td width="16%" rowspan="6" align="right" valign="top">
    <input name="button" type=submit id=btnOK onClick="return btnOKClick();" value="<bean:message key="OK" bundle="html"/>"><br><br>
    <input name="reset" type=reset id=reset onClick="window.close();" value="<bean:message key="CANCEL" bundle="html"/>"></td>
</tr>
<tr id=picurl style="display:none">
	<td colspan=2><bean:message key="UPLOAD_IMAGE_URL" bundle="html"/>:
		<html:text styleId="imageUrl" size="40" name="uploadImageForm" property="imageUrl" tabindex="1" onfocus="select()"/>
	</td>
  </tr>
<tr id=picfile >
	<td colspan=2><bean:message key="UPLOAD_IMAGE_PATH" bundle="html"/>:
		<html:file styleId="uploadFile" size="30" name="uploadImageForm" property="uploadFile" onfocus="select()"/>
	</td>
  </tr>
<tr>
	<td colspan=2><bean:message key="UPLOAD_IMAGE_ALT" bundle="html"/>:
		<html:text styleId="displayText" size="40" name="uploadImageForm" property="displayText" onfocus="select()"/>
	</td>
  </tr>
<tr>
  <td colspan="2" valign="top"><hr size="1"></td>
  </tr>
<tr>
	<td width="43%" valign="top">
	<FIELDSET style="padding-left:4px;height:65px"><LEGEND><bean:message key="UPLOAD_IMAGE_ALIGN_BORDER" bundle="html"/> </LEGEND>
		<bean:message key="UPLOAD_IMAGE_ALIGN" bundle="html"/>:
		
		<SELECT size=1 id="txtAlign" name="txtAlign">
			<OPTION id=optNotSet value="" SELECTED> Not set </OPTION>
			<OPTION id=optLeft value=left> Left </OPTION>
			<OPTION id=optRight value=right> Right </OPTION>
			<OPTION id=optTexttop value=textTop> Texttop </OPTION>
			<OPTION id=optAbsMiddle value=absMiddle> Absmiddle </OPTION>
			<OPTION id=optBaseline value=baseline> Baseline </OPTION>
			<OPTION id=optAbsBottom value=absBottom> Absbottom </OPTION>
			<OPTION id=optBottom value=bottom> Bottom </OPTION>
			<OPTION id=optMiddle value=middle> Middle </OPTION>
			<OPTION id=optTop value=top> Top </OPTION>
		</SELECT>
 		<bean:message key="UPLOAD_IMAGE_BORDER" bundle="html"/>:
		<html:text styleId="txtBorder" name="uploadImageForm" property="txtBorder" size="3" maxlength="3" onfocus="select()"/>
	</FIELDSET>
	</td>
	<td width="41%" valign="top">
		<fieldset style="padding-left:4px;height:65px"><legend><bean:message key="UPLOAD_IMAGE_SIZE" bundle="html"/></legend>
		<bean:message key="UPLOAD_IMAGE_WIDTH" bundle="html"/>:
		<html:text styleId="txtWidth" name="uploadImageForm" property="txtWidth" size="3" maxlength="3" onfocus="select()"/> <bean:message key="UPLOAD_IMAGE_PIXEL" bundle="html"/>
		<br>
		<bean:message key="UPLOAD_IMAGE_HEIGHT" bundle="html"/>:
		<html:text styleId="txtHeight" name="uploadImageForm" property="txtHeight" size="3" maxlength="3" onfocus="select()"/> <bean:message key="UPLOAD_IMAGE_PIXEL" bundle="html"/>
	</fieldset>
	</td>
  </tr>
</table>
</html:form>

</BODY>
</HTML>