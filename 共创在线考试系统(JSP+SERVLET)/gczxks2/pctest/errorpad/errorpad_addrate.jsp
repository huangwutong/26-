<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
%>
<%
String strPage=request.getParameter("OnPage");
String errorpad_grade=request.getParameter("Grade");

String errorpad_sub=request.getParameter("Subject");
String errorpad_knowpoint=request.getParameter("KnowPoint");
String errorpad_testtype=request.getParameter("testtype");
String errorpad_errorcount=request.getParameter("errorcount");

if(debug){
    out.print("<br>grade="+errorpad_grade+
    "<br>sub="+errorpad_sub+
    "<br>knowpoint="+errorpad_knowpoint+
    "<br>testtype="+errorpad_testtype+
    "<br>errorcunt="+errorpad_errorcount);
}

if(errorpad_grade!=null)
{
    session.setAttribute("errorpad_grade",errorpad_grade);
}
else
{
    errorpad_grade=(String)session.getAttribute("errorpad_grade");
}
if(errorpad_sub!=null)
{
    session.setAttribute("errorpad_sub",errorpad_sub);
}else
{
    errorpad_sub=(String)session.getAttribute("errorpad_sub");
}
if(errorpad_knowpoint!=null)
{
    session.setAttribute("errorpad_knowpoint",errorpad_knowpoint);
}
else
{
    errorpad_knowpoint=(String)session.getAttribute("errorpad_knowpoint");
}
if(errorpad_testtype!=null)
{
    session.setAttribute("errorpad_testtype",errorpad_testtype);
}
else
{
    errorpad_testtype=(String)session.getAttribute("errorpad_testtype");
}
if(errorpad_errorcount!=null)
{
    session.setAttribute("errorpad_errorcount",errorpad_errorcount);
}
else
{
    errorpad_errorcount=(String)session.getAttribute("errorpad_errorcount");
}
String [] ids=request.getParameterValues("id");
if(ids==null){
     Tools.showalert("请您选择欲删除的知识点!",out);
    Tools.goback(out);
}else
{

String sql;
StringBuffer sb=new StringBuffer();

for(int i=0;i<ids.length;i++){
    sb.append(ids[i]+",");
}
sql=sb.toString().substring(0,sb.length()-1);
sql="update errorpad set errorcount=errorcount+1 where id in ("+sql+")";

if(debug){
    out.print("<br>sql="+sql);
}
try{
    Connection con=DBCon.getConnection();
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.executeUpdate();
    pstmt.close();
    if(debug){
        out.print("<BR>delete errorpad sql="+sql);
    }

        response.sendRedirect("errorpad.jsp?page="+strPage);
        //Tools.showJS("window.open('admin_subject.jsp','_self')",out);
    }
    catch(SQLException se){
        out.println(se.toString());
    }
    catch(Exception e){
        out.print(e.toString());
    }
    finally{
        DBCon.dropConnection();
    }
}

%>
