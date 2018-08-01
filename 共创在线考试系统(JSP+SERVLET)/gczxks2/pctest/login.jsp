<%@ page contentType="text/html;charset=GB2312" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<HTML>
<HEAD>
<base href="<%=basePath%>">
<script type="text/javascript" src="common/js/calendar/sys.js"></script>
<TITLE>用户登陆对话框</TITLE>

<SCRIPT language=javascript id=clientEventHandlersJS>
<!--

function form1_onsubmit() {

 if(form1.logname.value==''){
   alert('用户名不能为空！');
   form1.logname.focus();
   return false;
 }
 if(form1.password.value==''){
   alert('密码不能为空！');
   form1.password.focus();
   return false;
 }
 return true;
}

function openreg(){
window.open("TesterReg.jsp");

}



//-->
</SCRIPT>
<LINK href="common/css/studio.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1458" name=GENERATOR>
<style type="text/css">
<!--
.style3 {
	font-size: 24px;
	font-weight: bold;
}
-->
</style>
</HEAD>
<BODY>
<FORM language=javascript name=form1 onSubmit="return form1_onsubmit()"
action="CheckUser.jsp" method=post>
<TABLE height=460 width=462 align=center
border=0>
  <TBODY>
  <tr>
    <td width="656" align="center" ><img src="images/onlinetest.gif" width="208" height="72"><div align="center"><span class="style3">计算机等级应用基础在线测试系统</span></div></td>
  </tr>
  <tr><td height="16" width="560" class="login"><strong></strong></td>
  </tr>
  <TR>
    <TD height="316">
      <TABLE width="100%" height="330"
      border=0 align=center cellPadding=5 cellSpacing=1 background="images/login.gif" class=biao>
        <TBODY>
        <TR>
          <TD width=390 height="217">
            <TABLE class=biao cellSpacing=1 cellPadding=5 width="100%" align=center 
      border=0>
        <TBODY>
        <TR>
          <TD width=382>
            <DIV align=center>
            <P>&nbsp;</P>
            <P><BR>
              <input 
            name=logrole type=radio 
             value=student checked language=javascript>
              应试人
              <INPUT 
            name=logrole 
             type=radio value=teacher language=javascript> 
出题人 
              <INPUT language=javascript 
             type=radio value=admin 
            name=logrole> 
              管理员</P>
            </DIV></TD></TR>
        <TR>
          <TD><BR>　　　　　　　　
          用户： 
            <INPUT class=login id=logname maxLength=20 
            size=20 name=logname> </TD></TR>
        <TR>
          <TD>　　　　　　　　 密码： 
            <INPUT class=login id=password type=password 
            maxLength=20 size=20 name=password> </TD></TR>
        <TR>
          <TD>
            <DIV align=center>
              <input name="originalURI" type="hidden" id="originalURI" value=""/>
              <BR><INPUT class=unnamed1 type=submit value=登陆 name=Submit/> 
<INPUT class=unnamed1 type=reset value=重置 name=Submit2> 
        
            <INPUT class=unnamed1 type=button value=注册 name=Submit22 onClick="openreg()"/>
            </DIV></TD></TR></TBODY></TABLE></TD></TR>
        </TBODY></TABLE></TD></TR></TBODY></TABLE>
<P>&nbsp;</P></FORM></BODY></HTML>
