<%@ page import="java.util.*,
	 java.sql.*,
	 java.lang.*" %>


<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!Connection con;
boolean debug=false;
String studentID="";
String gradenote="";
Statement stmt=null;
ResultSet rs=null;
String sql="";
%>
<%
try{
    studentID=(String)session.getAttribute("studentID");
    if(studentID==null){
        throw new Exception();
    }
}catch(Exception e){
    Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
   Tools.showJS("window.open('../login.jsp','_self')",out);
}


try{
    con=DBCon.getConnection();
    //��ȡ�����ļ�����ȼ���Ϣ
    //sql="select id,gradenote,grade.Name as gn "+
    //"from student  INNER JOIN grade ON (student.gradenote = grade.note) "+
    //" where stuid='"+studentID+"'";
    sql="select id,gradenote from UserInfo where vcUserNo='"+studentID+"'";

    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next()){
            gradenote=rs.getString("gradenote");
            rs.close();
            stmt.close();
        }
        if(debug){
            out.print("<br>stuID="+studentID+"<br>gradenote="+gradenote);
        }
    }
    catch(SQLException se){
        out.print("<br> query student error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query student error sql="+sql);
        out.print("<br>"+e.toString());
    }
    //--������ȼ�����Ŀ��֪ʶ�����������б������-->
    out.print(Tools.sub_know(con));
	
    out.print(Tools.grade_sub(con));
	





%>













<!--������ȼ�����Ŀ��֪ʶ�����������б������-->

<script language="JavaScript">
function changegs(locationid){
	document.myform.Subject.length =1;
        document.myform.KnowPoint.length =1;
        var locationid=locationid;
        var i;
        for (i=0;i < gscount; i++){
            if (grade_sub[i][0] == locationid) {
	            document.myform.Subject.options[document.myform.Subject.length] = new Option(grade_sub[i][2], grade_sub[i][1]);
            }
	}
}
</script>
<script language="JavaScript">
function changesk(locationid){
	document.myform.KnowPoint.length =1;
	var locationid=locationid;
	var i;
	for (i=0;i < gskcount; i++){
		if (grade_sub_know[i][1] == locationid){
			document.myform.KnowPoint.options[document.myform.KnowPoint.length] = new Option(grade_sub_know[i][3], grade_sub_know[i][2]);
		}
	}
}
</script>



<script language="javascript">
function CheckForm(f)
{

	if( f.testnumber.value.length<1)
	{
	    alert("��������������������!");
		return false;
	}

	if(!isNumberString(f.testnumber.value,"1234567890."))
	{
	    alert("�٣����������������˶���,����ô���������أ�\n");
	    return false;
	}else if(f.testnumber.value<10){
            alert("ÿ�β�������Ҫ��10������!!");
            return false;
	}else if(f.testnumber.value>100){
            alert("ѧ���ṩ���100������Ĳ���!!");
            return false;
	}


	if( !(f.testorder[0].checked || f.testorder[1].checked||f.testorder[2].checked) ) {
		alert("����û��ѡ�����˳��!")
		return false;
	}

	return true;
}

function isNumberString (InString,RefString)
{
if(InString.length==0) return (false);
for (Count=0; Count < InString.length; Count++)  {
	TempChar= InString.substring (Count, Count+1);
	if (RefString.indexOf (TempChar, 0)==-1)
	return (false);
}
return (true);
}
</script>





<HTML><HEAD><TITLE>����ϵͳ</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK
href="../common/css/style.css" type=text/css rel=stylesheet>


<META content="MSHTML 6.00.2722.900" name=GENERATOR>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 9px;
	font-weight: bold;
}
-->
</style>
</HEAD>
<BODY bgColor=#ffffff text=#000000 vlink="#0000FF"  >
<CENTER>

  

<TABLE cellSpacing=0 cellPadding=0 width=770 border=0>
  <TBODY>
  <TR>
    <TD width=620></TD>
    <TD align=right width=150></TD></TR></TBODY></TABLE>
  
  <!--begin ������ -->
  <table width="770" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top" align="center">
      
      <td> <p><br>
          <br>
        </p>
        <FORM action="free_test_paper.jsp" method="post" name="myform" target="mainFrame" id="myform" onSubmit="return CheckForm(this)">
          <table width="457" height="269" border="0" cellpadding="0" cellspacing="0" class="tboutline" style="BORDER-RIGHT: #cccccc 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #cccccc 1px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; BORDER-LEFT: #cccccc 1px solid; PADDING-TOP: 5px; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: #f3f3f3">
            <tr>
              <td height="48" colspan="5" align="center" valign="baseline" nowrap class="titlefont1">
                <p><font ><strong>��ѡ���������&nbsp;
                </strong></font></p>
                <p>&nbsp;</p></td>
    </tr>
    <tr>
              <td width="217" height="101" align="center" valign="baseline" nowrap>
                <table width="203" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="99" height="26" nowrap><font class="word" ><strong>������ȼ�:<br>
                    </strong></font></td>
                    <td width="7" nowrap><div align="center"><strong>&nbsp;</strong></div></td>
                    <td width="85" nowrap><font class="word" ><strong>��&nbsp;Ŀ:</strong></font></td>
                  </tr>
                  <tr>
                    <td height="42"><select id=select6 name=Grade onClick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
                    <option value="temp">--δѡ��--</option>
                      <%Tools.showGradeOption(con,out);%>
                    </select> </td>
                    <td> <div align="center"> </div></td>
                    <td><div align="left"><font size="+1"><strong>
                        <select name=Subject
size="1" id=select8 onclick="changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value)">
                          <option value="-1" selected>ȫ ��</option>
                          <%Tools.showGradeSubjectOption(con,gradenote,out);%>
                        </select>
                        </strong></font></div></td>
                  </tr>
              </table></td>
      <td width="146" align="center" valign="baseline" nowrap >
	  <table  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="26" nowrap><font class="word" ><strong>֪ʶ��:</strong></font></td>
          </tr>
          <tr>
            <td height="41"> <select name=KnowPoint id="select9">
                        <option value="-1" selected>----ȫ ��----</option>
                    </select> </td>
          </tr>
        </table></td>
              <td width="92" colspan="2" align="center" valign="baseline" nowrap>
<table height="69" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td nowrap><font class="word" ><strong>���׶�:</strong></font></td>
          </tr>
          <tr>
            <td> <select name=hard id="select10">
                <option value="1" selected>����</option>
                <option value="2">����</option>
                <option value="3">�е�</option>
                <option value="4">����</option>
              </select> </td>
          </tr>
        </table></td>
    </tr>
    <tr valign="middle">
              <td height="41" colspan="5" align="center" nowrap> <strong class="word">����˳��</strong>
                <input type="radio" name="testorder" value="1">
        ���˳��
        <input type="radio" name="testorder" value="2">
        ���ѵ���
        <input type="radio" name="testorder" value="3">
        ���׵���</td>
    </tr>
    <tr valign="middle">
              <td height="35" colspan="5" align="center" nowrap><font color="#000000"><strong>������</strong></font><strong>:</strong>
                <input name="testnumber" type="text" id="testnumber2" value="10" size="10">
              </td>
    </tr>
    <tr>
              <td colspan="5" align="center" valign="baseline" nowrap>
                <input name="testbegin" type="submit" class="s02" id="testbegin2"  value="�� ʼ">
              </td>
    </tr>
  </table>
</FORM></td>
    </tr>
  </table>
  <!--end ������ -->
  <!--begin bottom -->
  <!--end bottom --></CENTER></BODY></HTML>

<%            }
catch(Exception e){
    System.out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>

