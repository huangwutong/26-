<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=gb2312"%>
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head> 
<title>『错误页面』</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<!--end Java-->

<!--css info(editable)-->
<style>
A:visited{TEXT-DECORATION: none}
A:active{TEXT-DECORATION: none}
A:hover{TEXT-DECORATION: underline overline}
A:link{text-decoration: none;}
.t{LINE-HEIGHT: 1.4}
BODY{FONT-FAMILY: 宋体; FONT-SIZE: 9pt;
SCROLLBAR-HIGHLIGHT-COLOR: buttonface;
SCROLLBAR-SHADOW-COLOR: buttonface;
SCROLLBAR-3DLIGHT-COLOR: buttonhighlight;
SCROLLBAR-TRACK-COLOR: #eeeeee;
SCROLLBAR-DARKSHADOW-COLOR: buttonshadow}
TD,DIV,form,OPTION,P,TD,BR{FONT-FAMILY: 宋体; FONT-SIZE: 9pt} 
INPUT{BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #cccccc; PADDING-BOTTOM: 1px; BORDER-TOP-COLOR: #cccccc; PADDING-TOP: 1px; HEIGHT: 18px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #cccccc}
textarea, select {border-width: 1; border-color: #000000; background-color: #efefef; font-family: 宋体; font-size: 9pt; font-style: bold;}
TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }
TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px; color: #000000; }
.select {FONT-SIZE: 9pt; WIDTH: 150px}
.jumpto {FONT-SIZE: 9pt; WIDTH: 150px}
</style>
<!--end css info-->
</head>
<body bgcolor="#FFFFFF" text="#000000" background="image/error1.gif">
<br>
<table cellpadding=0 cellspacing=0 border=0 width=100% align=center>
 <tr>
  <td width=30% rowspan=2 valign=top>
   <img src="image/mainlogo.gif" border=0>
  </td>
  <td valign=top align=left>
     <font face="宋体" color=#000000>
     <img src="image/closedfold.gif" border=0>　<a href="index.jsp">『返回首页』</a><br>
     <img src="image/bar.gif" border=0><img src="image/openfold.gif" border=0>　错误页面
     </font>
  </td>
 </tr>
</table>
<br>
<table cellspacing="0" cellpadding="5" style="border: 2 solid #336699" width=100% align=center>
 <tr>
  <td>
   <table cellpadding=6 cellspacing=1 border=0 width=100%>
    <tr>
     <td align=center><img src="image/error3.jpg" width="257" height="56"></td>
    </tr>
    <tr>
     <td>
      <font color=#000000><img src="image/error2.gif" width="25" height="20">
       <b>关于出现错误的详细原因：</b>
       <ul>
        <li>
         <b><%=exception.getMessage()%></b><br><br>
        <li>如果您无法确定错误类型，请向版主报告错误。或发Email到<a href="mailto:2rich@2rich.net">乐趣工作室『2rich 』</a>
       </ul>
      </font>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
</body>
</html>