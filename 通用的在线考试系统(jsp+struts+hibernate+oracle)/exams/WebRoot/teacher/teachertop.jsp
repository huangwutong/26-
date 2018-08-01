<%@ page language="java" pageEncoding="GB18030"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<title>考试系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<link type="text/css" href="<%=request.getContextPath()%>/style.css" rel="stylesheet"  />
<html:base/>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" text="#666666" link="#336699" vlink="#cc6699" alink="#ffcc33" onLoad="MM_preloadImages('../image/p_01.gif')">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="../image/bg_top.jpg"><img src="../image/spacer.gif" width="1" height="25"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="../image/spacer.gif" width="10" height="1"></td>
    <td width="510"><img src="../image/obj_sitetitle.gif" width="207" height="29"></td>
    <td>新东方一搏<br>
      长春人民大街7043号<br>
      TEL 0431-85339455</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="../image/obj_bar.gif"><img src="../image/spacer.gif" width="1" height="25"></td>
  </tr>
</table>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="5"><img src="../image/spacer.gif" width="5" height="1"></td>
    <td width="18" valign="top"> 
      <table width="18" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="25"><img name="menu01" border="0" src="../image/spacer.gif" width="18" height="15"></td>
        </tr>
        <tr> 
          <td height="25"><img name="menu02" border="0" src="../image/spacer.gif" width="18" height="15"></td>
        </tr>
        <tr> 
          <td height="25"><img name="menu03" border="0" src="../image/spacer.gif" width="18" height="15"></td>
        </tr>
        <tr> 
          <td height="25"><img name="menu04" border="0" src="../image/spacer.gif" width="18" height="15"></td>
        </tr>
        <tr> 
          <td height="25"><img name="menu05" border="0" src="../image/spacer.gif" width="18" height="15"></td>
        </tr>
        <tr> 
          <td height="25"><a href="#"><img name="menu06" border="0" src="../image/spacer.gif" width="18" height="15"></a></td>
        </tr>
      </table>    </td>
    <td background="../image/line_tate.gif" width="10"><img src="../image/spacer.gif" width="10" height="1"></td>
    <td valign="top" width="100"> 
      <table width="100" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><html:link page="/teacher/student/show.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('menu01','','../image/p_01.gif',1)"><img src="../image/bt_01.gif" width="100" height="25" border="0"></html:link></td>
        </tr>
        <tr> 
          <td><html:link page="/teacher/subject/show.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('menu02','','../image/p_01.gif',1)"><img src="../image/bt_02.gif" width="100" height="25" border="0"></html:link></td>
        </tr>
        <tr> 
          <td><html:link page="/teacher/result/query.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('menu03','','../image/p_01.gif',1)"><img src="../image/bt_03.gif" width="100" height="25" border="0"></html:link></td>
        </tr>
        <tr> 
          <td><html:link page="/teacher/log/show.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('menu04','','../image/p_01.gif',1)"><img src="../image/bt_04.gif" width="100" height="25" border="0"></html:link></td>
        </tr>
        <tr> 
          <td><html:link page="/teacher/admin/show.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('menu05','','../image/p_01.gif',1)"><img src="../image/bt_05.gif" width="100" height="25" border="0"></html:link></td>
        </tr>
        <tr> 
          <td><html:link page="/teacher/logout.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('menu06','','../image/p_01.gif',1)"><img src="../image/bt_06.gif" width="100" height="25" border="0"></html:link></td>
        </tr>
      </table>
      <br>
      <br></td>
    <td width="10"><img src="../image/spacer.gif" width="10" height="1"></td>
    <td valign="top" width="770" height="439">