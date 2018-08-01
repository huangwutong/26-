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
<html STYLE="width: 432px; height: 160px; ">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><bean:message key="INSERT_MM_TITLE" bundle="html"/></title>
<head>
<style>
  html, body, button, div, input, select, td, fieldset,legend { font-family:  "Verdana", "Arial"; font-size: 12px; };
</style>
<script>

// if we pass the "window" object as a argument and then set opener to
// equal that we can refer to dialogWindows and popupWindows the same way
opener = window.dialogArguments;

var _editor_url = opener._editor_url;
var objname     = location.search.substring(1,location.search.length);
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
}

function _isValidNumber(txtBox) {
  var val = parseInt(txtBox);
  if (isNaN(val) || val < 0 || val > 9999) { return false; }
  return true;
}

function btnOKClick() {
  var curRange = editdoc.selection.createRange();

  // error checking
  var checkList = ['url','txtWidth','txtHeight'];
  for (var idx in checkList) {
    var fieldname = checkList[idx];
    if (document.all[fieldname].value == "") {
      alert("You must specify a value for the '" +fieldname+ "' field!");
      document.all[fieldname].focus();
      return;
    }
  }

  // delete selected content (if applicable)
  if (editdoc.selection.type == "Control" || curRange.htmlText) {

    if (!confirm("Overwrite selected content?")) { return; }

    curRange.execCommand('Delete');
    curRange = editdoc.selection.createRange();
  }


  // create audio/media palyer

  var player1 = '<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer ';
       player1 += 'width=' + document.all.txtWidth.value;
       player1 += ' height=' + document.all.txtHeight.value +'>';
	   player1 += '<param name=ShowStatusBar value=-1><param name=Filename value=' + document.all.url.value + '>';
	   player1 += '<embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp '
	   player1 += 'src=' + document.all.url.value + ' width=' + document.all.txtWidth.value + ' height=' + document.all.txtHeight.value + ' autostart=' + document.all.autoplay.checked + '></embed></object>';

  var player2 = '<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX ';
       player2 += 'width=' + document.all.txtWidth.value;
       player2 += ' height=' + document.all.txtHeight.value +'>';
	   player2 += '<PARAM NAME=SRC VALUE=' + document.all.url.value +'>';
	   player2 += '<PARAM NAME=CONSOLE VALUE=Clip1>';
	   player2 += '<PARAM NAME=CONTROLS VALUE=imagewindow>';
	   player2 += '<PARAM NAME=AUTOSTART VALUE=' + document.all.autoplay.checked + '>';
	   player2 += '</OBJECT>';
	   player2 += '<OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width=' + document.all.txtWidth.value + '>';
	   player2 += '<PARAM NAME=SRC VALUE=' + document.all.url.value + '>';
	   player2 += '<PARAM NAME=AUTOSTART VALUE=' + document.all.autoplay.checked + '>';
	   player2 += '<PARAM NAME=CONTROLS VALUE=controlpanel>';
	   player2 += '<PARAM NAME=CONSOLE VALUE=Clip1>';
	   player2 += '</OBJECT>';

  var player3 = '<embed height=25 src=' + document.all.url.value + ' type=audio/x-pn-realaudio-plugin width=300 autostart=' + document.all.autoplay.checked + ' controls="PlayButton">';

// insert player
var filetype = document.all.url.value;
filetype=filetype.substring(filetype.lastIndexOf('.')+1,filetype.length);
if(filetype=='rm' || filetype=='rmvb'){
  opener.editor_insertHTML(objname, player2);
  }
if(filetype=='mp3' || filetype=='wma'){
  opener.editor_insertHTML(objname, player3);
  }
else{
  opener.editor_insertHTML(objname, player1);
  }

  // close popup window
  window.close();
}

function disSize(){
var filetype = document.all.url.value;
filetype=filetype.substring(filetype.lastIndexOf('.')+1,filetype.length);
	if(filetype=='mp3' || filetype=='wma'){
		document.all.txtWidth.disabled=true;
		document.all.txtHeight.disabled=true;
	}
}
</SCRIPT>
</HEAD>
<BODY id=bdy onload="Init()" style="background: threedface; color: windowtext; margin: 10px; BORDER-STYLE: none" scroll=no>
<table width="400" cellspacing="2" cellpadding="2" style="margin: 0 0 8 0">
  <tr> 
    <td colspan="2"><bean:message key="INSERT_MM_URL" bundle="html"/>: 
      <input name="url" type="text" value="http://" size="40" onblur="disSize()"></td>
    <td aling="center"><input name="button" type=submit id=btnOK onClick="btnOKClick();this.disabled=true" value="<bean:message key="OK" bundle="html"/>"></td>
  </tr>
  <tr>
    <td valign="top"><fieldset style="padding-left:4px; height:70px">
      <legend><bean:message key="INSERT_MM_PROPERTY" bundle="html"/></legend>
	  <input type="checkbox" name="autoplay" value="checkbox"> <bean:message key="INSERT_MM_AUTO" bundle="html"/>
	  </fieldset></td>
    <td valign="top"><fieldset style="padding-left:4px; height:70px">
      <legend><bean:message key="INSERT_MM_SIZE" bundle="html"/></legend>
      <bean:message key="INSERT_MM_WIDTH" bundle="html"/>: 
      <input id="txtWidth" name="uploadImageForm2" name="txtWidth" size="3" maxlength="3" onFocus="select()" value="400"/> 
   <bean:message key="INSERT_MM_PIXEL" bundle="html"/>    <br>
      <bean:message key="INSERT_MM_HEIGHT" bundle="html"/>: 
      <input id="txtHeight" name="uploadImageForm" name="txtHeight" size="3" maxlength="3" onFocus="select()" value="300"/>
      <bean:message key="INSERT_MM_PIXEL" bundle="html"/>
      </fieldset></td>
    <td valign="top" aling="center"><input name="reset" type=reset id=reset onClick="window.close();" value="<bean:message key="CANCEL" bundle="html"/>"></td>
  </tr>
</table>
</BODY>
</HTML>