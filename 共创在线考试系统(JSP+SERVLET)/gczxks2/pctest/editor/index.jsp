<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ļ����߱༭��</title>
<script language="JavaScript" type="text/JavaScript">
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}

function check()
{
	var strFileName=form1.FileName.value;
	var FileType;
	var ImgWH;
	if (strFileName=="")
	{
    	alert("��ѡ��Ҫ�ϴ����ļ�");
    	return false;
	}
        return true;
}
function loadForm()
{
  editor.HtmlEdit.document.body.innerHTML=document.myform.Content.value;
  return true
}
function subchk()
{
document.form1.content.value= window.editor.getHTML();
}

function insertHtml(HtmlCode)
{
var win=window.editor.Composition.document;//���б༭������gledit.jsp�е�һ��iframe��id��idEditbox
window.editor.Composition.focus();//�Ǳ༭����ý��㣬��ֹ��������ڱ༭����ط�
win.selection.createRange().pasteHTML(HtmlCode)//�ڹ���λ�ò���html����
}
function tempfun(msg)
{
  insertHtml("<img src='/test/editor/pic/20030915170559718.gif' border=0>");
}
</SCRIPT>

</head>


<body>
<p><a href="http://www.cnmaya.org" target="_blank"><img src="images/mayalogo.gif" width="88" height="31" border="0"></a></p>
<p>&nbsp;</p>
<form name="form1" method="post" action=""  onsubmit=" subchk()">
<table width="760" border="0" align="center" cellpadding="2" cellspacing="2">
  <tr>
    <td>���⣺</td>
    <td><input name="title" type="text" id="title" size="68">
    </td>
  </tr>
  <tr>
    <td>���ݣ�</td>
    <td colspan="2">
      <!--object id=doc_html style="LEFT: 0px; TOP: 0px" data=edit.jsp width=544 height=320 type=text/x-scriptlet  viewastext>
      </object-->
      <IFRAME SRC="edit.jsp" id='editor' frameborder=0 scrolling=0 width=544 height=321>
      </IFRAME>
<textarea name="Content" style="display:none"></textarea>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <div align="center">
        <input name="Submit" type="submit" value="�ύ">
&nbsp;
        <input type="reset" name="Submit2" value="����">
        <input name="temp" type="button" id="temp"  onClick="tempfun('asdd')" value="temp" >
        <input name="btn" type="button" id="btn" onClick="MM_popupMsg('tef')" value="��ť">
        </div>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</form>
<div align="center">
  <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><div align="center"><font size="-1">Copyright (C) 2003 <a href="http://www.itmaya.com/bbs" target="_blank">www.cnmaya.org</a> </font></div></td>
    </tr>
  </table>
</div>
</body>
</html>
