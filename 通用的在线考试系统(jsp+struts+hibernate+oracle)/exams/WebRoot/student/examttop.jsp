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
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" text="#666666" link="#336699" vlink="#cc6699" alink="#ffcc33" onLoad="MM_preloadImages('../image2/p_01.gif')">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="../image2/bg_top.jpg"><img src="../image2/spacer.gif" width="1" height="25"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="../image2/spacer.gif" width="10" height="1"></td>
    <td width="510"><img src="../image2/obj_sitetitle.gif" width="207" height="29"></td>
    <td>新东方一搏<br>
      长春人民大街7043号<br>
      TEL 0431-85339455</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="../image2/obj_bar.gif"><img src="../image2/spacer.gif" width="1" height="25"></td>
  </tr>
</table>
<table width="770" height="445" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top" width="100">
      <br>
      <br>
     </td>
    <td width="10"><img src="../image2/spacer.gif" width="10" height="1"></td>
    <td valign="top" width="692" colspan="2">          