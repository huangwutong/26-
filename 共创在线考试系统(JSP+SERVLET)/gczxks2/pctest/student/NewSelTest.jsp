<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"  import="jinghua.*" errorPage="" %>
<
<HTML><HEAD><TITLE>�������߲���)</TITLE>

<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>

<jsp:useBean id="Tools" class="jinghua.Tools" scope="session">
</jsp:useBean>
<%
PreparedStatement pstmt=null;
String title=null;
Statement stmt=null;
String sql=null;
String temp=null;
ResultSet rs=null;
int studentID=-1;
StringBuffer msgsb=new StringBuffer("OK");
Connection con=null;
//un_debug
try{//ȡ�ؿ�����ID��
  studentID=((Integer)session.getAttribute("studentID")).intValue();
}catch(Exception e){
  msgsb.append("teacherID Error\n");
}

String questTypeID=request.getParameter("QuestType");//��������ID
int subjectID=Integer.parseInt(request.getParameter("Subject"));//��ĿID
String gradeID=request.getParameter("Grade");//������ȼ�ID
String testPointID=request.getParameter("TestPoint");//���Ե�ID
String difficulty=request.getParameter("Difficulty");//�Ѷ�
int knowPointID=Integer.parseInt(request.getParameter("KnowPoint"));//֪ʶ��ID
int testNum=Integer.parseInt(request.getParameter("testnum"));


//ȡ������


sql="select name from subject where id="+subjectID;
con=DBCon.getConnection();
stmt=con.createStatement();
rs=stmt.executeQuery(sql);
String tt;
if (rs.next()){
	tt=rs.getString("name");
	//title=Tools.codestring(tt);
	title=tt;
}
rs.close();
stmt.close();
stmt=con.createStatement();
sql="select name from knowpoint where id="+knowPointID;
rs=stmt.executeQuery(sql);
if(rs.next()){
	tt=rs.getString("name");
	title+=" :"+tt;
}

sql="SELECT   `question`.`ID`,  `question`.`QuestText`,  `question`.`Mark`, " +
"  `question`.`Answer`,  `question`.`Tip`"+
" FROM   `question` " +
" WHERE  (`question`.`SubjectID` ="+subjectID+")  AND   " +
"((`question`.`KnowPointID1` = "+knowPointID+") OR (`question`.`KnowPointID2` = "+knowPointID+") OR (`question`.`KnowPointID3` = "+knowPointID+")) ";
//String t1[]=request.getParameterValues("QuestType");
//String t2[]=request.getParameterValues("TestPoint");
stmt=con.createStatement();
rs=stmt.executeQuery(sql);

%>

<SCRIPT language=JavaScript>
<!--

function SymError()
{
  return true;
}

window.onerror = SymError;

//-->
</SCRIPT>



<STYLE type=text/css>A:link {
	COLOR: #ef7321; TEXT-DECORATION: none
}
A:hover {
	COLOR: #666666; TEXT-DECORATION: underline
}
A:visited {
	COLOR: #666666; TEXT-DECORATION: none
}
BODY {
	FONT-SIZE: 9pt; FONT-FAMILY: "����"
}
H2 {
	COLOR: #cc6600; FONT-FAMILY: "����"
}
TD {
	FONT-SIZE: 9pt; COLOR: #666666; FONT-FAMILY: "����"
}
</STYLE>
</HEAD>
<BODY bgColor=#FFFFFF leftMargin=30>
<CENTER>
  <H2><font color="#74a8d1eF"><strong><a name="anchor"></a>�������߲���</strong></font></H2>
</CENTER>
<HR width="60%">
<!--����ѡ��<BR>
��A��B��C���ĸ�ѡ���У�ѡ����������հ״�����Ѵ𰸡� --><br>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
    <TR>
      <TD width=4 bgColor=#b6e2fc height=366></TD>
      <TD vAlign=top> <TABLE height=8 cellSpacing=0 width="100%" align=center border=0>
          <TBODY>
            <TR>
              <TD vAlign=top height=238> <FORM name=exam action=#>
                  <TABLE borderColor=#0a81e7 cellSpacing=0 cellPadding=4
                  width="100%" align=center border=0>
                    <TBODY>
                      <TR bgColor=#b6e2fc>
                        <TD width="43%" height=34> <DIV align=center><font color="#000000" size=2>�������<%=title%></font></DIV></TD>
                        <TD height=34> <DIV align=center></DIV>
                          <DIV align=center><FONT color="#00000" size=2>����ʱ�䣺</FONT><FONT
                        color=#80ff80>
                            <INPUT size=10 name=input1>
                            </FONT></DIV></TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                </FORM>

            <FORM name=exam1 action=student/Marks.jsp method=post>
              <CENTER>
                    <DIV align=center> </DIV>
                  </CENTER>
                  <DIV align=left>
                    <TABLE borderColor=#999999 height=133 cellSpacing=0
                  cellPadding=0 width="100%" align=center bgColor=#ffffff
                  border=0>
                      <TBODY>
                        <TR align=middle>
                          <TD vAlign=top align=middle height=89> <TABLE cellSpacing=0 cellPadding=0 width="100%"
border=0>
                              <TBODY>
							<% int i=1;
							  while (rs.next() && i<testNum){
							%>
                                <TR>
                                  <TD align="left" bgColor=#b6e2fc><font color="#00000">

                                    <%out.print("("+i+")"+".");%>
                                    </font></TD>
                                </TR>

                                <TR>
                                  <TD valign="top">
								    <%
									    out.print(rs.getString("QuestText"));

									%>
								  &nbsp;</TD>
                                </TR>


						<%
						rs.next();
						i++;
						}
						rs.close();
						stmt.close();
						%>


                            </TABLE>
                            <DIV align=center>
                              <INPUT style="FONT-SIZE: 9pt; FONT-FAMILY: ����" type=submit value=��Ҫ������ name=Submit>
                              <INPUT name=Reset type=reset onClick="MM_goToURL('parent','#anchor');return document.MM_returnValue" value=��Ҫ���>
                              <INPUT type=reset value=��Ҫ���� name=Reset2>
                              <BR>
                            </DIV></TD>
                        </TR>

                    </TABLE>
                  </DIV>
                </FORM></TD>
            </TR>

        </TABLE></TD>
      <TD width=4 bgColor=#b6e2fc></TD>
    </TR>
    <TR>
      <TD width=4 bgColor=#b6e2fc></TD>
      <TD> <DIV align=center>��<A onclick=javascript:window.close(1)
            href="http://202.113.13.168/netclass/test/bookexam.php?class=%B4%F3%D1%A7%CB%C4%BC%B6#">�رմ���</A>��</DIV></TD>
      <TD width=4 bgColor=#b6e2fc></TD>
    </TR>
    <TR>
      <TD bgColor=#b6e2fc height=4></TD>
      <TD bgColor=#b6e2fc height=4></TD>
      <TD bgColor=#b6e2fc height=4></TD>
    </TR>
  </TBODY>
</TABLE>
<P>&nbsp;
<TABLE width=100% border=0 align="center" cellPadding=0 cellSpacing=0>
  <TBODY>
  <TR>
    <TD width=194>&nbsp;</TD>
      <TD width=178 vAlign=bottom>��Ȩ���У�<A href="http://jsptestonline.cosoft.org.cn/"
            target=_blank>������������</A></TD>
      <TD vAlign=bottom width=304>��
        <div align="left"><img src="/image/line_index.gif" width="160" height="45"></div></TD>
    </TR></TBODY></TABLE>
<CENTER></CENTER></BODY></HTML>
