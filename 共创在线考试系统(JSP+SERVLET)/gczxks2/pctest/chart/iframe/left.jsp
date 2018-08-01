<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>

<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!
Connection con;
boolean debug=false;
String studentID="";
String gradenote="";
Statement stmt=null;
ResultSet rs=null;
String sql="";
class mn_test{
    int id;
    String name;
    String gradenote;
	int flag;//1:complete;2:uncomplete;3:do not any test;
    public String toString(){
        String temp="";
        temp="<br> id="+id+"<br> gradenote="+gradenote+"<br> name="+name;
        return temp;
   }
};
%>
<%
Vector tests=new Vector();
try{
    studentID=(String)session.getAttribute("studentID");
    if(studentID==null){
        throw new Exception();
    }

}catch(Exception e){
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    Tools.showJS("window.open('../../login.jsp','_parent')",out);
}

try{
    con=DBCon.getConnection();
    //获取考生的计算机等级信息
    sql="select id,gradenote from UserInfo where vcUserNo='"+studentID+"'";

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

    //查询该计算机等级的正式考试信息
    sql="select * from mn_test where grade_note='"+gradenote+"' order by begin_date" ;

        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            mn_test t=new mn_test();
			t.flag=0;
            t.id=rs.getInt("id");
            t.name=rs.getString("name");
            t.gradenote=rs.getString("grade_note");
            tests.addElement(t);
        }
        rs.close();
        stmt.close();
        if(debug){
            out.print(tests.toString());
        }

	//查询考生的所有正式考试情况
%>




<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<META NAME="DESCRIPTION" CONTENT="考试系统－成绩统计图表">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Window-target" CONTENT="_top">
<title>考试系统－成绩统计图表</title>
<link rel="stylesheet" href="../common/style.css" type="text/css">
</head>
<body bgcolor="#EEEEEE" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#EEEEEE">
  <tr>
    <td colspan="2" height="15">&nbsp;</td>
  </tr>
  <tr>
    <td width="15"> <br>
      <br>
    </td>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
        <tr>
          <td width="24" height="22">
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#EEEEEE"><img src="../images/0cir.gif" width="24" height="22"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="400" valign="top" bgcolor="#FFFFFF">
            <table width="80%" border="0" cellspacing="3" cellpadding="0" align="center">
			<tr>
                <td width="35" height="40" align="center"><img src="../images/personinfo.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300> <a href="../abandon_session.jsp">★Abort
                  Session</a> </FONT> </td>
        </tr>
              <%for(int i=0;i<tests.size();i++){
            mn_test t=(mn_test)tests.elementAt(i);
        %>
                <tr>
                <td width="35" height="40" align="center"><img src="../images/icon_splccx.gif" width="32" height="32"></td>
                <td height="40"> <FONT color=#333300> <a href="../stu_mn_chart.jsp?stuID=<%=studentID%>&mn_testID=<%=t.id%>"
                 title="<%=t.name%>"   target="mainFrame"> ★ <%=t.name%> </a></FONT>
                </td>
        </tr>

         <%}%>


            </table>
		  <p>&nbsp;</p></td>
        </tr>
        <tr>
          <td width="24" height="22">
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#EEEEEE"><img src="../images/0cir_bl.gif" width="24" height="22"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="2" height="15">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<%}
catch(SQLException se){
    out.print("<br> sql error sql="+sql);
    out.print("<br>"+se.toString());

}
catch(Exception e){
    System.out.print(e.toString());
    out.print("<br>  sql="+sql);
    out.print("<br>"+e.toString());
}
finally{
    DBCon.dropConnection();
}
%>