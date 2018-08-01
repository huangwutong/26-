<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD id=Head1>
<TITLE>Top</TITLE>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">

<STYLE type=text/css> 
*{
	 COLOR: white
}
#logo {
	COLOR: white
}
#logo A {
	COLOR: white
}
FORM {
	MARGIN: 0px
}
</STYLE>
<SCRIPT src="Top.files/Clock.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY 
style="BACKGROUND-IMAGE: url(../images/bg.gif); MARGIN: 0px; BACKGROUND-REPEAT: repeat-x">
<%
	/* 获得了session的id */
     String id1 = session.getId();    
     String id =(String) session.getAttribute("id");  
     if(id==null){
     id = "admin";
     }
%>

<form id="form1">
  <DIV id=logo 
style="BACKGROUND-IMAGE: url(../images/logo.png); BACKGROUND-REPEAT: no-repeat">
    
    <DIV style="PADDING-RIGHT: 50px; BACKGROUND-POSITION: right 50%; DISPLAY: block; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(../images/bg_banner_menu.gif); PADDING-BOTTOM: 0px; PADDING-TOP: 3px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 30px; TEXT-ALIGN: right">
	<SPAN style="PADDING-RIGHT: 50px">
      <A href="javascript:history.go(-1);"><IMG src="Top.files/nav_back.gif"  border=0>后退</A> 
      <IMG src="Top.files/menu_seprator.gif" align=absMiddle>
      <A href="javascript:history.go(1);"><IMG  src="Top.files/nav_forward.gif" border=0>前进</A>   
 	</DIV>
 	
    <DIV style="DISPLAY: block; HEIGHT: 53px"><h1>计算机协会会员信息管理平台</h1>
    </DIV>
    <DIV style="BACKGROUND-IMAGE: url(../images/bg_nav.gif); BACKGROUND-REPEAT: repeat-x; HEIGHT: 30px">
      
      <TABLE cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
          <TR>
            <TD>
              <DIV><IMG src="Top.files/nav_pre.gif" align=absMiddle> 
              <SPAN id=lblBra>管理员 ： <%=id%>
              </SPAN>
              </DIV>
            </TD>
            <TD align=right width="70%"> 
            <IMG src="Top.files/menu_seprator.gif" align=absMiddle>
            <SPAN id=clock></SPAN></TD>
          </TR>
        </TBODY>
      </TABLE>
    </DIV>
    
  </DIV>
  <SCRIPT type=text/javascript>
    var clock = new Clock();
    clock.display(document.getElementById("clock"));
</SCRIPT>
</form>
</BODY>
</HTML>
