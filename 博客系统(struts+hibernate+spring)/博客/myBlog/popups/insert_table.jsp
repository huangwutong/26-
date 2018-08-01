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
<html STYLE="width: 432px; height: 168px; ">
<head><title><bean:message key="INSERT_TABLE_TITLE" bundle="html"/></title><head>
<style>
  html, body, button, div, input, select, td, fieldset { font-family:  "Verdana", "Arial"; font-size: 12px; };
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
  var checkList = ['rows','cols','border','cellspacing','cellpadding'];
  for (var idx in checkList) {
    var fieldname = checkList[idx];
    if (document.all[fieldname].value == "") {
      alert("You must specify a value for the '" +fieldname+ "' field!");
      document.all[fieldname].focus();
      return;
    }
    else if (!_isValidNumber(document.all[fieldname].value)) {
      alert("You must specify a number between 0 and 9999 for '" +fieldname+ "'!");
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


  // create table
  var table = '<table border="' +document.all.border.value+ '"'
            + ' cellspacing="' +document.all.cellspacing.value+ '"'
            + ' cellpadding="' +document.all.cellpadding.value+ '"'
            + ' width="' +document.all.width.value + document.all.widthExt.value+ '"'
            + ' align="' +document.all.alignment.value+ '">\n';

  for (var x=0; x<document.all.rows.value; x++) {
    table += " <tr>\n";
    for (var y=0; y<document.all.cols.value; y++) {
      table += "  <td>&nbsp;</td>\n";
    }
    table += " </tr>\n";
  }
  table += "</table>\n";

  // insert table
  opener.editor_insertHTML(objname, table);


  // close popup window
  window.close();
}
</SCRIPT>
</HEAD>
<BODY id=bdy onload="Init()" style="background: threedface; color: windowtext; margin: 10px; BORDER-STYLE: none" scroll=no>

<table border=0 cellspacing=0 cellpadding=0 style="margin: 0 0 8 0">
 <tr>
  <td><bean:message key="INSERT_TABLE_ROW" bundle="html"/>: &nbsp;</td>
  <td><input type="text" name="rows" value="4"  style="width: 50px" maxlength=4></td>
 </tr>
 <tr>
  <td><bean:message key="INSERT_TABLE_COL" bundle="html"/>:</td>
  <td><input type="text" name="cols" value="3"  style="width: 50px" maxlength=4></td>
  <td width=10>&nbsp;</td>
  <td><bean:message key="INSERT_TABLE_WIDTH" bundle="html"/>: &nbsp;</td>
  <td>
   <input type="text" name="width" value="100" style="width: 50px" maxlength=4>
   <select name="widthExt">
    <option value=""><bean:message key="INSERT_TABLE_PIXEL" bundle="html"/></option>
    <option value="%" selected><bean:message key="INSERT_TABLE_PERCENT" bundle="html"/></option>
   </select>
  </td>
 </tr>
</table>


<FIELDSET style="width: 1%; text-align: center">
<LEGEND><bean:message key="INSERT_TABLE_LAYOUT" bundle="html"/></LEGEND>

<table border=0 cellspacing=6 cellpadding=0>
 <tr>
  <td height=21><bean:message key="INSERT_TABLE_ALIGN" bundle="html"/>:</td>
  <td>
   <select name="alignment" size=1>
   <option value="">Not set</option>
   <option value="left">Left</option>
   <option value="right">Right</option>
   <option value="textTop">Texttop</option>
   <option value="absMiddle">Absmiddle</option>
   <option value="baseline">Baseline</option>
   <option value="absBottom">Absbottom</option>
   <option value="bottom">Bottom</option>
   <option value="middle">Middle</option>
   <option value="top">Top</option>
   </select>
  </td>
 </tr>
 <tr>
  <td><nobr><bean:message key="INSERT_TABLE_BORDER" bundle="html"/></nobr></td>
  <td><input type="text" name="border" value="1" size=4 style="width: 100%"></td>
 </tr>
</table>
</FIELDSET>


<FIELDSET style="width: 1%; text-align: center">
<LEGEND><bean:message key="INSERT_TABLE_SPACE" bundle="html"/></LEGEND>

<table border=0 cellspacing=6 cellpadding=0>
 <tr>
  <td><nobr><bean:message key="INSERT_TABLE_CELLSPACING" bundle="html"/>:</nobr></td>
  <td><input type="text" name="cellspacing" value="1" style="width: 50px" maxlength=4></td>
 </tr>
 <tr>
  <td><nobr><bean:message key="INSERT_TABLE_CELLPADDING" bundle="html"/>:</nobr></td>
  <td><input type="text" name="cellpadding" value="2" style="width: 50px" maxlength=4></td>
 </tr>
</table>
</FIELDSET>


<div style="left: 340px; top: 16px; position: absolute">
 <BUTTON style="width: 7em; height: 2.2em; margin: 0 0 3 0" type=submit onclick="btnOKClick()"><bean:message key="OK" bundle="html"/></BUTTON><br>
 <BUTTON style="width: 7em; height: 2.2em; " type=reset onClick="window.close();"><bean:message key="CANCEL" bundle="html"/></BUTTON>
</div>

</BODY>
</HTML>