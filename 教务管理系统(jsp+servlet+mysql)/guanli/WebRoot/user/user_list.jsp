<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="bean"  uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="logic"  uri="http://struts.apache.org/tags-logic" %> 

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
    <a href="../file/file_upload.jsp" >�ϴ��ļ�</a>  
    <p>
    <a href="../file/list.do" >�ļ�����</a></center>
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
background=images/qline2.gif><B>��̨����</B></TD>
              <TD width=140 
            background=images/qline3.gif></TD></TR></TBODY></TABLE><BR>
              <table width="90%" height="270" 
border=0 align=center cellpadding=0 cellspacing=0>
                <tbody>
                  <tr>
                    <td height="270" class=text><p>
					<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>�û�ά��</title>
		<link rel="stylesheet" href="../style/drp.css">
		<script type="text/javascript">
	
	function addUser() {
		window.self.location = "user_input.jsp";	
	}
	
	function modifyUser() {
		var count = 0;
		var j = 0;
		for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			if (document.getElementsByName("selectFlag")[i].checked) {
				j = i;
				count++;
			}
		}
		if (count == 0) {
			alert("��ѡ����Ҫ�޸ĵ��û���");
			return;
		}
		if (count > 1) {
			alert("һ��ֻ���޸�һ���û���");
			return;
		}
		if (count == 1) {
			window.self.location = "find.do?userId=" + document.getElementsByName("selectFlag")[j].value;
		}
	}
	
	function deleteUser() {
		var flag = false;
		for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			if (document.getElementsByName("selectFlag")[i].checked) {
				flag = true;
			}		
		}
		if (!flag) {
			alert("��ѡ����Ҫɾ�����û���");
			return;
		}
		if (window.confirm("ȷ��ɾ����")) {
			with (document.getElementById("userForm")) {
				method = "post";
				action = "del.do";
				submit();
			}
		}
	}
		
	function checkAll() {
		for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
		}
	}

</script>
	</head>

	<body class="body1">
		<form name="userform" id="userform">
			<div align="center">
				<table width="95%" border="0" cellspacing="0" cellpadding="0"
					height="35">
					<tr>
						<td class="p1" height="18" nowrap>&nbsp;
							
						</td>
					</tr>
					<tr>
						<td width="522" class="p1" height="17" nowrap>
							<img src="../images/mark_arrow_02.gif" width="14" height="14">
							&nbsp;
							<b>ϵͳ����&gt;&gt;�û�ά��</b>
						</td>
					</tr>
				</table>
				<hr width="100%" align="center" size=0>
			</div>
			<table width="95%" height="20" border="0" align="center"
				cellspacing="0" class="rd1" id="toolbar">
				<tr>
					<td width="49%" class="rd19">
						<font color="#FFFFFF">��ѯ�б�</font>
					</td>
					<td width="27%" nowrap class="rd16">
						<div align="right"></div>
					</td>
				</tr>
			</table>
			<table width="95%" border="1" cellspacing="0" cellpadding="0"
				align="center" class="table1">
				<tr>
					<td width="55" class="rd6">
						<input type="checkbox" name="ifAll" onClick="checkAll()">
					</td>
					<td width="119" class="rd6">
						�û�����
					</td>
					<td width="152" class="rd6">
						�û�����
					</td>
					<td width="166" class="rd6">
						��ϵ�绰
					</td>
					<td width="150" class="rd6">
						email
					</td>
					<td width="153" class="rd6">
						��������
					</td>
				</tr>
				<logic:empty name="userlist">
				<tr>
					<td class="rd8" colspan="6">
						<font color="red">û�з�������������</font>
					</td>
				</tr>	
				</logic:empty>
				<logic:notEmpty name="userlist">
					<logic:iterate id="user" name="userlist">
						<tr>
							<td class="rd8">
								<input type="checkbox" name="selectFlag" class="checkbox1"
									value="<bean:write name="user" property="userId"/>">
							</td>
							<td class="rd8">
								<bean:write name="user" property="userId" />
							</td>
							<td class="rd8">
								<bean:write name="user" property="userName" />
							</td>
							<td class="rd8">
								<bean:write name="user" property="contactTel" />
							</td>
							<td class="rd8">
								<bean:write name="user" property="email" />
							</td>
						    <td class="rd8">
								<bean:write name="user" property="createDate" format="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
					</logic:iterate>
				</logic:notEmpty>
			</table>
			<table width="95%" height="30" border="0" align="center"
				cellpadding="0" cellspacing="0" class="rd1">
				<tr>
					<td nowrap class="rd19" height="2">
						<div align="left">
							<font color="#FFFFFF">&nbsp;��&nbspxx&nbspҳ</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font color="#FFFFFF">��ǰ��</font>&nbsp
							<font color="#FF0000">x</font>&nbsp
							<font color="#FFFFFF">ҳ</font>
						</div>
					</td>
					<td nowrap class="rd19">
						<div align="right">
							<input name="btnAdd" type="button" class="button1" id="btnAdd"
								value="���" onClick="addUser()">
							<input name="btnDelete" class="button1" type="button"
								id="btnDelete" value="ɾ��" onClick="deleteUser()">
							<input name="btnModify" class="button1" type="button"
								id="btnModify" value="�޸�" onClick="modifyUser()">
						</div>
					</td>
				</tr>
			</table>
			<p>
				<center><a href="../Admin.jsp">����</a></center>
		
		</form>
					<br>                    
                      </p>
                      </td>
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
