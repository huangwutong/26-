<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="jinghua.*"%>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!
String studentID;
boolean debug=false;
StringBuffer dbmsg=new StringBuffer();
%>
<%
//StudentID
try{
    studentID=(String)session.getAttribute("studentID");
    //Tools.showalert(studentID,out);
    if(studentID==null){
        throw new Exception();
    }

}catch(Exception e){
    Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);
}

//studentID=1;

String gradeID=""+request.getParameter("Grade");
String subjectID=""+request.getParameter("Subject");
String knowpointID=""+request.getParameter("KnowPoint");
gradeID=gradeID.trim();
subjectID=subjectID.trim();
knowpointID=knowpointID.trim();


String sql="";
String title="";
String strClass="";
ResultSet rs=null;

try{
    Connection con=DBCon.getConnection();

    sql="select grade.name as gn,subject.name as sn, knowpoint.name as kn "+
        "from grade,subject,knowpoint where grade.note="+"'"+gradeID+"'"+" and subject.id="+
        subjectID+" and knowpoint.id="+knowpointID;
    PreparedStatement pstmt=con.prepareStatement(sql);

    rs=pstmt.executeQuery();
    if(rs.next()){
        strClass="������ȼ�:"+rs.getString("gn")+"<br>��Ŀ:"+rs.getString("sn")+"<br>֪ʶ��:"
            +rs.getString("kn");
    }
    if(debug){
        out.print(strClass);
    }
    pstmt.close();
    rs.close();

    sql="select id,paper,title from test where status=2 and gradenote="+"'"+gradeID+"'"+" and subid="+subjectID+
        " and ((knowpointid1="+knowpointID+") or (knowpointid2="+knowpointID+
        ") or (knowpointid3="+knowpointID+")) order by id";

    pstmt=con.prepareStatement(sql);
    rs=pstmt.executeQuery();

if(debug) {
    dbmsg.append("<br>sql="+sql);
    out.print(dbmsg.toString());
}

if (rs.next()){//���������ļ�¼   //����ID@��@����@���׶�;   һ������ĸ�ʽ���ԷֺŽ���

    rs.beforeFirst();
 %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK
href="../common/css/style.css" type=text/css rel=stylesheet>
<title>��Ԫ����-ѡ������</title>
</head>

<body text=black bgColor=white leftMargin=0 topMargin=10 marginheight="0"
marginwidth="0">

<DIV align=center>
<FORM name="form1" action="UnitTestPaper.jsp" method="post">
<TABLE cellSpacing=0 cellPadding=0 width=760 align=center border=0>
  <TBODY>
  <TR>
          <TD vAlign=top bgColor=#fbffee> <P>����&nbsp;</P></TD>
    <TD vAlign=top width=480>
      <TABLE width=480 border=0 cellPadding=0 cellSpacing=0 class="tboutline">
            <TBODY>
              <TR align=middle>
                <TD height=30 align="left" class=p2>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p><strong><B><%=strClass%>
                    </B> </strong> </p>
                  <p>&nbsp;</p></TD>
              </TR>
             <%while(rs.next()){%>
              <TR bgColor=#cccc99 class="trcolor">

                  <TD class=p2 height=30> <P><B><FONT color=#333300>

				  <a href="UnitTestPaper.jsp?testID=<%=rs.getInt("ID")%>&stuID=<%=studentID%>"
                        title="<%=rs.getString("title")%>"
				  		target="mainFrame">�� <%=rs.getString("title")%>
				  </a></FONT></B></P></TD>
              </TR>
                    <TR>
                        <TD class=p2><P>&nbsp;</P></TD>
                    </TR>

            <%
            }
            rs.close();
            pstmt.close();
            %>
            </TBODY>
          </TABLE></TD>
          <TD vAlign=top width=140 bgColor=#fbffee>&nbsp;</TD>
      </TR></TBODY></TABLE>
	  </FORM>
</DIV>

</body>
</html>
<%
}else{
    Tools.showalert("û�д����ݿ��ҵ������������Ծ��������趨��ѯ����",out);
    //Tools.goback(out);

}
}catch(SQLException e){
    out.print("<br>SQL Error:sql="+sql+"<br>"+e.toString());
}catch(Exception e){
    out.print(e.toString() );
}

finally{
    DBCon.dropConnection();
}
%>




