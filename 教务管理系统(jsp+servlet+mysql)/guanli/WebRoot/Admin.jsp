<%@ page contentType="text/html;charset=gb2312"%>

<HTML><HEAD><TITLE>��������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>
TD {
	FONT-SIZE: 12px; COLOR: #000000
}
INPUT {
	FONT-SIZE: 12px; COLOR: #000000
}
SELECT {
	FONT-SIZE: 12px; COLOR: #000000
}
TD.nav {
	FILTER: DropShadow( Color=#ffffff, OffX=1, OffY=1)
}
TD.nav A {
	COLOR: #000000; TEXT-DECORATION: none
}
TD.nav A:hover {
	COLOR: #000000
}
p1 {
	FONT-SIZE: 12px
}
p2 {
	FONT-SIZE: 12px; LINE-HEIGHT: 130%
}
p3 {
	FONT-SIZE: 14px
}
p4 {
	FONT-SIZE: 14px; LINE-HEIGHT: 130%
}
p5 {
	FONT-SIZE: 12px; LINE-HEIGHT: 180%
}
p6 {
	LINE-HEIGHT: 240%
}
p7 {
	COLOR: #404642; LINE-HEIGHT: 150%
}
.text {
	COLOR: #3c3c3c; LINE-HEIGHT: 180%
}
.text1 {
	FONT-SIZE: 14px; COLOR: #3c3c3c; LINE-HEIGHT: 180%
}
A:link {
	COLOR: #000000
}
A:visited {
	COLOR: #000000
}
A:hover {
	COLOR: #000000
}
.STYLE2 {color: #316AC5}
</STYLE>

<META content="MSHTML 6.00.2800.1106" name=GENERATOR></HEAD>
<BODY leftMargin=0 background="images/qback1.gif" topMargin="0" 
marginheight="0" marginwidth="0">
<% if(request.getSession().getAttribute("username")== null){
%>
	<script>
		top.location.href="Admin_Login.jsp";
	</script>    
<%}
%>
<TABLE width=720 height="122" border=0 align=center cellPadding=0 cellSpacing=0>
  <TBODY>
  <TR>
   
    <TD width="720" height="122"><img src="images/top.jpg" width="760" height="122">
	<!--TABLE cellSpacing=0 cellPadding=0 align=right border=0>
        <TBODY>
        <TR>
          <TD>&nbsp;</TD>
      </TR></TBODY></TABLE-->	  </TD>
    <TD width=10 ><BR></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=761 align=center border=0>
  <TBODY>
  <TR>
    <!--TD width=1 bgColor=#615f64><BR></TD-->
    <TD width=150 bgcolor = "#8BA9E5" height=37>
	  <span class="STYLE2">
	  <FONT color=#0000ff 
      size=2>
      <MARQUEE onmouseover=this.stop() onmouseout=this.start() 
      scrollDelay=200><A>��ǰλ�ã�<A 
      href="http://localhost:8080/jiaowu/Admin.jsp">��̨������ҳ</A></A></MARQUEE></FONT>
	  
	 
	  </span></TD>
    <TD width=703 bgcolor = "#8BA9E5"> <SCRIPT language=javaScript>      
<!--      
now = new Date(),hour = now.getHours()      
if(hour < 6){document.write("�賿��!")}      
else if (hour < 9){document.write("&nbsp; <font color=black style='font-size: 9pt'>���Ϻ�!")}      
else if (hour < 12){document.write("&nbsp; <font color=black style='font-size: 9pt'>�����!")}      
else if (hour < 14){document.write("&nbsp; <font color=black style='font-size: 9pt'>�����!")}      
else if (hour < 17){document.write("&nbsp; <font color=black style='font-size: 9pt'>�����!")}      
else if (hour < 19){document.write("&nbsp; <font color=black style='font-size: 9pt'>�����!")}      
else if (hour < 22){document.write("&nbsp; <font color=black style='font-size: 9pt'>���Ϻ�!")}      
else {document.write("&nbsp; <font color=black style='font-size: 9pt'>ҹ���!")}      
// -->      
              </SCRIPT>
	  <SCRIPT language=JavaScript>    
<!---   
today=new Date();   
var hours = today.getHours();   
var minutes = today.getMinutes();   
var seconds = today.getSeconds();   
var timeValue = "<FONT COLOR=black>" + ((hours >12) ? hours -12 :hours); timeValue += ((minutes < 10) ? "<BLINK><FONT COLOR=black>:</FONT></BLINK>0" : "<BLINK><FONT COLOR=black>:</FONT></BLINK>") + minutes+"</FONT></FONT>";   
timeValue += (hours >= 12) ? "<FONT COLOR=blue><I><B>pm</B></I></FONT>" : "<FONT COLOR=blue><B><I>am</I></B></FONT>";   
function initArray(){   
this.length=initArray.arguments.length   
for(var i=0;i<this.length;i++)   
this[i+1]=initArray.arguments[i]  }   
var d=new initArray("<font color=RED>������","<font color=black>����һ","<font color=black>���ڶ�","<font color=black>������","<font color=black>������","<font color=black>������","<font color=red>������"); document.write("<font color=black>������&nbsp; ",today.getYear(),"<font color=black>��","<font color=black>",today.getMonth()+1,"<font color=black>��","<font color=black>",today.getDate(),"<font color=black>�� </FONT>&nbsp; ",d[today.getDay()+1]," ",timeValue);  //-->   
              </SCRIPT></TD>
    <td width="2"></TD></TR></TBODY></TABLE>
<TABLE cellSpacing="0" cellPadding="0" width="759" align="center" border="0">
  <TBODY>
  <TR>
    <TD width="758"><IMG height="10" src="images/qleft1.jpg" width="273" border="0"></TD>

  </TR></TBODY></TABLE>
<TABLE cellSpacing="0" cellPadding="0" width="760" align="center" border="0">
  <TBODY>
  <TR>
    <TD width=1 height="309" bgColor=#615f64></TD>
    <TD vAlign=top  background="images/cc.jpg"  width=204>
	<!--IMG height=337 src="images/qleft3.jpg" width=204 border=0-->
	<font size=2 color=black><center>
	<p>
    <img src="images/jt.gif" />��½����
    <hr>
    <p>
    <a href="user/list.do" >�û�����</a>  
    <p>
    <p>
    <img src="images/jt.gif" />�ļ�����
    <hr>
    <p>
    <a href="file/file_upload.jsp" >�ϴ��ļ�</a>  
    <p>
    <a href="file/list.do" >�ļ�����</a></center>
	</font>
    </TD>
    <TD vAlign=top align=left width=553>
      <TABLE height=319 cellSpacing=0 cellPadding=0 width=520 border=0>
        <TBODY>
        
       
        <TR>
          <TD height="319" vAlign=top bgColor=#ffffff><BR>
            <TABLE cellSpacing=0 cellPadding=0 align=center border=0>
              <TBODY>
              <TR>
                <TD width=35><IMG height=24 src="images/qcorner.gif" 
                  width=35 border=0></TD>
                <TD width=290 
background=images/qline2.gif><B>��̨������</B></TD>
              <TD width=140 
            background=images/qline3.gif></TD></TR></TBODY></TABLE><BR>
              <table width="90%" height="270" 
border=0 align=center cellpadding=0 cellspacing=0>
                <tbody>
                  <tr>
                    <td height="270" class=text><p><img height=139 src="images/aa.gif" 
                  width=205 align=right border=0>1.����Ա��½��ɶ��Լ�������и��� </p>
                      <p>2.����Ա��½������ӹ���Ա��Ȩ��<p>3.ѡ���ϴ����ϡ����Խ��ж����ϵ��ϴ�����<p>4.����Ա�����ں�̨�����õ����Ͻ���ɾ��
					  <br>                    
                        </p></td>
                  </tr>
                </tbody>
              </table></TD>
        </TR>
       </TBODY></TABLE>
      <B><BR></B></TD>
<TD width=2 bgColor=#615f64></TD>
  </TR></TBODY></TABLE>

      
   
	<center>
	  <p>����ְҵ����ѧԺ-���ѧԺ </p>
	 </center>
</body>
</html>
