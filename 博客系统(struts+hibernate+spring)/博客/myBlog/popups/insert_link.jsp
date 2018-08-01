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
<html STYLE="width: 432px; height: 150px; ">
<head><title><bean:message key="INSERT_LINK_TITLE" bundle="html"/></title><head>
<style>
  html, body, button, div, input, select, td, fieldset { font-family:  "Verdana", "Arial"; font-size: 12px; };
  input { width:200px}
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
  var checkList = ['url','urltext','opentype'];
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


  // create link
  var link = '<a href="' +document.all.url.value+ '"' + ' target="' +document.all.opentype.value+ '">';
  link += document.all.urltext.value;
  link += "</a>";

  // insert link
  opener.editor_insertHTML(objname, link);


  // close popup window
  window.close();
}
</SCRIPT>
</HEAD>
<BODY id=bdy onload="Init()" style="background: threedface; color: windowtext; margin: 10px; BORDER-STYLE: none" scroll=no>
<table width="400" cellspacing="2" cellpadding="2" style="margin: 0 0 8 0">
  <tr> 
    <td><bean:message key="INSERT_LINK_URL" bundle="html"/>:
      <input name="url" type="text" value="http://" onkeyup="urltext.value=this.value"></td>
    <td><BUTTON style="width: 7em; height: 2.2em; margin: 0 0 3 0" type=submit onclick="btnOKClick()"><bean:message key="OK" bundle="html"/></BUTTON></td>
  </tr>
  <tr> 
    <td><bean:message key="INSERT_LINK_LABEL" bundle="html"/>: 
      <input type="text" name="urltext"></td>
    <td><BUTTON style="width: 7em; height: 2.2em; " type=reset onClick="window.close();"><bean:message key="CANCEL" bundle="html"/></BUTTON></td>
  </tr>
  <tr> 
    <td><bean:message key="INSERT_LINK_OPEN_TYPE" bundle="html"/>: 
      <select name="opentype">
        <option value="_blank" selected><bean:message key="INSERT_LINK_NEW_WIN" bundle="html"/></option>
        <option><bean:message key="INSERT_LINK_THIS_WIN" bundle="html"/></option>
      </select></td>
    <td>&nbsp;</td>
  </tr>
</table>
</BODY>
</HTML>