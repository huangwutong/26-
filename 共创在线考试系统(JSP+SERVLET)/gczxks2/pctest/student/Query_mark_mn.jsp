<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>

<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!Connection con;
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
    //Tools.showalert(studentID,out);
    if(studentID==null){
        throw new Exception();
    }

}catch(Exception e){
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);
}

try{
    con=DBCon.getConnection();
    //获取考生的计算机等级信息
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
    //查询该计算机等级的正式考试信息
    sql="select * from mn_test where grade_note='"+gradenote+"' order by begin_date" ;
    try{
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
    }
    catch(SQLException se){
        out.print("<br> query mn_test error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query mn_test error sql="+sql);
        out.print("<br>"+e.toString());
    }
	//查询考生的所有正式考试情况
%>



<HTML><HEAD><TITLE>正式考试成绩查询</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK
href="../common/css/style.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2462.0" name=GENERATOR>
</HEAD>
<BODY link="#0000FF" vlink="#0000FF" alink="#0000FF">
　
<P align="center"><strong> 选择正式考试</strong></P>
<div align="center">

  <table bordercolor=#d3add1 height=226 width="38%" border=1>
    <tbody>
      <tr>
        <td align="center" valign=middle background=images/lvbgcolor.gif>
		<%for(int i=0;i<tests.size();i++){
            mn_test t=(mn_test)tests.elementAt(i);
        %>

		<p align="left"><B><FONT color=#333300>
		<a href="Query_mark_mn_detail.jsp?stuID=<%=studentID%>&mn_testID=<%=t.id%>"
                 title="<%=t.name%>"  target="_blank" class="word">
		  ★</a><a href="Query_mark_mn_detail.jsp?stuID=<%=studentID%>&mn_testID=<%=t.id%>"
                 title="<%=t.name%>"  target="_self" class="word"><%=t.name%></a><a href="Query_mark_mn_detail.jsp?stuID=<%=studentID%>&mn_testID=<%=t.id%>"
                 title="<%=t.name%>"  target="_self" class="word">		</a></FONT></B></p>
        <%}%>        </td>
      </tr>
    </tbody>
  </table>
  <p class="word">&nbsp;</p>
</div>
  <P> </P>
<P>&nbsp;</P>
<P>&nbsp;</P>

</BODY></HTML>
<%}
catch(Exception e){
    System.out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>