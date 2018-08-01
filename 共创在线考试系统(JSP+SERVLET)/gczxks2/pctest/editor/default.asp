<% 
   if request("submit")="提交" then 
      Response.Write (request("content"))
   end if      
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
<!--
function abc()
{
    document.form1.doc_html.value = document.form1.cont.value

	return true
}
function CheckForm()
{
	document.form1.content.value=document.form1.doc_html.value;
    
	return true
}

//-->
</script>
<title>文件在线编辑器</title>
</head>

<body onload="javascript:abc()">
<form method="POST" action="" name="form1" onsubmit="return CheckForm()">
<table width="760" border="0" align="center" cellpadding="2" cellspacing="2">
  <tr>
    <td>主题：</td>
    <td><input name="title" type="text" id="title" size="68">
    </td>
  </tr>
  <tr>
    <td>内容：</td>
    <td colspan="2">
<OBJECT id=doc_html style="LEFT: 0px; TOP: 0px" data=edit.jsp width=760  height=320 type=text/x-scriptlet  VIEWASTEXT>
         <embed src="edit.jsp" width="760" height="320"></embed> 
</OBJECT>
<textarea style="display:none" name="cont">
<%=content%>
</textarea>
<input type="hidden" name="content" value="">
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <div align="center">
        <input name="Submit" type="submit" value="提交">
&nbsp;
        <input type="reset" name="Submit2" value="重置">
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
