<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<script language=javascript type="">
  function switchSysBar(){
    if (switchPoint.innerText==3){
      switchPoint.innerText=4
      document.all("frmTitle").style.display="none"
    }
    else{
      switchPoint.innerText=3
      document.all("frmTitle").style.display=""
    }
  }
</script>

<script type="">
  function hideAll() {
    for(i=0;i<odiv.length;i++) {
      odiv[i].style.display="none";
    }
  }

  function showObj(num) {
    if (odiv[num].style.display=="none") {
      hideAll();
      odiv[num].style.display="inline";
    }
    else {
      odiv[num].style.display="none";
    }
  }
</script>

<%//以上是仿XP操作系统的效果的JS代码%>
<SCRIPT LANGUAGE="JavaScript" type="">
<!--
  function out(){
     if(confirm("<bean:message key="Article.Exit.js"/>"))
       return true;
     else
       return false;
  }
//-->
</SCRIPT>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>left</title>
<LINK href="/News/css/css.css" type=text/css rel=stylesheet>
</head>
<body bgcolor="#799ae1">

<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr><td height="20"></td></tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
<tr>
<td width="134" height=25 valign="middle" background="images/bg.GIF" class=menu_title>
<a href="index.jsp" target=_top><span>&nbsp;<bean:message key="Article.desk"/>
</span></a>&nbsp;&nbsp;<B>|</B><a href="/News/view_admin/login_index.jsp" target="_top" onClick="return out();">&nbsp;<bean:message key="Article.out"/></a></td>
<td width="25"><img src="images/quit.GIF" width="25" height="25"></td>
</tr>
</table>


<br>
<table cellpadding=0 cellspacing=0 width=158 align=center style="CURSOR: hand" onclick="showObj(0)">
<tr>
<td width="134" height=25 valign="middle" background="images/bg.GIF" class=menu_title>
<span>&nbsp;&nbsp;<bean:message key="Article.manage"/></span> </td>
<td width="25"><img src="images/hide.GIF" width="25" height="25" id=ss1></td>
</tr>
</table>
<div id="odiv" style="display:none">
<table cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20 valign="middle"><html:link href="/News/article_Action.do?method=show" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle"><bean:message key="Article.add"/></html:link></td></tr>
<tr><td height=20><html:link href="/News/article_Action.do?method=search" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle"><bean:message key="Article.list"/></html:link></td></tr>
<tr><td height=20><html:link href="/News/article_Action.do?method=searchClass" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle"><bean:message key="Article.class"/></html:link></td></tr>
</table>
</div>
<br>



<table cellpadding=0 cellspacing=0 width=158 align=center style="CURSOR: hand" onclick="showObj(1)">
<tr>
<td width="134" height=25 valign="middle" background="images/bg.GIF" class=menu_title >
<span>&nbsp;&nbsp;产品管理</span> </td>
<td width="25"><img src="images/hide.GIF" width="25" height="25" id=ss1></td>
</tr>
</table>
<div id="odiv" style="display:none">
<table cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20 valign="middle"><html:link href="/News/product_Action.do?method=show" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">产品发布</html:link></td></tr>
<tr><td height=20 valign="middle"><html:link href="/News/product_Action.do?method=searchPage" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">产品操作</html:link></td></tr>
<tr><td height=20 valign="middle"><html:link href="/News/view_admin/productbigclass_add.jsp" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">大类添加</html:link></td></tr>
<tr><td height=20 valign="middle"><html:link href="/News/productSmallClass_Action.do?method=searchProductBigClass" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">小类添加</html:link></td></tr>
<tr><td height=20 valign="middle"><html:link href="/News/productBigClass_Action.do?method=searchAllProductBigClass" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">类别管理</html:link></td></tr>
</table>
</div>
<br>



<table cellpadding=0 cellspacing=0 width=158 align=center style="CURSOR: hand" onclick="showObj(2)">
<tr>
<td width="134" height=25 valign="middle" background="images/bg.GIF" class=menu_title>
<span>&nbsp;&nbsp;系统设置</span> </td>
<td width="25"><img src="images/hide.GIF" width="25" height="25" id=ss1></td>
</tr>
</table>
<div id="odiv" style="display:none">
<table cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20><html:link href="/News/admin_Action.do?method=searchAdminList" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">人员权限设置</html:link></td></tr>
<tr><td height=20><a href="/News/admin_Action.do?method=toAdmin" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">管理员添加</a></td></tr>
<tr><td height=20><a href="/News/view_admin/jspcheck.jsp" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">服务器参数</a></td></tr>
</table>
</div>
<Br>



<table cellpadding=0 cellspacing=0 width=158 align=center style="CURSOR: hand" onclick="showObj(3)">
<tr>
<td width="134" height=25 valign="middle" background="images/bg.GIF" class=menu_title>
<span>&nbsp;&nbsp;全文检索测试配置</span></td>
<td width="25"><img src="images/hide.GIF" width="25" height="25" id=ss1></td>
</tr>
</table>
<div id="odiv" style="display:none">
<table cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20><a href="/News/view_admin/serverparam.html" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">参数设置</a></td></tr>
</table>
</div>
<BR>



<table cellpadding=0 cellspacing=0 width=158 align=center style="CURSOR: hand" onclick="showObj(4)">
<tr>
<td width="134" height=25 valign="middle" background="images/bg.GIF" class=menu_title>
<span>&nbsp;&nbsp;全文检索设置</span></td>
<td width="25"><img src="images/hide.GIF" width="25" height="25" id=ss1></td>
</tr>
</table>
<div id="odiv" style="display:none">
<table cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20><a href="/News/view_admin/entrance.jsp" target="main"><IMG SRC="images/folder.gif"  WIDTH="47" HEIGHT="17" BORDER="0" align="absmiddle">全文检索</a></td></tr>
</table>
</div>
<BR>



<div align="center">
<table cellpadding="0" cellspacing="0" border="0"><tr><td align="right" bgcolor="#FFFFFF"><img src="images/ty_2.jpg"></td></tr>
<tr><td><img src="images/ty_3.jpg"></td></tr>
</table>
</div>
<table border="0" cellpadding="0" cellspacing="0" width="100%" background="images/jindu.gif" height="28">
<tr>
<td>&nbsp;&nbsp;<font color=#FFFFFF><a href="mailto:21xionghua@163.com" target="_blank">&nbsp;<font color=#FFFFFF><bean:message key="Article.version"/></a></font></td>
</tr>
</table>
</body>
</html>
