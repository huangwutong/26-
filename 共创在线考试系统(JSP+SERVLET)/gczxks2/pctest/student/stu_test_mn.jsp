<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0041)http://jsptestonline.cosoft.org.cn/senior/none_xt.jsp -->

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

%>
<HTML><HEAD><TITLE>考试系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK
href="../common/css/style.css" type=text/css rel=stylesheet>


<META content="MSHTML 6.00.2722.900" name=GENERATOR>
</HEAD>
<BODY bgColor=#ffffff text=#000000 vlink="#0000FF">
<CENTER>

  
  <!--begin 内容区 -->
  <table width="770" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top" align="center">
      <td> <br>
        <br>

        <table width="540" border="0" cellpadding="2" cellspacing="1" bgcolor="#d3add1" class="tboutline">
		<tr bgcolor="#FFFFFF">
            <td colspan="5" align="center" class="word"><strong>
			<%
			sql="select * from mn_test where  status=2 and grade_note='"+gradenote+"' "+
    "  order by begin_date";
stmt=con.createStatement();
rs=stmt.executeQuery(sql);
if(!rs.next())
{
out.println("无正式考试信息！");
}
rs.close();
stmt.close();
			%>			
			</strong></td>
		</tr>
        <%
//查询该计算机等级(gradenote)的正式考试信息
//正在进行的正式考试
sql="select * from mn_test where  status=2 and grade_note='"+gradenote+"' and "+
    "begin_date<=CURRENT_DATE  order by begin_date";
stmt=con.createStatement();
rs=stmt.executeQuery(sql);
while(rs.next()){
%>
    <tr bgcolor="#FFFFFF">
            <td colspan="5" class="tbulleft">
            <a href="mn_test.jsp?mn_testID=<%=rs.getInt("id")%>&stuID=<%=studentID%>"
                        title="<%=rs.getString("name")%>"
				  		target="_blank">★ </a><a href="mn_test.jsp?mn_testID=<%=rs.getInt("id")%>&stuID=<%=studentID%>"
                        title="<%=rs.getString("name")%>"
				  		target="mainFrame"><%=rs.getString("name")%></a><a href="mn_test.jsp?mn_testID=<%=rs.getInt("id")%>&stuID=<%=studentID%>"
                        title="<%=rs.getString("name")%>"
				  		target="_blank">				  </a>

            &nbsp;</td>
          </tr>
<%

}
rs.close();
stmt.close();
//未来进行的正式考试
sql="select * from mn_test where status=2 and grade_note='"+gradenote+"' and "+
    "begin_date>CURRENT_DATE  order by begin_date";
stmt=con.createStatement();
rs=stmt.executeQuery(sql);
while(rs.next()){
%>
          <tr bgcolor="#FFFFFF">
            <td colspan="5" class="tbulleft">★ <%=rs.getString("name")%></td>
          </tr>
<%

}
rs.close();
stmt.close();
%>
      </table>	  </td>
    </tr>
  </table>
  <!--end 内容区 -->
  <!--begin bottom -->
  <!--end bottom --></CENTER></BODY></HTML>
<%}
catch(Exception e){
    System.out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>
